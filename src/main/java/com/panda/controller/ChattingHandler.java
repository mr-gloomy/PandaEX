package com.panda.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.panda.service.ChatService;


@Component
public class ChattingHandler extends TextWebSocketHandler {
	
	// (<"bang_id", 방ID>, <"session", 세션>) - (<"bang_id", 방ID>, <"session", 세션>) - (<"bang_id", 방ID>, <"session", 세션>) 형태 
	private List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();
	
	
	@Inject
	ChatService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ChattingHandler.class);
	// 클라이언트가 서버로 메세지 전송 처리
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		super.handleTextMessage(session, message);
        
		// JSON --> Map으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);
		
		logger.info(mapReceive.toString());
		String id = (String)session.getAttributes().get("user_id");
		
		
		switch (mapReceive.get("cmd")) {
		
		// CLIENT 입장
		case "CMD_ENTER":
			// 세션 리스트에 저장
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bang_id", mapReceive.get("bang_id"));
			
			map.put("session", session);
			sessionList.add(map);
			map.put("send_id", id);
			map.put("receive_id", mapReceive.get("receive_id"));
			
			String bang_id = service.getRoom(map);
			
			if (bang_id!=null) {
				List msgs = service.getMsg(bang_id);
				
				for (int i=0;i<msgs.size();i++) {
					String msg = (String)msgs.get(i);
					session.sendMessage(new TextMessage(msg));
				}
			}
			break;
			
		// CLIENT 메세지
		case "CMD_MSG_SEND":
			
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				bang_id = (String) mapSessionList.get("bang_id");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
				
				if (bang_id.equals(mapReceive.get("bang_id"))) {
					Map<String, Object> mapToSend = new HashMap<String, Object>();
					mapToSend.put("send_id",id);
					mapToSend.put("bang_id", bang_id);
					mapToSend.put("cmd", "CMD_MSG_SEND");
					mapToSend.put("msg", (String)mapReceive.get("msg"));
					mapToSend.put("msg_date",mapReceive.get("time"));
					
					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					sess.sendMessage(new TextMessage(jsonStr));
					Map<String, Object> chatMap = new HashMap<String, Object>();
					chatMap.put("send_id", id);
					chatMap.put("receive_id", mapReceive.get("receive_id"));
					chatMap.put("bang_id", mapReceive.get("bang_id"));
					chatMap.put("goods_no", Integer.parseInt(mapReceive.get("goods_no")));
					chatMap.put("message", jsonStr);
					chatMap.put("msg_date", mapReceive.get("time"));
					service.recordMsg(chatMap);
					
					logger.info(chatMap.toString());
					logger.info("str : "+jsonStr);
				}
			}
			break;
		}
	}
	
	// 클라이언트가 연결을 끊음 처리
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		super.afterConnectionClosed(session, status);
        
		ObjectMapper objectMapper = new ObjectMapper();
		String now_bang_id = "";
		
		// 사용자 세션을 리스트에서 제거
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> map = sessionList.get(i);
			String bang_id = (String) map.get("bang_id");
			WebSocketSession sess = (WebSocketSession) map.get("session");
			
			if(session.equals(sess)) {
				now_bang_id = bang_id;
				sessionList.remove(map);
				break;
			}	
		}
	}
}