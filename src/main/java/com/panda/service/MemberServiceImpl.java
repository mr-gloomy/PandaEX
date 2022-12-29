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

	//로긴
	@Override
	public boolean memberLogin(MemberVO vo) {
		mylog.debug("memberLogin(vo) 호출");
		
		MemberVO resultVO = dao.loginMember(vo);
		
		mylog.debug(" DAO 처리 결과 : "+resultVO);
		// null-false , not null-true
//		if(resultVO != null) 
//			return true;
//		else 
//			return false;
		
		return (resultVO != null)? true:false; 
	}
	
	
	


	
	





}
