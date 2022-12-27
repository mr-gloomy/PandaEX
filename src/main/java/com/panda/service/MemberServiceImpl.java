package com.panda.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.panda.domain.MemberVO;
import com.panda.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	
	private static final Logger mylog = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Inject
	private MemberDAO dao;

	
	//횐갑
	@Override
	public void insert(MemberVO vo) throws Exception {
			dao.insert(vo);
	}
	
	//아이디체크
	@Override
	public int idCheck(MemberVO vo)  {
		// TODO Auto-generated method stub
		return 0;
	}
	//비번체크
	

	

	@Override
	public MemberVO getMember(String user_id) {
		// TODO Auto-generated method stub
		return null;
	}

	//로긴
	
	@Override
	public boolean memberLogin(MemberVO vo) {
		// TODO Auto-generated method stub
		return false;
	}





}
