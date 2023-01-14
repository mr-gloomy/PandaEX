package com.panda.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.panda.domain.MemberVO;
import com.panda.paymentvo.PaymentDto;
import com.panda.paymentvo.PaymentInsertVO;
import com.panda.persistence.MemberDAO;
import com.panda.persistence.PaymentDAO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	private static final Logger mylog = LoggerFactory.getLogger(MyPageServiceImpl.class);
	
	@Inject
	private MemberDAO memberDAO;
	
	@Inject
	private PaymentDAO paymentDAO;

	@Override
	public MemberVO getMemberss(String user_id) {
		return memberDAO.getMemberss(user_id);
	}

	@Override
	public MemberVO getMemberss(MemberVO memberVO) throws Exception {
		return memberDAO.getMemberss(memberVO);
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

	@Override
	public MemberVO getMembera(MemberVO memberVO) throws Exception {
		
		return memberDAO.getMemberss(memberVO);
	}

	@Override
	public List<PaymentDto> getUserPay(String user_id) throws Exception {
		mylog.debug("getUserPay List<PaymentDto>");
		return paymentDAO.getUserPay(user_id);
	}

	

}
