package com.panda.persistence;

public interface PaymentDAO {

	// 해당 월의 포인트 충전액 합계 
	int getMonthlyTotalChargedPoints();
	int paymentSequence();
}
