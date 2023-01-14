package com.panda.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.panda.domain.ChatVO;
import com.panda.persistence.ChatDAO;

@Service
public class ChatServiceImpl implements ChatService {
	
	
	private static final Logger logger = LoggerFactory.getLogger(ChatServiceImpl.class);
	@Inject
	ChatDAO dao;

	@Override
	public List getRooms(String id) throws Exception {
		
		return dao.getRooms(id);
	}
	
	public String getRoom(ChatVO vo) throws Exception{
		logger.info(dao.getRoom(vo));
		return dao.getRoom(vo);
	}
	
	public String getRoom(Map<String, Object> hm) throws Exception{
		return dao.getRoom(hm);
	}
	
	public void recordMsg(ChatVO vo) throws Exception{
		dao.recordMsg(vo);
	}
	
	public List<ChatVO> getMsg(String bang_id) throws Exception{
		return dao.getMsg(bang_id);
	}

	@Override
	public List<ChatVO> getNewMsg(ChatVO vo) throws Exception {
		return dao.getNewMsg(vo);
	}
	
	@Override
	public void sendUp(String bang_id) throws Exception {
		dao.sendUp(bang_id);
	}
}
