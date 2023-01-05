package com.panda.openbanking;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.panda.openbanking.domain.AccountSearchRequestVO;
import com.panda.openbanking.domain.AccountSearchResponseVO;
import com.panda.openbanking.domain.DepositRequestVO;
import com.panda.openbanking.domain.DepositResponseVO;
import com.panda.openbanking.domain.DepositVO;
import com.panda.openbanking.domain.RequestTokenVO;
import com.panda.openbanking.domain.ResponseTokenVO;
import com.panda.openbanking.domain.ResultRequestVO;
import com.panda.openbanking.domain.ResultResponseVO;
import com.panda.openbanking.domain.ResultVO;
import com.panda.openbanking.domain.UserInfoRequestVO;
import com.panda.openbanking.domain.UserInfoResponseVO;
import com.panda.openbanking.domain.WithdrawRequestVO;
import com.panda.openbanking.domain.WithdrawResponseVO;

@Service
public class OpenBankingApiClient {
	// 자주 쓰이는 값이므로 지정
	private String client_id="e20ec780-27a9-4ce1-9055-6722c59fac24";
	private String client_secret="c25a8a30-b63c-4060-bbe9-e9f99cb8a12c";
	private String redirect_uri="http://localhost:8080/openbanking/callback";
	private String grant_type="authorization_code";
	//http 헤더 정보를 관리하는 클래스 
	private HttpHeaders httpHeaders;
	// REST방식으로 API요청할 때 스프링에서 제공하는 타입
	private RestTemplate restTemplate;  
	
	private static final Logger mylog
	= LoggerFactory.getLogger(OpenBankingController.class);
	
	// 헤더에 토큰 추가 메서드 정의
	public HttpHeaders setHeaderAccessToken(String access_token) {
		httpHeaders.add("Authorization", "Bearer "+access_token);
		return httpHeaders;
	}
	
