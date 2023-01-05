package com.panda.openbanking.domain;

import lombok.Data;

//@Data
public class ResultVO {
	private String tran_no;
	private String org_bank_tran_id;
	private String org_bank_tran_date;
	private String org_tran_amt;
	
	
	
	public String getTran_no() {
		return tran_no;
	}


	public void setTran_no(String tran_no) {
		this.tran_no = tran_no;
	}


	public String getOrg_bank_tran_id() {
		return "M202202391U"+ (int)((Math.random()+1)*100000000);
	}


	public void setOrg_bank_tran_id(String org_bank_tran_id) {
		this.org_bank_tran_id = org_bank_tran_id;
	}


	public String getOrg_bank_tran_date() {
		return org_bank_tran_date;
	}


	public void setOrg_bank_tran_date(String org_bank_tran_date) {
		this.org_bank_tran_date = org_bank_tran_date;
	}


	public String getOrg_tran_amt() {
		return org_tran_amt;
	}


	public void setOrg_tran_amt(String org_tran_amt) {
		this.org_tran_amt = org_tran_amt;
	}


	@Override
	public String toString() {
		return "ResultVO [tran_no=" + tran_no + ", org_bank_tran_id=" + org_bank_tran_id + ", org_bank_tran_date="
				+ org_bank_tran_date + ", org_tran_amt=" + org_tran_amt + "]";
	} 
	
}
