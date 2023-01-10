package com.panda.domain;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GoodsVO {
	
	private Integer goods_no;		//상품번호
	private String goods_category;	//상품 카테고리
	private String goods_title;		//상품명
	private String goods_condition;	//상품상태
	private int goods_price;		//상품가격
	private String goods_discount;	//상품할인여부(0:가능,1:불가능)
	private Timestamp goods_date;	//상품등록일
	private String goods_refund;	//상품환불여부
	private String goods_trade; 	//상품상태
	private String goods_detail;	//상품상세설명
	private String uploadFile;		//이미지
	private String thumbnail; 		//이미지썸네일 
	private int viewcount;			//상품조회수
	
	// 판매자 정보 추가
	private Integer user_no;			//회원번호
    private String user_nick;			//회원 닉네임
    private String user_area;			//회원주소(시)
    private String user_addr;			//회원주소(구)
    private Timestamp user_regdate;		//회원등록일
	

}
