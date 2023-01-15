package com.panda.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.panda.domain.GoodsVO;
import com.panda.domain.MemberVO;
import com.panda.paymentvo.PaymentInsertVO;
import com.panda.paymentvo.PaymentSuccessVO;
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
	
}
