package com.panda.paymentvo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class KakaoPayCancelRequestVO {
	private String tid;	//결제 고유번호
	private int cancel_amount;	//취소 요청 금액
	
}
