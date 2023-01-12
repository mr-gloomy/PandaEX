package com.panda.service;

import java.util.List;
import java.util.Map;

import com.panda.paymentvo.CashingListVO;
import com.panda.paymentvo.CashingPointsVO;
import com.panda.paymentvo.KakaoPayApproveResponseVO;
import com.panda.paymentvo.PaymentInsertVO;
import com.panda.paymentvo.PaymentSuccessVO;
import com.panda.paymentvo.PurchaseVO;
import com.panda.paymentvo.SuccessfulBidDto;

public interface PaymentService {

	void insert(PaymentInsertVO vo) throws Exception;
	PaymentInsertVO selectOne(int paymentNo) throws Exception;
	PaymentSuccessVO successOne(int paymentNo) throws Exception;
//	List<PaymentInsertVO> allList(Map<String, Object> info) throws Exception;
//	List<PaymentInsertVO> refundList(int memberNo) throws Exception;
//	void refund(int paymentNo) throws Exception;
//	boolean cashingRequest(CashingPointsVO vo) throws Exception;
//	List<CashingListVO> cashingList(int memberNo, int page, int filter, int sort) throws Exception;
//	boolean enoughPoint(int memberNo, int auctionNo) throws Exception;
//	void pointPaying(int memberNo, int auctionNo) throws Exception;
//	SuccessfulBidDto bidSelect(int auctionNo) throws Exception;
}
