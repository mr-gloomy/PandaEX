package com.panda.openbanking.domain;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class ResultRequestVO {
	//이체결과조회 - 요청  transfer/result /fin_num
	private String access_token; 
	private String check_type; // 1:출금이체, 2:입금이체
	private String tran_dtime; //요청일시 14자리
	private String req_cnt; //입금요청건수 1
	private List<ResultVO> req_list; //입금요청목록
	

}
