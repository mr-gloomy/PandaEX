package com.panda.persistence;

import java.util.List;
import java.util.Map;

import com.panda.domain.ChatVO;


public interface ChatDAO {
	
	public List getRooms(String id) throws Exception;
	
	public String getRoom(ChatVO vo) throws Exception;
	
	public String getRoom(Map<String, Object> hm) throws Exception;
	
	public void recordMsg(ChatVO vo) throws Exception;
	
	public List<ChatVO> getMsg(String bang_id) throws Exception;
	
	public List<ChatVO> getNewMsg(ChatVO vo) throws Exception;
	
	public void sendUp(String bang_id) throws Exception;
}
