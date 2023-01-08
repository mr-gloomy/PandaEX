package com.panda.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReportVO {
	private int rep_no;
	private int goods_no;
	private String u_id;
	private String rep_subject;
	private String rep_reason;
	private String rep_memo;
	private Timestamp rep_date;
	private int rep_howmany;
	private String rep_file;
	private int rep_sort;
	private String rep_u_id;
}
