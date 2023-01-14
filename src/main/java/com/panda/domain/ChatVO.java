package com.panda.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ChatVO {
	private	String send_id;
	private	String receive_id;
	private	String bang_id;
	private	String message;
	private Long msg_date;
	private	int goods_no;
	private	int auction_no;
	private	int g;
	private	String u;
	private	int a;
}
