package com.panda.domain;

import lombok.Data;

@Data
public class LikeVO {
	private Integer like_no;		//찜번호
	private Integer user_no;		//회원번호
	private Integer item_dist;		//상품구분(0:goods, 1:auction)
	private Integer item_code;		//상품코드
	
}
