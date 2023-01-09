package com.panda.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
}
