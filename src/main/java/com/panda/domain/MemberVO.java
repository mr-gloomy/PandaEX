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
	public String getUser_no() {
		return user_no;
	}
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public Integer getUser_black() {
		return user_black;
	}
	public void setUser_black(Integer user_black) {
		this.user_black = user_black;
	}
	public Timestamp getUser_regdate() {
		return user_regdate;
	}
	public void setUser_regdate(Timestamp user_regdate) {
		this.user_regdate = user_regdate;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public Double getUser_temp() {
		return user_temp;
	}
	public void setUser_temp(Double user_temp) {
		this.user_temp = user_temp;
	}
	public String getUser_area() {
		return user_area;
	}
	public void setUser_area(String user_area) {
		this.user_area = user_area;
	}
	@Override
	public String toString() {
		return "MemberVO [user_no=" + user_no + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_nick="
				+ user_nick + ", user_email=" + user_email + ", user_tel=" + user_tel + ", user_black=" + user_black
				+ ", user_regdate=" + user_regdate + ", user_name=" + user_name + ", user_addr=" + user_addr
				+ ", user_temp=" + user_temp + ", user_area=" + user_area + "]";
	}
	
	
}
