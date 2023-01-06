package com.panda.openbanking.domain;

import lombok.Data;

@Data
public class ResultVO {
	private String tran_no; // 거래순번
	private String org_bank_tran_id; // 원거래고유번호(참가기관)
	private String org_bank_tran_date; // 원거래일자(참가기관) 
	private String org_tran_amt; //원거래 거래금액
	private String bank_tran_id; // 거래고유번호(참가기관)
	private String bank_tran_date; // 거래일자(참가기관) 
	private String tran_amt; //거래금액
	private String bank_code_tran; // 응답코드를 부여한 참가기관.표준코드
	private String bank_rsp_code; // 응답코드(참가기관)
	private String bank_rsp_message; // 응답메시지(참가기관)
	private String wd_bank_code_std; // 출금기관.표준코드
	private String wd_bank_code_sub; // 출금기관.점별코드
	private String wd_bank_name; // 출금기관명
	private String wd_savings_bank_name; // 개별(출금)저축은행명
	private String wd_fintech_use_num; // 출금계좌 핀테크이용번호
	private String wd_account_num_masked; // 출금계좌번호(출력용)

	private String wd_print_content; //출금계좌인자내역
	private String wd_account_holder_name; // 송금인성명
	private String dps_bank_code_std; // 입금(개설)기관.표준코드
	private String dps_bank_code_sub; // 입금(개설)기관.점별코드
	private String dps_bank_name; // 입금(개설)기관명
	private String dps_savings_bank_name; // 개별(입금)저축은행명
//	입금이체에 대한 결과조회(check_type=’2’)이고 입금 계좌
//	개설기관이 저축은행 (dps_bank_code_std=‘050’) 인
//	경우에만 제공되며, 계좌의 개별저축은행명이 확인되지 않는
//	경우에는 공란(빈값)이 전송됨
	
	private String dps_fintech_use_num; //입금계좌 핀테크이용번호
	private String dps_account_num_masked; //입금계좌번호(출력용)
	private String dps_print_content; //입금계좌인자내역
	private String dps_account_holder_name; //수취인성명
	
}
