package com.panda.persistence;

import java.util.HashMap;

import com.panda.domain.MemberVO;
import com.panda.domain.ReportVO;

public interface MemberDAO {
			//회원가입 처리
			public void insert(MemberVO vo) throws Exception;
		
			//로그인
			public MemberVO loginMember(MemberVO vo)throws Exception;
			
			//회원조회
			public MemberVO getMember(String user_id) throws Exception;
			//닉네임조회
			public MemberVO getNick(String user_nick) throws Exception;
			
			
			public HashMap<String, Object> findkakao(HashMap<String, Object> userInfo)throws Exception;

			public void kakaoinsert(HashMap<String, Object> userInfo)throws Exception;
			
			
			//이메일인증~
			int updateMailKey(MemberVO vo) throws Exception;
			int updateMailAuth(MemberVO vo) throws Exception;
			int emailAuthFail(String id) throws Exception;
			public void insertRep(ReportVO vo) throws Exception;

			
}
