package com.panda.paymentvo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class KakaoPayApproveRequestVO {
	private int paymentNo;
	private String cid;//가맹점 코드
	private String tid;//결제 고유번호
	private String partner_order_id;//가맹점 주문번호
	private String partner_user_id;//가맹점 회원아이디
	private String pg_token;//결제승인 인증용 토큰
}