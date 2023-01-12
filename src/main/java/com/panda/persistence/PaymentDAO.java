package com.panda.persistence;

import java.util.List;

import com.panda.paymentvo.CashingListVO;
import com.panda.paymentvo.CashingPointsVO;
import com.panda.paymentvo.PaymentInsertVO;
import com.panda.paymentvo.PaymentSuccessVO;
import com.panda.paymentvo.SuccessfulBidDto;

public interface PaymentDAO {

	// 해당 월의 포인트 충전액 합계 
	public int getMonthlyTotalChargedPoints() throws Exception;
	
	public int paymentSequence() throws Exception;
	
	// 결제 정보 등록
	public void insert(PaymentInsertVO vo) throws Exception;

	public void update(PaymentInsertVO vo) throws Exception;
	
	public PaymentInsertVO selectOne(int paymentNo) throws Exception;
	
	public PaymentSuccessVO successOne(int paymentNo) throws Exception;
	
	public List<PaymentInsertVO> allList(int memberNo, int page, int filter, int sort) throws Exception;
	public List<PaymentInsertVO> refundList(int memberNo) throws Exception;
	public void refund(int paymentNo) throws Exception;
	public boolean cashingRequest(CashingPointsVO vo) throws Exception;
	public List<CashingListVO> cashingList(int memberNo, int page, int filter, int sort) throws Exception;
	public boolean enoughPoint(int memberNo, int auctionNo) throws Exception;
	public void pointPaying(int memberNo, int auctionNo) throws Exception;
	public SuccessfulBidDto bidSelect(int auctionNo) throws Exception;
	
	
	
}
