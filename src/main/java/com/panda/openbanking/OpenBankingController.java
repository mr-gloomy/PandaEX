package com.panda.openbanking;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.panda.openbanking.domain.AccountSearchRequestVO;
import com.panda.openbanking.domain.AccountSearchResponseVO;
import com.panda.openbanking.domain.DepositRequestVO;
import com.panda.openbanking.domain.DepositResponseVO;
import com.panda.openbanking.domain.RequestTokenVO;
import com.panda.openbanking.domain.ResponseTokenVO;
import com.panda.openbanking.domain.UserInfoRequestVO;
import com.panda.openbanking.domain.UserInfoResponseVO;
import com.panda.openbanking.domain.WithdrawRequestVO;
import com.panda.openbanking.domain.WithdrawResponseVO;

@Controller
@RequestMapping("/openbanking/*")
public class OpenBankingController {
	
	private static final Logger mylog
				= LoggerFactory.getLogger(OpenBankingController.class);
	
	//--------------------------------------------------------------------------------------------------
	//자동으로 객체생성 하겠다 - Autowired
	@Autowired
	private OpenBankingService openBankingService;
	
	//토큰발급
	@RequestMapping(value = "/callback",method = RequestMethod.GET)
	public String getToken(RequestTokenVO requestTokenVO, Model model, HttpSession session) throws Exception{
		
		mylog.debug(" 1. OpenBankingController - getToken() 호출 ");

		// 사용자인증 API (3-legged) => 응답결과 출력
//		code <authorization_code> 사용자인증 성공 시 반환되는 코드
		System.out.println("code : " + requestTokenVO.getCode());
//		scope [login|inquiry|transfer] Access Token 권한 범위 (다중 scope 가능)
		System.out.println("scope : " + requestTokenVO.getScope());
//		client_info <client_info> 요청 시 이용기관이 세팅한 client_info 값을 그대로 전달
		System.out.println("client_info : " + requestTokenVO.getClient_info());
//		state 주 1) <state> 요청 시 이용기관이 세팅한 state 값을 그대로 전달
		System.out.println("state : " + requestTokenVO.getState());
		
		//토큰발급 => 처리 메서드 호출 리턴 받기
		ResponseTokenVO responseTokenVO=openBankingService.requestToken(requestTokenVO);
		
		//정보를 들고  bank_main.jsp 이동
		model.addAttribute("responseTokenVO", responseTokenVO);
		
		return "bank_main";
	}

	// 사용자 정보 조회
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String getUserInfo(UserInfoRequestVO userInfoRequestVO, Model model) throws Exception{
		
		mylog.debug("userInfoRequestVO : " + userInfoRequestVO);
		
		//토큰발급 => 처리 메서드 호출 리턴 받기
		UserInfoResponseVO userInfo =openBankingService.findUser(userInfoRequestVO);
		
		mylog.debug(userInfo+"userInfo@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		//정보를 들고  bank_main.jsp 이동
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("access_token", userInfoRequestVO.getAccess_token());
		
		return "account/user_info";
	}
	
	// 등록 계좌 조회
		@RequestMapping(value = "/accountList", method = RequestMethod.GET)
		public String getAccountList(AccountSearchRequestVO accountSearchRequestVO, Model model) throws Exception{
			
			//토큰발급 => 처리 메서드 호출 리턴 받기
			AccountSearchResponseVO accountList =openBankingService.findAccount(accountSearchRequestVO);
			
			//정보를 들고  bank_main.jsp 이동
			model.addAttribute("accountList", accountList);
			model.addAttribute("access_token", accountSearchRequestVO.getAccess_token());
			
			return "account/list";
		}
		
		// 출금이체
		@RequestMapping(value = "/withdraw", method = RequestMethod.POST)
		public String getWithdraw(WithdrawRequestVO withdrawRequestVO, Model model)
				throws IOException {
			// Service 객체의 findAccount() 메서드를 호출하여 사용자 정보 조회
			// => 파라미터 : AccountSearchRequestVO, 리턴타입 AccountSearchResponseVO
			// AccountSearchResponseVO accountList =
			// openBankingService.findAccount(accountSearchRequestVO);
			System.out.println(withdrawRequestVO + "@@@@@@@@@@@@@@@@@@@@@@@@");
			WithdrawResponseVO withdrawOK = openBankingService.getwithdraw(withdrawRequestVO);

			// Model 객체에 AccountSearchResponseVO 객체와 엑세스토큰 저장
			model.addAttribute("withdrawOK", withdrawOK);
			model.addAttribute("access_token", withdrawRequestVO.getAccess_token());
			System.out.println("결과@@@@@@@@@@@@@" + withdrawOK);
			// return "account/withdraw";
			return "account/deposit";
		}
		
		//입금이체
		@RequestMapping(value = "/deposit", method = RequestMethod.POST)
		public @ResponseBody DepositResponseVO getDeposit(@RequestBody DepositRequestVO depositRequestVO,Model model)
				throws Exception {
			// Service 객체의 findAccount() 메서드를 호출하여 사용자 정보 조회
			// => 파라미터 : AccountSearchRequestVO, 리턴타입 AccountSearchResponseVO
			// AccountSearchResponseVO accountList =
			// openBankingService.findAccount(accountSearchRequestVO);
			System.out.println("##########################" + depositRequestVO);
			DepositResponseVO depositOK = openBankingService.getDeposit(depositRequestVO);
			System.out.println("@#@#@@#@#@#@@#갔다옴");
			//System.out.println("##########################" + depositOK);
			// Model 객체에 AccountSearchResponseVO 객체와 엑세스토큰 저장
			model.addAttribute("withdrawOK", depositOK);
			model.addAttribute("access_token", depositRequestVO.getAccess_token());
			System.out.println("결과###############" + depositOK);
			// return "account/withdraw";
			
			
			return depositOK;
		}
}
