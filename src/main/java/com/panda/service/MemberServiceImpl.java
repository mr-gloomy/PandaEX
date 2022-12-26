package com.panda.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.panda.domain.MemberVO;
import com.panda.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	
	private static final Logger mylog = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	private MemberDAO dao;

	@Override
	public void insert(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int idCheck(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
