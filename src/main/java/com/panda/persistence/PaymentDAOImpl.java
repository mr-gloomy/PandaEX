	package com.panda.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.panda.paymentvo.CashingListVO;
import com.panda.paymentvo.CashingPointsVO;
import com.panda.paymentvo.KakaoPayApproveResponseVO;
import com.panda.paymentvo.PaymentInsertVO;
import com.panda.paymentvo.PaymentSuccessVO;
import com.panda.paymentvo.PurchaseVO;
import com.panda.paymentvo.SuccessfulBidDto;

@Repository
public class PaymentDAOImpl implements PaymentDAO{

	private static final Logger mylog = LoggerFactory.getLogger(PaymentDAOImpl.class);
	
	private static final String NAMESPACE = "com.panda.mapper.PaymentMapper";
	
	@Autowired
	private SqlSession sqlSession; 
	
	@Override
	public int getMonthlyTotalChargedPoints() throws Exception{
		// 해당 월의 포인트 충전액 합계 
		return sqlSession.selectOne(NAMESPACE+".monthlyTotalPoints");
	}
	@Override
	public int paymentSequence() throws Exception{
		return sqlSession.selectOne(NAMESPACE+".sequence");
	}
	@Override
	public void insert(PaymentInsertVO vo) throws Exception {
		mylog.debug(" DAO : insert 동작 호출");
		mylog.debug("vo : "+vo);
		sqlSession.insert(NAMESPACE+".insert", vo);
		//sqlSession.update(NAMESPACE+".charge", vo);
		mylog.debug("payment insert 완료 -> 서비스");
	}
	@Override
	public void update(PaymentInsertVO vo) throws Exception {
		mylog.debug(" DAO : charge 동작 호출");
		sqlSession.update(NAMESPACE+".charge", vo);
		
	}
	
	@Override
	public PaymentInsertVO selectOne(int paymentNo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".one", paymentNo);
	}
	@Override
	public PaymentSuccessVO successOne(int paymentNo) throws Exception {
		mylog.debug(" DAO : success 동작 호출");
		PaymentSuccessVO pvo = sqlSession.selectOne(NAMESPACE+".success", paymentNo);
		mylog.debug(" pvo : " + pvo);

		return pvo;
	}
	@Override
	public List<PaymentInsertVO> allList(int memberNo, int page, int filter, int sort) throws Exception {
		Map<String, Object> info = new HashMap<>();
		info.put("memberNo", memberNo);
		info.put("begin", (page * 10) - (10 - 1)); // 10개씩 불러오기
		info.put("end", page * 10);
		info.put("filter", filter);
		info.put("sort", sort);
		return sqlSession.selectList(NAMESPACE+".allList", info);
	}
	@Override
	public List<PaymentInsertVO> refundList(int memberNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void refund(int paymentNo) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public boolean cashingRequest(CashingPointsVO vo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public List<CashingListVO> cashingList(int memberNo, int page, int filter, int sort) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean enoughPoint(int memberNo, int auctionNo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public void pointPaying(int memberNo, int auctionNo) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public SuccessfulBidDto bidSelect(int auctionNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
}