	//토큰발급 요청 메서드 p11 
	public ResponseTokenVO requestToken(RequestTokenVO requestTokenVO) {
//		HTTP URL https://testapi.openbanking.or.kr/oauth/2.0/token
//	 	HTTP Method POST
//		Content-Type application/x-www-form-urlencoded; charset=UTF-8
		
		// http header 지정
		httpHeaders=new HttpHeaders();
		httpHeaders.add("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		
		// requestTokenVO에는 지금 code만 담겨져있음.  => 다른애들도 저장
		requestTokenVO.setClient_id(client_id);
		requestTokenVO.setClient_secret(client_secret);
		requestTokenVO.setRedirect_uri(redirect_uri);
		requestTokenVO.setGrant_type(grant_type);
		
		// application/x-www-form-urlencoded; charset=UTF-8 객체저장 불가능
		// -> 파라미터값으로 저장 해서 들고감
		MultiValueMap<String, String> parameters // MultiValueMap<이름, 값>
		=new LinkedMultiValueMap<String, String>();
		parameters.add("code", requestTokenVO.getCode());
		parameters.add("client_id", requestTokenVO.getClient_id());
		parameters.add("client_secret", requestTokenVO.getClient_secret());
		parameters.add("redirect_uri", requestTokenVO.getRedirect_uri());
		parameters.add("grant_type", requestTokenVO.getGrant_type());
		
//		httpHeaders,parameters 값을 담아서 가기 위해서 => HttpEntity(객체들을 담아간다)라는 곳에 한꺼번에 담아서 감
		HttpEntity<MultiValueMap<String, String>> param=
				new HttpEntity<MultiValueMap<String,String>>(parameters,httpHeaders);
		
		String requestUrl="https://testapi.openbanking.or.kr/oauth/2.0/token";
			
		restTemplate=new RestTemplate();
		
		return restTemplate.exchange(requestUrl, 
				HttpMethod.POST,param,ResponseTokenVO.class).getBody();
		//restTemplate.exchange(url,post방식,파라미터값들고감,응답하는토큰메시지).Entity본문에 담아가겠다.
	}

	// 사용자 정보 조회
	public UserInfoResponseVO findUser(UserInfoRequestVO userInfoRequestVO) {
		// http header 지정
		httpHeaders=new HttpHeaders();
		restTemplate=new RestTemplate();

		String requestUrl="https://testapi.openbanking.or.kr/v2.0/user/me";


//		httpHeaders(token) 담아서 감 =>HttpEntity
		HttpEntity<String> param=
				new HttpEntity<String>(setHeaderAccessToken(userInfoRequestVO.getAccess_token()));
		
		// user_seq_no 파라미터
		// http://testapi.openbanking.or.kr/v2.0/user/me?user_seq_no=11111
		UriComponents uriBuulder = UriComponentsBuilder.fromHttpUrl(requestUrl)
				.queryParam("user_seq_no", userInfoRequestVO.getUser_seq_no()).build();
	
		mylog.debug(uriBuulder+"");
		
		return restTemplate.exchange(uriBuulder.toString(), 
				HttpMethod.GET,param,UserInfoResponseVO.class).getBody();
	}
	// 등록계좌 조회
	public AccountSearchResponseVO findAccount(AccountSearchRequestVO accountSearchRequestVO) {
		// http header 지정
		httpHeaders=new HttpHeaders();
		restTemplate=new RestTemplate();

		String requestUrl="https://testapi.openbanking.or.kr/v2.0/account/list";


//		httpHeaders(token) 담아서 감 =>HttpEntity
		HttpEntity<String> param=
				new HttpEntity<String>(setHeaderAccessToken(accountSearchRequestVO.getAccess_token()));
		
		// user_seq_no 파라미터
		UriComponents uriBuulder = UriComponentsBuilder.fromHttpUrl(requestUrl)
				.queryParam("user_seq_no", accountSearchRequestVO.getUser_seq_no())
				.queryParam("include_cancel_yn", accountSearchRequestVO.getInclude_cancel_yn())
				.queryParam("sort_order", accountSearchRequestVO.getSort_order())
				.build();
	
		mylog.debug(uriBuulder+"");
		
		return restTemplate.exchange(uriBuulder.toString(), 
				HttpMethod.GET,param,AccountSearchResponseVO.class).getBody();
	}

	// 출금이체 API 
	public WithdrawResponseVO withdraw(WithdrawRequestVO withdrawRequestVO) {
//			HTTP URL https://openapi.openbanking.or.kr/v2.0/transfer/withdraw/fin_num
//			HTTP Method POST
//			Content-Type application/json; charset=UTF-8
		/// REST 방식 요청에 필요한 객체 생성
		httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "application/json; charset=UTF-8");
//		httpHeaders.add("Access_Token",setHeaderAccessToken(withdrawReque stVO.getAccess_token()));
//		 Content-Type  application/json; charset=UTF-8
		// WithdrawRequestVO => 저장
//		requestTokenVO.setClient_id(client_id);
		mylog.debug(withdrawRequestVO.toString());
//		withdrawRequestVO.setBank_tran_id(bank_tran_id);;
		
		
		MultiValueMap<String, String> parameters // MultiValueMap<이름, 값>
				=new LinkedMultiValueMap<String, String>();
		parameters.add("bank_tran_id", withdrawRequestVO.getBank_tran_id());
		parameters.add("cntr_account_type", withdrawRequestVO.getCntr_account_type());
		parameters.add("cntr_account_num", withdrawRequestVO.getCntr_account_num());
		parameters.add("dps_print_content", withdrawRequestVO.getDps_print_content());
		parameters.add("fintech_use_num", withdrawRequestVO.getFintech_use_num());
		parameters.add("tran_amt", withdrawRequestVO.getTran_amt());
		parameters.add("tran_dtime", withdrawRequestVO.getTran_dtime());
		parameters.add("req_client_name", withdrawRequestVO.getReq_client_name());
		parameters.add("req_client_num", withdrawRequestVO.getReq_client_num());
		parameters.add("transfer_purpose", withdrawRequestVO.getTransfer_purpose());
//		parameters.add("req_client_bank_code", withdrawRequestVO.getReq_client_bank_code());
//		parameters.add("req_client_account_num", withdrawRequestVO.getReq_client_account_num());
		parameters.add("req_client_fintech_use_num", withdrawRequestVO.getReq_client_fintech_use_num());
//		parameters.add("recv_client_name", withdrawRequestVO.getRecv_client_name());
//		parameters.add("recv_client_bank_code", withdrawRequestVO.getRecv_client_bank_code());
//		parameters.add("recv_client_account_num", withdrawRequestVO.getRecv_client_account_num());
//		
//		httpHeaders,parameters 담아서 감 =>HttpEntity
		HttpEntity<MultiValueMap<String, String>> param=
				new HttpEntity<MultiValueMap<String,String>>(parameters,setHeaderAccessToken(withdrawRequestVO.getAccess_token()));
																		// httpHeaders
//		HttpEntity<String> param=
//				new HttpEntity<String>(setHeaderAccessToken(accountSearchRequestVO.getAccess_token()));
		String requestUrl = "https://testapi.openbanking.or.kr/v2.0/transfer/withdraw/fin_num";
//		https://openapi.openbanking.or.kr/v2.0/transfer/withdraw/fin_num
			
		restTemplate=new RestTemplate();
		return restTemplate.exchange(requestUrl, 
				HttpMethod.POST,param,WithdrawResponseVO.class).getBody();

	}
	

	// 입금이체
	public DepositResponseVO deposit(DepositRequestVO depositRequestVO,DepositVO depositVO) throws Exception{
		/// REST 방식 요청에 필요한 객체 생성
		restTemplate = new RestTemplate();
		httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "application/json; charset=UTF-8");
		
		mylog.debug(depositRequestVO.toString());
		
		MultiValueMap<String, Object> parameters // MultiValueMap<이름, 값>
		=new LinkedMultiValueMap<String, Object>();
//		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.add("cntr_account_type", depositRequestVO.getCntr_account_type());
		parameters.add("cntr_account_num", depositRequestVO.getCntr_account_num());
		parameters.add("wd_pass_phrase", depositRequestVO.getWd_pass_phrase());
		parameters.add("wd_print_content", depositRequestVO.getWd_print_content());
		parameters.add("name_check_option", depositRequestVO.getName_check_option());
		parameters.add("tran_dtime", depositRequestVO.getTran_dtime());
		parameters.add("req_cnt", depositRequestVO.getReq_cnt());
		
