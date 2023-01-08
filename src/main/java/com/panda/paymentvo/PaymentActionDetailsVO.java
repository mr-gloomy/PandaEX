package com.panda.paymentvo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PaymentActionDetailsVO {
	private String aid;//요청 고유 번호
	private String approved_at;//거래시간
	private int amount;//결제/취소 총액
	private int point_amount;//결제/취소 포인트 금액
	private int discount_amount;//할인 금액
	private String payment_action_type;//결제 타입(PAYMEYT-결제, CANCEL-결제취소, ISSUED_SID-SID발급)
	private String payload;//요청에 추가로 전달한 값
}