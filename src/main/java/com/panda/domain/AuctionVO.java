package com.panda.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AuctionVO {
   private Integer auction_no;         	//경매번호
   private String auction_file;			//경매이미지(파일)
   private String auction_image;		//경매이미지(썸네일)
   private String auction_category;		//경매카테고리
   private String auction_title;		//경매상품명
   private String auction_detail;		//경매상세설명
   private String auction_condition;	//경매상품상태(상,중,하)
   private Integer auction_price;		//경매기본가격
   private Integer auction_bid;			//경매입찰금액
   private Integer auction_cnt;			//경매입찰횟수
   private Timestamp auction_date;		//경매등록일
   private Timestamp auction_cdate;		//경매마감일
   private Integer auction_viewcount;   //경매조회수
   private Integer auction_like;      	//경매찜(0:on, 1:off)
   private Integer auction_trade;      	//경매상태(0:거래전,1:거래중,2:거래후)
   private Integer user_no;				//회원번호
   
   private String user_id;				//회원아이디
   private String user_nick;			//회원닉네임
   private String user_area;			//회원주소(시)
   private String user_addr;			//회원주소(구)
   private Timestamp user_regdate;		//회원등록일
}	



