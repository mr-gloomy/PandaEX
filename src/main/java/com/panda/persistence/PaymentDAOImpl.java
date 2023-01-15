	package com.panda.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.panda.domain.GoodsVO;
import com.panda.domain.MemberVO;
import com.panda.paymentvo.KakaoPayApproveResponseVO;
import com.panda.paymentvo.PaymentDto;
import com.panda.paymentvo.PaymentInsertVO;
import com.panda.paymentvo.PaymentSuccessVO;
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
	public MemberVO getUser(String user_id) throws Exception {
		MemberVO mvo = sqlSession.selectOne(NAMESPACE + ".getUser", user_id);
		
		return mvo;
	}
	@Override
	public void buyer(int user_no, int goods_no) throws Exception {
		mylog.debug(" DAO : 결제 시 구매자 pandapay 금액 - goods 금액");
		Map info = new HashMap();
		info.put("user_no", user_no);
		info.put("goods_no", goods_no);
		sqlSession.selectOne(NAMESPACE+".buyer", info);
	}
	
	
	@Override
	public void seller(int goods_no) throws Exception {
		mylog.debug(" DAO : 결제 시 판매자 pandapay 금액 + goods 금액");
		sqlSession.selectOne(NAMESPACE+".seller", goods_no);
		
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
	
	// 상품번호(goods_no) 정보 조회
	@Override
	public GoodsVO getGoods(Integer goods_no) throws Exception {
		mylog.debug("getGoods(Integer goods_no) 호출");
		
		GoodsVO vo = sqlSession.selectOne(NAMESPACE + ".getGoods", goods_no);
		
		return vo;
	}
	
	@Override
	public List<PaymentDto> getUserPay(String user_id) throws Exception {
		mylog.debug("getUserPay List<PaymentDto>");
		return sqlSession.selectList(NAMESPACE+".getUserPay", user_id);
	}
	
	
	
	
	
}
