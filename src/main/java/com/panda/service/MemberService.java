package com.panda.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.panda.domain.MemberVO;
import com.panda.domain.ReportVO;


public interface MemberService {
	
	
		// 토큰 받기
		public String getAccessToken (String authorize_code) throws Exception;
	
		//회원 가입 처리
		public void insert(MemberVO vo)throws Exception;
		
		//로그인
		public boolean memberLogin(MemberVO vo) throws Exception;

		//회원조회
		public MemberVO getMember(String user_id) throws Exception;

		//닉네임 조회
		public MemberVO getNick(String user_nick) throws Exception;
		
		
		
		public HashMap<String,Object> getUserInfo(String access_Token)throws Exception;

	
		//이메일인증~
		int updateMailKey(MemberVO vo) throws Exception;
		int updateMailAuth(MemberVO vo) throws Exception;
		int emailAuthFail(String user_id) throws Exception;

		// 아이디 찾기
		public MemberVO findId(MemberVO vo) throws Exception;
		
		
		// * 관리자용
		//   전체회원 목록 조회
		public List<MemberVO> getMemList(String id)throws Exception;
		public MemberVO getMemberA(MemberVO mVO) throws Exception;
	
		
		
		//비밀번호 이메일발송
		public void sendEmail(MemberVO vo, String div) throws Exception;

		//비밀번호 찾기
		public void findPw(HttpServletResponse resp, MemberVO vo) throws Exception;
		
		public String pwCheck(int user_no)throws Exception;
		public void updatePw(MemberVO vo)throws Exception;
		
		
		public void insertRep(ReportVO vo) throws Exception;


		// 일반회원 <-> 블랙회원
		public void changeblack(MemberVO mvo)throws Exception;
		

}
