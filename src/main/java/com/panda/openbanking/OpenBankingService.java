package com.panda.openbanking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.panda.openbanking.domain.AccountSearchRequestVO;
import com.panda.openbanking.domain.AccountSearchResponseVO;
import com.panda.openbanking.domain.RequestTokenVO;
import com.panda.openbanking.domain.ResponseTokenVO;
import com.panda.openbanking.domain.UserInfoRequestVO;
import com.panda.openbanking.domain.UserInfoResponseVO;
import com.panda.openbanking.domain.WithdrawRequestVO;
import com.panda.openbanking.domain.WithdrawResponseVO;


@Service
public class OpenBankingService {

	// 객체생성
	@Autowired
	private OpenBankingApiClient  openBankingApiClient;
	
	//토큰발급 요청 메서드 - 서비스에선 호출만 하고 실제적인 작업은 openBankingApiClient에서.
	public ResponseTokenVO requestToken(RequestTokenVO requestTokenVO) {
		return openBankingApiClient.requestToken(requestTokenVO);
	}

	// 사용자 정보 조회
	public UserInfoResponseVO findUser(UserInfoRequestVO userInfoRequestVO) {
		return openBankingApiClient.findUser(userInfoRequestVO);
	}
	
	// 등록계좌 조회
	public AccountSearchResponseVO findAccount(AccountSearchRequestVO accountSearchRequestVO) {
		return openBankingApiClient.findAccount(accountSearchRequestVO);
	}

	// 출금입금
		public WithdrawResponseVO getwithdraw( WithdrawRequestVO withdrawRequestVO) {
			return openBankingApiClient.withdraw(withdrawRequestVO);
		}
	
}
