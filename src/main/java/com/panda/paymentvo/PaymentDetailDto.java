package com.panda.paymentvo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class PaymentDetailDto {
	private int paymentDetailNo;
	private int paymentNo;
	private String paymentDetailName;
	private int paymentDetailPrice;
	private String paymentDetailStatus;
}
