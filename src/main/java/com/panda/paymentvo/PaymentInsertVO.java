package com.panda.paymentvo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class PaymentInsertVO {
	private int paymentNo, memberNo, paymentPrice;
	private Date paymentTime;
	private String paymentTid, paymentStatus;
	
	private String refund;
	private int paymentCount;
}
