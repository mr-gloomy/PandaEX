package com.panda.paymentvo;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
public class PaymentDto {
	private int payment_no;
	private String payment_tid;
	private int payment_total;
	private String payment_name;
	private Timestamp payment_time;
	private String payment_status;
	private int member_no;
	private int payment_price;

}
