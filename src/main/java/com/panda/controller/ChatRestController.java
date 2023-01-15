package com.panda.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.panda.domain.ChatVO;
import com.panda.service.ChatService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/chat")
@RestController
public class ChatRestController {
	
	@Inject
	ChatService service;
	
	private static final Logger mylog
	= LoggerFactory.getLogger(ChatRestController.class);
	
	@GetMapping(value="/getRooms/{id}", produces="application/json; charset=UTF-8")
	public List getRooms(@PathVariable("id") String id) throws Exception{
		mylog.info("getRooms 호출"+id);
		return service.getRooms(id);
	}
	
	@GetMapping(value="/getMsgs/{user_id}/{re_id}", produces="application/json; charset=UTF-8")
	public List<ChatVO> getMsgs(@PathVariable("user_id") String user_id, @PathVariable("re_id") String re_id) throws Exception{
		
		ChatVO vo = new ChatVO();
		vo.setSend_id(user_id);
		vo.setReceive_id(re_id);
		
		String bang_id = service.getRoom(vo);
		
		return service.getMsg(bang_id);
	}
	
	@PostMapping(value="/insertMsg", produces="application/json; charset=UTF-8")
	public void insertMsg(@RequestBody ChatVO vo) {
		try {
			service.recordMsg(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@GetMapping(value="/getNewMsg/{bangid}/{sendid}", produces="application/json; charset=UTF-8")
	public List<ChatVO> getNewMsg(@PathVariable("bangid") String bang_id,@PathVariable("sendid") String send_id) {
		ChatVO vo = new ChatVO();
		vo.setBang_id(bang_id);
		vo.setSend_id(send_id);
		List<ChatVO> cVO = null;
		try {
			 cVO = service.getNewMsg(vo);
			 if (!(cVO.isEmpty())) {
				service.sendUp(bang_id);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cVO;
	}
}
