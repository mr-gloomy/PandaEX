package com.panda.paymentvo;

import java.sql.Timestamp;


import lombok.Data;

@Data
public class KakaoPayApproveResponseVO {
	private String aid;//요청 고유 번호
	private String tid;//결제 고유 번호
	private String cid;//가맹점 코드
	private String sid;//정기결제용 아이디
	private String partner_order_id;//가맹점 주문번호
	private String partner_user_id;//가맹점 회원번호
	private String payment_method_type;//결제 수단(CARD/MONEY)
	private AmountVO amount;//결제 금액 정보
	private String item_name;//상품 이름
	private String item_code;//상품 코드
	private int quantity;//상품 수량
	private Timestamp created_at;//결제 준비 요청 시각
	private Timestamp approved_at;//결제 승인 시각
	private String payload;//결제 요청 시 전달된 요청 데이터
}
