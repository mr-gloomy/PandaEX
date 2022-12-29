package com.panda.persistence;

import java.util.HashMap;
import java.util.Map;

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
	public MemberVO loginMember(String user_id, String user_pw) {
		
		//sqlSession.selectOne(statement,userid,userpw); (x)
		//sqlSession.selectOne(statement,vo); (o) vo 객체 생성해서 set호출 저장
		
		// VO객체 안에 전달된 정보를 한번에 전달 불가능한 경우
		// ->  관련없는 데이터를 1개 이상 전달하는 경우(join)
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		//paramMap.put("mapper에 매핑될 이름", 데이터);
		paramMap.put("user_id", user_id);
		paramMap.put("user_pw", user_pw);
		
		MemberVO vo 
		      = sqlSession.selectOne(NAMESPACE+".login",paramMap);
		
		return vo;
	}
	@Override
	public MemberVO loginMember(MemberVO vo) {
		
		return sqlSession.selectOne(NAMESPACE+".login",vo);
	}

}
