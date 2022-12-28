package com.panda.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class GoodsVO {
	
	private Integer goods_no;		//상품번호
	private String goods_image;		//상품이미지
	private String goods_category;	//상품 카테고리
	private String goods_title;		//상품명
	private int goods_condition;	//상품상태(0:새상품,1:거의 새 것, 2:사용감많음)
	private int goods_price;		//상품가격
	private int goods_discount;	    //상품할인여부(0:가능,1:불가능)
	private String goods_detail;	//상품상세설명
	private Timestamp goods_date;	//상품등록일
	private int goods_viewcount;	//상품조회수
	private int goods_refund;	    //상품환불여부(0:가능,1:불가능)
	private int goods_like;		    //상품찜(0:on, 1:off)
	private int goods_donation;		//상품or기부(0:중고상품, 1:기부상품)
	private int goods_nak;			//상품낙찰여부
	private int goods_trade; 		//상품상태(0:거래전,1:거래중, 2:거래후)
	

}