		MultiValueMap<String, Object> parameters2 // MultiValueMap<이름, 값>
		=new LinkedMultiValueMap<String, Object>();
//		Map<String, String> parameters2 = new HashMap<String, String>();
		parameters2.add("tran_no", depositVO.getTran_no());
		parameters2.add("bank_tran_id", depositVO.getBank_tran_id());
//		parameters2.put("bank_tran_id", depositRequestVO.getBank_tran_id());
//		parameters2.put("bank_tran_id", "M202202083U123432345");
		parameters2.add("fintech_use_num", depositVO.getFintech_use_num());
		parameters2.add("print_content", depositVO.getPrint_content());
		parameters2.add("tran_amt", depositVO.getTran_amt());
		parameters2.add("req_client_name", depositVO.getReq_client_name());
		parameters2.add("req_client_bank_code", depositVO.getReq_client_bank_code());
		parameters2.add("req_client_num", depositVO.getReq_client_num());
		parameters2.add("transfer_purpose", depositVO.getTransfer_purpose());
		
		List<Map> req_list = new ArrayList<Map>();
		req_list.add(parameters2);
		//depositRequestVO.setReq_list(req_list);
		
		parameters.add("req_list", req_list);
		System.out.println("저장parameters###############################"+parameters);
		
//		httpHeaders,parameters 담아서 감 =>HttpEntity
	HttpEntity<MultiValueMap<String, Object>> param=
						new HttpEntity<MultiValueMap<String,Object>>(parameters,setHeaderAccessToken(depositRequestVO.getAccess_token()));
		
		// HttpHeader,HttpBody parameters 담아서 감 => HttpEntity
		//HttpEntity<MultiValueMap<String, String>> param = new HttpEntity<MultiValueMap<String, String>>(parameters, httpHeaders);
//		HttpEntity<Map<String, Object>> param = new HttpEntity<Map<String, Object>>(parameters, setHeaderAccessToken(depositRequestVO.getAccess_token()));
		
		String requestUrl = "https://testapi.openbanking.or.kr/v2.0/transfer/deposit/fin_num";
		
		
		
		System.out.println("저장###############################주소저장" + param);
		return restTemplate.exchange(requestUrl, HttpMethod.POST, param, DepositResponseVO.class).getBody();
	}

	public ResultResponseVO result(ResultRequestVO resultRequestVO,ResultVO resultVO) {
		/// REST 방식 요청에 필요한 객체 생성
		restTemplate = new RestTemplate();
		httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "application/json; charset=UTF-8");
		
		mylog.debug(resultRequestVO.toString());
		
		MultiValueMap<String, Object> parameters // MultiValueMap<이름, 값>
		=new LinkedMultiValueMap<String, Object>();
//		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.add("check_type", resultRequestVO.getCheck_type());
		parameters.add("tran_dtime", resultRequestVO.getTran_dtime());
		parameters.add("req_cnt", resultRequestVO.getReq_cnt());
		parameters.add("req_list", resultRequestVO.getReq_cnt());
		
		MultiValueMap<String, Object> parameters2 // MultiValueMap<이름, 값>
		=new LinkedMultiValueMap<String, Object>();
//		Map<String, String> parameters2 = new HashMap<String, String>();
		parameters2.add("tran_no", resultVO.getTran_no());
		parameters2.add("org_bank_tran_id", resultVO.getOrg_bank_tran_id());
		parameters2.add("org_bank_tran_date", resultVO.getOrg_bank_tran_date());
		parameters2.add("org_tran_amt", resultVO.getOrg_tran_amt());
		
		List<Map> req_list = new ArrayList<Map>();
		req_list.add(parameters2);
		//depositRequestVO.setReq_list(req_list);
		
		parameters.add("req_list", req_list);
		System.out.println("저장parameters###############################"+parameters);
		
//		httpHeaders,parameters 담아서 감 =>HttpEntity
	HttpEntity<MultiValueMap<String, Object>> param=
						new HttpEntity<MultiValueMap<String,Object>>(parameters,setHeaderAccessToken(resultRequestVO.getAccess_token()));
		
		// HttpHeader,HttpBody parameters 담아서 감 => HttpEntity
		//HttpEntity<MultiValueMap<String, String>> param = new HttpEntity<MultiValueMap<String, String>>(parameters, httpHeaders);
//		HttpEntity<Map<String, Object>> param = new HttpEntity<Map<String, Object>>(parameters, setHeaderAccessToken(depositRequestVO.getAccess_token()));
		
		String requestUrl = "https://testapi.openbanking.or.kr/v2.0/transfer/result";
		
		
		
		System.out.println("저장###############################주소저장" + param);
		return restTemplate.exchange(requestUrl, HttpMethod.POST, param, ResultResponseVO.class).getBody();
	}
	
	
}
