package com.panda.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.panda.persistence.ChatDAO;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Inject
	ChatDAO dao;

	@Override
	public List getRooms(String id) throws Exception {
		
		return dao.getRooms(id);
	}
	
	
	
}
