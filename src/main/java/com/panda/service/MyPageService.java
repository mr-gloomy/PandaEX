package com.panda.service;

import java.util.List;

import com.panda.domain.MemberVO;

public interface MyPageService {
	
	// 회원 정보 가져오기
		public MemberVO getMembers(String user_id);
		
		// 마이 페이지 - 메인 
		public MemberVO getMemberss(MemberVO memberVO) throws Exception;
		
		// 정보 수정 
		public void modify(MemberVO memberVO) throws Exception;
		
		// 비밀번호 확인 
		public Integer passCheck(MemberVO memberVO) throws Exception;
		
		// 회원 탈퇴  
		public void exit(MemberVO memberVO) throws Exception;
//		public Integer mypupdate(MemberVO vo) throws Exception; 
}