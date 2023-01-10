package com.panda.persistence;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.panda.domain.MemberVO;
import com.panda.domain.ReportVO;

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
	public MemberVO loginMember(MemberVO vo)throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".login",vo);
	}

	//회원조회
	@Override
	public MemberVO getMember(String user_id)throws Exception {
		MemberVO vo = sqlSession.selectOne(NAMESPACE + ".getMember",user_id);
		mylog.debug("@@@@@@@@@@@@@@@@@@@@@@@");
		
		return vo;
	}
	
	
	@Override
	public MemberVO getNick(String user_nick) throws Exception {
		MemberVO vo = sqlSession.selectOne(NAMESPACE + ".getNick",user_nick);
		mylog.debug("nickname");
		
		return vo;
	}

		// 정보 저장
		public void kakaoinsert(HashMap<String, Object> userInfo)throws Exception {
			mylog.info(userInfo.toString());
			sqlSession.insert(NAMESPACE+".kakaoInsert",userInfo);
		}
		// 정보 확인
		public HashMap<String, Object> findkakao(HashMap<String, Object> userInfo)throws Exception {
			
			return sqlSession.selectOne(NAMESPACE+".findKakao", userInfo);
		}

		
		//이메일 인증~
		@Override
		public int updateMailKey(MemberVO vo) throws Exception {
		    return sqlSession.update(NAMESPACE + ".updateMailKey", vo);
		}

		@Override
		public int updateMailAuth(MemberVO vo) throws Exception {
		    return sqlSession.update(NAMESPACE + ".updateMailAuth", vo);
		}

		@Override
		public int emailAuthFail(String user_id) throws Exception {
		    return sqlSession.selectOne(NAMESPACE + ".emailAuthFail", user_id);
		}

		@Override
		public void insertRep(ReportVO vo) throws Exception {
			sqlSession.insert(NAMESPACE+".insertRep",vo);
		}
		
		
		
		// 아이디 찾기
		@Override
		public MemberVO findId(MemberVO vo) throws Exception {
			return sqlSession.selectOne(NAMESPACE+".findId", vo);
		}
		
		@Override
		public MemberVO getMembers(String user_id) {
			return sqlSession.selectOne(NAMESPACE + ".getMember", user_id);
		}
		
		//비밀번호변경
		@Override
		public int updatePw(MemberVO vo) throws Exception {
			return sqlSession.update(NAMESPACE +".updatePw", vo);
		}
		
		
		
		
		
		
		
		// 마이 페이지 
		@Override
		public MemberVO getMembers(MemberVO memberVO) throws Exception {
			return sqlSession.selectOne(NAMESPACE + ".getMembers", memberVO);
		}
		
		// 마이 페이지 - 정보 수정 
		@Override
		public void modify(MemberVO memberVO) throws Exception {
			sqlSession.update(NAMESPACE + ".modify", memberVO);
		}
		
		// 마이 페이지 - 정보 수정 - 비밀번호 확인 
		@Override
		public Integer passCheck(MemberVO memberVO) throws Exception {
			return sqlSession.selectOne(NAMESPACE + ".passCheck", memberVO);
		}

		// 마이 페이지 - 회원 탈퇴 
		@Override
		public void exit(MemberVO memberVO) throws Exception {
			sqlSession.delete(NAMESPACE + ".exit", memberVO);
		}


		

		
		
		
	}
	

