package com.panda.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.panda.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	
	private static final Logger mylog 
			= LoggerFactory.getLogger(MemberDAOImpl.class);
	
	
	
	@Inject
	private SqlSession sqlSession;
	
	//mapper의 namespace 정보 저장
	private static final String NAMESPACE = "com.panda.mapper.MemberMapper";
	
	@Override
	public void insert(MemberVO vo) throws Exception {
		
		sqlSession.insert(NAMESPACE+".insert",vo);
	}

	@Override
	public int idCheck(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberVO getMember(String user_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO loginMember(String user_id, String user_pw) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO loginMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
