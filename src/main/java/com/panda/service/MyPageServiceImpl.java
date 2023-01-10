package com.panda.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.panda.domain.MemberVO;
import com.panda.persistence.MemberDAO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Inject
	private MemberDAO memberDAO;

	@Override
	public MemberVO getMembers(String user_id) {
		return memberDAO.getMembers(user_id);
	}

	@Override
	public MemberVO getMembers(MemberVO memberVO) throws Exception {
		return memberDAO.getMembers(memberVO);
	}
	
	// 정보 수정 
	@Override
	public void modify(MemberVO memberVO) throws Exception {
		memberDAO.modify(memberVO);
	}

	// 비밀번호 확인 
	@Override
	public Integer passCheck(MemberVO memberVO) throws Exception {
		return memberDAO.passCheck(memberVO);
	}

	// 회원 탈퇴 
	@Override
	public void exit(MemberVO memberVO) throws Exception {
		memberDAO.exit(memberVO);
	}

}
