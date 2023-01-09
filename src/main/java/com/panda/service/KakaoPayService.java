package com.panda.service;

import java.net.URISyntaxException;

import com.panda.paymentvo.KakaoPayApproveRequestVO;
import com.panda.paymentvo.KakaoPayApproveResponseVO;
import com.panda.paymentvo.KakaoPayCancelRequestVO;
import com.panda.paymentvo.KakaoPayCancelResponseVO;
import com.panda.paymentvo.KakaoPayOrderRequestVO;
import com.panda.paymentvo.KakaoPayOrderResponseVO;
import com.panda.paymentvo.KakaoPayReadyRequestVO;
import com.panda.paymentvo.KakaoPayReadyResponseVO;

public interface KakaoPayService {
	KakaoPayReadyResponseVO ready(KakaoPayReadyRequestVO requestVO) throws URISyntaxException;
	KakaoPayApproveResponseVO approve(KakaoPayApproveRequestVO requestVO) throws URISyntaxException;
	KakaoPayOrderResponseVO order(KakaoPayOrderRequestVO kakaoPayOrderRequestVO) throws URISyntaxException;
	KakaoPayCancelResponseVO cancel(KakaoPayCancelRequestVO requestVO) throws URISyntaxException;
}
