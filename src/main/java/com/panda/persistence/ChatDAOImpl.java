package com.panda.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAOImpl implements ChatDAO{
	
	
	private static final Logger logger = LoggerFactory.getLogger(ChatDAOImpl.class);
	
	@Inject
	SqlSession sqlsession;
	
	private final String mapper = "com.panda.mapper.ChatMapper";
	
	public List getRooms(String id) throws Exception{
		logger.info(sqlsession.selectList(mapper+".getRooms",id).toString());
		return sqlsession.selectList(mapper+".getRooms",id);
	}
}
