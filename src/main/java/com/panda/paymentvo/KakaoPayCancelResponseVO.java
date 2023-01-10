package com.panda.paymentvo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class KakaoPayCancelResponseVO {
	private String aid;//요청 고유 번호
	private String tid;//결제 고유 번호
	private String cid;//가맹점 코드
	private String status;//결제 상태
	private String partner_order_id;//가맹점 주문번호
	private String partner_user_id;//가맹점 회원아이디
	private String payment_method_type;//결제 수단
	private AmountVO amount;//결제 금액 정보
	private AmountVO approved_cancel_amount, canceled_amount, cancel_available_amount;//취소 금액 정보
	private String item_name;//상품 이름
	private String item_code;//상품 코드
	private Timestamp created_at, approved_at, canceled_at; //결제 시간 정보
	private String payload;//취소 요청시 추가로 전달한 데이터
	
}
