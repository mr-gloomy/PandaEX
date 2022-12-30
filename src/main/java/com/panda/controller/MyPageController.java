package com.panda.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.panda.service.MyPageService;

@Controller
@RequestMapping(value = "/mypage/*")
public class MyPageController {
	
	// 로거 객체
	private static final Logger mylog
	= LoggerFactory.getLogger(MemberController.class);
	
	// 서비스 객체
	@Inject
	private MyPageService service;
	
	// http://localhost:8080/mypage/myPage
	
	// 마이페이지 -  GET   
	@RequestMapping(value = "/mypage", method = RequestMethod.GET )
	public String mypage() {
		mylog.info(" mypage 호출 ");	
					
		return "mypage/myPage";
	}
	
	// 
	
	// 마이 페이지 - 찜

}