package com.panda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.panda.domain.GoodsVO;
import com.panda.domain.MemberVO;
import com.panda.paymentvo.CashingListVO;
import com.panda.paymentvo.CashingPointsVO;
import com.panda.paymentvo.KakaoPayApproveResponseVO;
import com.panda.paymentvo.PayingVO;
import com.panda.paymentvo.PaymentInsertVO;
import com.panda.paymentvo.PaymentSuccessVO;
import com.panda.paymentvo.PurchaseVO;
import com.panda.paymentvo.SuccessfulBidDto;
import com.panda.persistence.AuctionDAOImpl;
import com.panda.persistence.PaymentDAO;

@Service
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	private PaymentDAO dao;
	
		private static final Logger mylog = LoggerFactory.getLogger(PaymentServiceImpl.class);
		
	@Override
	public void insert(PaymentInsertVO vo) throws Exception {
		mylog.debug(" Service : insert 동작 호출");
		mylog.debug("vo : "+vo);
		dao.insert(vo);
		dao.update(vo);
		mylog.debug("payment insert/charge 완료 -> 서비스");
	}
	@Override
	public PaymentInsertVO selectOne(int paymentNo) throws Exception{
		PaymentInsertVO ivo = dao.selectOne(paymentNo);
		return ivo;
	}
	@Override
	public PaymentSuccessVO successOne(int paymentNo) throws Exception {
		mylog.debug("paymentNo : "+paymentNo);
		
		return dao.successOne(paymentNo);
	}
	
	
	@Override
	public MemberVO getUser(String user_id) throws Exception {
		mylog.debug("user_id : "+user_id);
		
		return dao.getUser(user_id);
	}
	
	@Override
	public void buyer(int user_no, int goods_no) throws Exception {
		mylog.debug(" Service : 결제 시 구매자 pandapay 금액 - goods 금액");
		dao.buyer(user_no,goods_no);
	}
	
	@Override
	public void seller(int goods_no) throws Exception {
		mylog.debug(" Service : 결제 시 판매자 pandapay 금액 + goods 금액");
		dao.seller(goods_no);
	}
	
	// 글번호(goods_no) 정보 조회
	@Override
	public GoodsVO getGoods(Integer goods_no) throws Exception {
		mylog.debug("getGoods(Integer goods_no) 호출");
		
		return dao.getGoods(goods_no);
	}
	
	
//	@Override
//	public List<PaymentInsertVO> allList(Map<String, Object> info) {
		
//		dao.allList(memberNo, page, filter, sort)
//		
//		return sqlSession.selectList("payment.allList", info);
//	}
//	@Override
//	public List<PaymentInsertVO> refundList(int memberNo) {
//		return sqlSession.selectList("payment.refundList", memberNo);
//	}
//	@Override
//	@Transactional
//	public void refund(int paymentNo) {
//		sqlSession.update("payment.refund", paymentNo);
//		PaymentInsertVO vo = sqlSession.selectOne("payment.one", paymentNo);
//		sqlSession.update("payment.refundMember", vo);
//	}
////	@Override
////	@Transactional
////	public boolean cashingRequest(CashingPointsVO vo) {
////		int cashingSeq = sqlSession.selectOne("payment.cashingSequence");
////		MemberVO memberDto = sqlSession.selectOne("member.one", vo.getMemberNo());
////		if(memberDto.getMemberHoldingPoints()>=vo.getCashingMoney()) {
////			vo.setCashingType("0");
////			vo.setCashingNo(cashingSeq);
////			if(memberDto.getMemberHoldingPoints()==vo.getCashingMoney()) {
////				vo.setCashingType("1");
////			}
////			sqlSession.insert("payment.cashingInsert", vo);
////			boolean success = memberDto.getMemberHoldingPoints() >= vo.getCashingMoney();
////			return success;
////		}else {
////			return false;
////		}
////	}
//	@Override
//	public List<CashingListVO> cashingList(int memberNo, int page, int filter, int sort) {
//		Map<String, Object> info = new HashMap<>();
//		info.put("memberNo", memberNo);
//		info.put("begin", (page * 10) - (10 - 1)); // 10개씩 불러오기
//		info.put("end", page * 10);
//		info.put("filter", filter);
//		info.put("sort", sort);		
//		return sqlSession.selectList("payment.cashingList", info);
//	}
//	@Override
//	public boolean cashingRequest(CashingPointsVO vo) {
//		// TODO Auto-generated method stub
//		return false;
//	}
//	@Override
//	public boolean enoughPoint(int memberNo, int auctionNo) {
//		// TODO Auto-generated method stub
//		return false;
//	}
//	@Override
//	public void pointPaying(int memberNo, int auctionNo) {
//		// TODO Auto-generated method stub
//		
//	}
//	@Override
//	public SuccessfulBidDto bidSelect(int auctionNo) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	
//	@Override
//	@Transactional
//	public boolean enoughPoint(int memberNo, int auctionNo) {
//		MemberDto memberDto = sqlSession.selectOne("member.one", memberNo);
//		SuccessfulBidDto successfulBidDto = sqlSession.selectOne("successful_bid.one", auctionNo);
//		if(memberDto.getMemberHoldingPoints() >= successfulBidDto.getSuccFinalBid()) {
//			return true;
//		}else {
//			return false;
//		}
//	}
//	@Override
//	@Transactional
//	public void pointPaying(int memberNo, int auctionNo) {
//		SuccessfulBidDto successfulBidDto = sqlSession.selectOne("successful_bid.one", auctionNo);
//		PayingVO payingVO = PayingVO.builder().memberNo(memberNo).price(successfulBidDto.getSuccFinalBid()).build();
//		sqlSession.update("member.paying", payingVO);
//		sqlSession.update("successful_bid.paying", auctionNo);
//		int comission = successfulBidDto.getSuccFinalBid()/10;
//		NetSalesDto nsDto = NetSalesDto.builder().commission(comission).succBidNo(successfulBidDto.getSuccBidNo()).build();
//		sqlSession.insert("netSales.insert", nsDto);
//	}
//	@Override
//	public SuccessfulBidDto bidSelect(int auctionNo) {
//		return sqlSession.selectOne("successful_bid.one", auctionNo);
//	}
}
