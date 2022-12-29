package com.panda.persistence;

import java.util.List;

public interface ChatDAO {
	
	public List getRooms(String id) throws Exception;
}
