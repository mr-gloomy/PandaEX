package com.panda.paymentvo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class PaymentInsertVO {
	private int memberNo, paymentPrice;
	private int paymentNo;
	private Timestamp paymentTime;
	private String paymentTid, paymentStatus;
	
	private String refund;
	private int paymentCount;
}
