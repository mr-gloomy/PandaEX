package com.panda.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {
	
	private Integer bno;
	private String title;
	private String content;
	private String writer;
	private Timestamp regdate;
	private int viewcnt;
	
	
}
