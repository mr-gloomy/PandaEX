package com.panda.service;

import java.util.List;
import java.util.Map;

import com.panda.domain.GoodsVO;
import com.panda.domain.MemberVO;
import com.panda.paymentvo.KakaoPayApproveResponseVO;
import com.panda.paymentvo.PaymentInsertVO;
import com.panda.paymentvo.PaymentSuccessVO;
import com.panda.paymentvo.SuccessfulBidDto;

public interface PaymentService {

	void insert(PaymentInsertVO vo) throws Exception;
	PaymentInsertVO selectOne(int paymentNo) throws Exception;
	PaymentSuccessVO successOne(int paymentNo) throws Exception;
	// 사용자 정보 조회
	public MemberVO getUser(String user_id) throws Exception;
	
	public void buyer(int user_no, int goods_no) throws Exception;
	
	public void seller(int goods_no) throws Exception;
	
	public GoodsVO getGoods(Integer goods_no) throws Exception;
}
