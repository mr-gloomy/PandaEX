package com.panda.paymentvo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@AllArgsConstructor@NoArgsConstructor@Builder
public class CashingPointsVO {
	private int memberNo, cashingMoney, cashingNo;
	private String cashingBank, cashingType, cashingAccount;
}
