package com.panda.service;

import com.panda.domain.MemberVO;


public interface MemberService {

		//회원 가입 처리
		public void insert(MemberVO vo)throws Exception;
		
		//로그인
		public boolean memberLogin(MemberVO vo) throws Exception;
		
		

}
