package com.panda.persistence;

import com.panda.domain.MemberVO;

public interface MemberDAO {
	//회원가입 처리
			public void insert(MemberVO vo) throws Exception;
		
			//아이디 중복 체크 
			public int idCheck(MemberVO vo) throws Exception;
}
