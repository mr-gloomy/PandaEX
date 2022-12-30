package com.panda.persistence;

import java.util.List;
import java.util.Map;

import com.panda.domain.ChatVO;


public interface ChatDAO {
	
	public List getRooms(String id) throws Exception;
	
	public String getRoom(ChatVO vo) throws Exception;
	
	public String getRoom(Map<String, Object> hm) throws Exception;
	
	public void recordMsg(Map<String, Object> hm) throws Exception;
	
	public List getMsg(String bang_id) throws Exception;
}
