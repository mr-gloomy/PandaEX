package com.panda.openbanking.domain;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class DepositRequestVO {
	//입금이체 - 요청  deposit/fin_num
	
	private String access_token;
	private String cntr_account_type; //약정 계좌N/계정Y
	private String cntr_account_num; //약정 계좌/계정번호
	private String wd_pass_phrase; //입금이체용 암호문구
	private String wd_print_content; //출금계좌인자내역
	private String name_check_option; //수취인성명 검정여부 on
	private String tran_dtime; //요청일시 14자리
	private String req_cnt; //입금요청건수 1
	private List<DepositVO> req_list; //입금요청목록
	
	

	
}
