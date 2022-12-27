package com.panda.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.panda.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	
	private static final Logger mylog = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	private static final String NAMESPACE = "com.panda.mapper.MemberMapper";
	
	private SqlSession sqlSession;
	
	@Override
	public void insert(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int idCheck(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
