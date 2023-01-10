package com.panda.paymentvo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@AllArgsConstructor@NoArgsConstructor@Builder
public class CashingListVO {
	private String cashingBank, cashingStatus;
	private Date cashingRequestTime, cashingSuccessTime;
	private long cashingAccount;
	
	private int cashingMoney, cashingCount, totalMoney;
}
