package com.panda.service;

import java.util.List;

import com.panda.paymentvo.CashingListVO;
import com.panda.paymentvo.CashingPointsVO;
import com.panda.paymentvo.KakaoPayApproveResponseVO;
import com.panda.paymentvo.PaymentInsertVO;
import com.panda.paymentvo.PaymentSuccessVO;
import com.panda.paymentvo.PurchaseVO;
import com.panda.paymentvo.SuccessfulBidDto;

public interface PaymentService {

	void insert(int paymentNo, KakaoPayApproveResponseVO responseVO, PurchaseVO purchaseVO);
	PaymentInsertVO selectOne(int paymentNo);
	PaymentSuccessVO successOne(int paymentNo);
	List<PaymentInsertVO> allList(int memberNo, int page, int filter, int sort);
	List<PaymentInsertVO> refundList(int memberNo);
	void refund(int paymentNo);
	boolean cashingRequest(CashingPointsVO vo);
	List<CashingListVO> cashingList(int memberNo, int page, int filter, int sort);
	boolean enoughPoint(int memberNo, int auctionNo);
	void pointPaying(int memberNo, int auctionNo);
	SuccessfulBidDto bidSelect(int auctionNo);
}
