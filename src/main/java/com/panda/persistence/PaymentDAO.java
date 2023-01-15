package com.panda.persistence;

import java.util.List;

import com.panda.domain.AuctionVO;
import com.panda.domain.GoodsVO;
import com.panda.domain.MemberVO;
import com.panda.paymentvo.PaymentDto;
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
	
	// 사용자 정보 조회
	public MemberVO getUser(String user_id) throws Exception;
	
	public void buyer(int user_no, int goods_no) throws Exception;
	
	public void seller(int goods_no) throws Exception;
	
	public GoodsVO getGoods(Integer goods_no) throws Exception;
	
	public List<PaymentDto> getUserPay(String user_id) throws Exception;
	
	public List<PaymentInsertVO> allList(int memberNo, int page, int filter, int sort) throws Exception;
	
	
	
}
