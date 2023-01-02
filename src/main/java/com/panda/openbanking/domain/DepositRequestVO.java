package com.panda.openbanking.domain;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class DepositRequestVO {
	//입금이체 - 요청  deposit/fin_num
	
	private String access_token;
	private String cntr_account_type; //약정 계좌N/계정Y
	private String cntr_account_num; //약정 계좌/ㄱㅖ정본호
	private String wd_pass_phrase; //입금이체용 암호문구
	private String wd_print_content; //출금계좌인자내역
	private String name_check_option; //수취인성명 검정여부 on
	private String tran_dtime; //요청일시 14자리
	private String req_cnt; //입금요청건수 1
	private List req_list; //입금요청목록
	
	private String tran_no; //거래순ㄹ번 1
	private String bank_tran_id; //은행거래고유번호
	private String fintech_use_num; //핀테크이용번호
	private String print_content; //입금계좌인자내역
	private String tran_amt; //거래금액
	private String req_client_name; //요청고객성명
	private String req_client_bank_code;
	private String req_client_account_num;
	
	
	private String req_client_num; //요청고객회원번호
	private String transfer_purpose; //이체용도 TR
	
	public String getBank_tran_id() {
		return "M202202391U"+ (int)((Math.random()+1)*100000000);
	}
//	public void setBank_tran_id() {
//		this.bank_tran_id = "M202202391U"+ (Math.random()+1)*100000000;
//	}

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

	public String getWd_pass_phrase() {
		return wd_pass_phrase;
	}

	public void setWd_pass_phrase(String wd_pass_phrase) {
		this.wd_pass_phrase = wd_pass_phrase;
	}

	public String getWd_print_content() {
		return wd_print_content;
	}

	public void setWd_print_content(String wd_print_content) {
		this.wd_print_content = wd_print_content;
	}

	public String getName_check_option() {
		return name_check_option;
	}

	public void setName_check_option(String name_check_option) {
		this.name_check_option = name_check_option;
	}

	public String getTran_dtime() {
		return tran_dtime;
	}

	public void setTran_dtime(String tran_dtime) {
		this.tran_dtime = tran_dtime;
	}

	public String getReq_cnt() {
		return req_cnt;
	}

	public void setReq_cnt(String req_cnt) {
		this.req_cnt = req_cnt;
	}

	public List getReq_list() {
		return req_list;
	}

	public void setReq_list(List req_list) {
		this.req_list = req_list;
	}

	public String getTran_no() {
		return tran_no;
	}

	public void setTran_no(String tran_no) {
		this.tran_no = tran_no;
	}

	public String getFintech_use_num() {
		return fintech_use_num;
	}

	public void setFintech_use_num(String fintech_use_num) {
		this.fintech_use_num = fintech_use_num;
	}

	public String getPrint_content() {
		return print_content;
	}

	public void setPrint_content(String print_content) {
		this.print_content = print_content;
	}

	public String getTran_amt() {
		return tran_amt;
	}

	public void setTran_amt(String tran_amt) {
		this.tran_amt = tran_amt;
	}

	public String getReq_client_name() {
		return req_client_name;
	}

	public void setReq_client_name(String req_client_name) {
		this.req_client_name = req_client_name;
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

	public void setBank_tran_id(String bank_tran_id) {
		this.bank_tran_id = bank_tran_id;
	}

	@Override
	public String toString() {
		return "DepositRequestVO [access_token=" + access_token + ", cntr_account_type=" + cntr_account_type
				+ ", cntr_account_num=" + cntr_account_num + ", wd_pass_phrase=" + wd_pass_phrase
				+ ", wd_print_content=" + wd_print_content + ", name_check_option=" + name_check_option
				+ ", tran_dtime=" + tran_dtime + ", req_cnt=" + req_cnt + ", req_list=" + req_list + ", tran_no="
				+ tran_no + ", bank_tran_id=" + bank_tran_id + ", fintech_use_num=" + fintech_use_num
				+ ", print_content=" + print_content + ", tran_amt=" + tran_amt + ", req_client_name=" + req_client_name
				+ ", req_client_bank_code=" + req_client_bank_code + ", req_client_account_num="
				+ req_client_account_num + ", req_client_num=" + req_client_num + ", transfer_purpose="
				+ transfer_purpose + "]";
	}


	
}
