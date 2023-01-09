package com.panda.paymentvo;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class PaymentDto {
	private int paymentNo;
	private String paymentTid;
	private int paymentTotal;
	private String paymentName;
	private Timestamp paymentTime;
	private String paymentStatus;
}
