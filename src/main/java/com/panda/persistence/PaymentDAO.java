package com.panda.persistence;

public interface PaymentDAO {

	// 해당 월의 포인트 충전액 합계 
	public int getMonthlyTotalChargedPoints() throws Exception;
	
	public int paymentSequence() throws Exception;
	
	
	
	
	
	
	
	
}
