package com.panda.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.panda.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	// mapper NAMESPACE 정보
	private static final String NAMESPACE
			= "com.panda.mapper.BoardMapper";
	
	
	private static final Logger mylog
		= LoggerFactory.getLogger(BoardDAOImpl.class);

	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		
		sqlSession.insert(NAMESPACE+".createBoard",vo);
	}

}
