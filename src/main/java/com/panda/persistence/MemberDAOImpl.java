package com.panda.persistence;

import java.util.HashMap;

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

	//로그인
	@Override
	public MemberVO loginMember(MemberVO vo) {
		
		return sqlSession.selectOne(NAMESPACE+".login",vo);
	}

	//회원조회
	@Override
	public MemberVO getMember(String user_id) {
		MemberVO vo = sqlSession.selectOne(NAMESPACE + ".getMember",user_id);
		mylog.debug("@@@@@@@@@@@@@@@@@@@@@@@");
		
		return vo;
	}
	// 정보 저장
		public void kakaoinsert(HashMap<String, Object> userInfo) {
			sqlSession.insert("Member.kakaoInsert",userInfo);
		}

		// 정보 확인
		public KakaoVO findkakao(HashMap<String, Object> userInfo) {
			System.out.println("RN:"+userInfo.get("nickname"));
			System.out.println("RE:"+userInfo.get("email"));
			return sqlSession.selectOne("Member.findKakao", userInfo);
		}

	}
	

