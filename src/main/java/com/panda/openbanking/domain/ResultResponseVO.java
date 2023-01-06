package com.panda.openbanking.domain;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class ResultResponseVO {
	//이체결과조회 - 응답  transfer/result /fin_num
	private String api_tran_id; //거래고유번호(API)
	private String api_tran_dtm; //거래일시(밀리세컨드) 
	private String rsp_code; //응답코드(API)
	private String rsp_message; //응답메시지(API)
	private String res_cnt; //이체건수
	
	private List<ResultVO> req_list; // 이체목록

}
