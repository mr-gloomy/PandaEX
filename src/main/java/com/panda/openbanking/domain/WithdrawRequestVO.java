package com.panda.openbanking.domain;

import lombok.Data;

@Data
public class WithdrawRequestVO {
	//출금이체 - 요청
	private String access_token; 
	private String bank_tran_id; //은행거래고유번호
	private String cntr_account_type; //약정 계좌N/계정C 구분
	private String cntr_account_num; //계좌 번호
	private String dps_print_content; //계좌인좌내역 "쇼핑몰환불"이런거
	private String fintech_use_num; //출금계좌핀테크이용번호
	private String tran_amt; //거래금액
	private String tran_dtime; //요청일시
	private String req_client_name; //요청고객성명
	private String req_client_num; //요청고객회원번호
	private String transfer_purpose; //이체용도 TR송금 - TR
	private String req_client_bank_code; 
	private String req_client_account_num; 
	private String req_client_fintech_use_num; 
	
	
	private String sub_frnc_name;
	private String sub_frnc_num;
	private String sub_frnc_business_num;
	private String recv_client_name; //최종수취고객성명
	private String recv_client_bank_code; //계좌개설기관코드
	private String recv_client_account_num; //계좌번호
	
	
	public String getBank_tran_id() {
		return "M202202083U"+ (int)((Math.random()+1)*100000000);
	}
	public void setBank_tran_id() {
		this.bank_tran_id = "M202202083U"+ (Math.random()+1)*100000000;
	}
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public String getCntr_account_type() {
		return cntr_account_type;
	}
	public void setCntr_account_type(String cntr_account_type) {
		this.cntr_account_type = cntr_account_type;
	}
	public String getCntr_account_num() {
		return cntr_account_num;
	}
	public void setCntr_account_num(String cntr_account_num) {
		this.cntr_account_num = cntr_account_num;
	}
	public String getDps_print_content() {
		return dps_print_content;
	}
	public void setDps_print_content(String dps_print_content) {
		this.dps_print_content = dps_print_content;
	}
	public String getFintech_use_num() {
		return fintech_use_num;
	}
	public void setFintech_use_num(String fintech_use_num) {
		this.fintech_use_num = fintech_use_num;
	}
	public String getTran_amt() {
		return tran_amt;
	}
	public void setTran_amt(String tran_amt) {
		this.tran_amt = tran_amt;
	}
	public String getTran_dtime() {
		return tran_dtime;
	}
	public void setTran_dtime(String tran_dtime) {
		this.tran_dtime = tran_dtime;
	}
	public String getReq_client_name() {
		return req_client_name;
	}
	public void setReq_client_name(String req_client_name) {
		this.req_client_name = req_client_name;
	}
	public String getReq_client_num() {
		return req_client_num;
	}
	public void setReq_client_num(String req_client_num) {
		this.req_client_num = req_client_num;
	}
	public String getTransfer_purpose() {
		return transfer_purpose;
	}
	public void setTransfer_purpose(String transfer_purpose) {
		this.transfer_purpose = transfer_purpose;
	}
	public String getReq_client_bank_code() {
		return req_client_bank_code;
	}
	public void setReq_client_bank_code(String req_client_bank_code) {
		this.req_client_bank_code = req_client_bank_code;
	}
	public String getReq_client_account_num() {
		return req_client_account_num;
	}
	public void setReq_client_account_num(String req_client_account_num) {
		this.req_client_account_num = req_client_account_num;
	}
	public String getReq_client_fintech_use_num() {
		return req_client_fintech_use_num;
	}
	public void setReq_client_fintech_use_num(String req_client_fintech_use_num) {
		this.req_client_fintech_use_num = req_client_fintech_use_num;
	}
	public String getSub_frnc_name() {
		return sub_frnc_name;
	}
	public void setSub_frnc_name(String sub_frnc_name) {
		this.sub_frnc_name = sub_frnc_name;
	}
	public String getSub_frnc_num() {
		return sub_frnc_num;
	}
	public void setSub_frnc_num(String sub_frnc_num) {
		this.sub_frnc_num = sub_frnc_num;
	}
	public String getSub_frnc_business_num() {
		return sub_frnc_business_num;
	}
	public void setSub_frnc_business_num(String sub_frnc_business_num) {
		this.sub_frnc_business_num = sub_frnc_business_num;
	}
	public String getRecv_client_name() {
		return recv_client_name;
	}
	public void setRecv_client_name(String recv_client_name) {
		this.recv_client_name = recv_client_name;
	}
	public String getRecv_client_bank_code() {
		return recv_client_bank_code;
	}
	public void setRecv_client_bank_code(String recv_client_bank_code) {
		this.recv_client_bank_code = recv_client_bank_code;
	}
	public String getRecv_client_account_num() {
		return recv_client_account_num;
	}
	public void setRecv_client_account_num(String recv_client_account_num) {
		this.recv_client_account_num = recv_client_account_num;
	}
	@Override
	public String toString() {
		return "WithdrawRequestVO [access_token=" + access_token + ", bank_tran_id=" + bank_tran_id
				+ ", cntr_account_type=" + cntr_account_type + ", cntr_account_num=" + cntr_account_num
				+ ", dps_print_content=" + dps_print_content + ", fintech_use_num=" + fintech_use_num + ", tran_amt="
				+ tran_amt + ", tran_dtime=" + tran_dtime + ", req_client_name=" + req_client_name + ", req_client_num="
				+ req_client_num + ", transfer_purpose=" + transfer_purpose + ", req_client_bank_code="
				+ req_client_bank_code + ", req_client_account_num=" + req_client_account_num
				+ ", req_client_fintech_use_num=" + req_client_fintech_use_num + ", sub_frnc_name=" + sub_frnc_name
				+ ", sub_frnc_num=" + sub_frnc_num + ", sub_frnc_business_num=" + sub_frnc_business_num
				+ ", recv_client_name=" + recv_client_name + ", recv_client_bank_code=" + recv_client_bank_code
				+ ", recv_client_account_num=" + recv_client_account_num + "]";
	}



	
	
}
