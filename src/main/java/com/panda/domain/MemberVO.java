package com.panda.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	private String user_no;
	private String user_id;
	private String user_pw;
	private String user_nick;
	private String user_email;
	private String user_tel;
	private Integer user_black;
	private Timestamp user_regdate;
	private String user_name;
	private String user_addr;
	private Double user_temp;
	private String user_area;
	
}
