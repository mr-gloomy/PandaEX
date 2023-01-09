
package com.panda.paymentvo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class KakaoPayReadyResponseVO {
	private String tid;//결제고유번호
	private String next_redirect_mobile_url, next_redirect_pc_url;//결제페이지 주소
	private Date created_at;
}