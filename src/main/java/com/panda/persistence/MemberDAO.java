package com.panda.persistence;

import com.panda.domain.MemberVO;

public interface MemberDAO {
			//회원가입 처리
			public void insert(MemberVO vo) throws Exception;
		
			//로그인
			public MemberVO loginMember(String user_id, String user_pw);
			public MemberVO loginMember(MemberVO vo);
			
			
}
