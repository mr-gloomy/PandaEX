package com.panda.persistence;

import com.panda.domain.MemberVO;

public interface MemberDAO {
			//회원가입 처리
			public void insert(MemberVO vo) throws Exception;
		
			//로그인
			public MemberVO loginMember(MemberVO vo);
			
			//회원조회
			public MemberVO getMember(String user_id);
			
			
}
