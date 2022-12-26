package com.panda.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	
	// 로거객체
	
	private static final Logger mylog
		= LoggerFactory.getLogger(MemberController.class);
	
	// http://localhost:8080/member/join
	@RequestMapping(value = "/join",method = RequestMethod.GET)
	public void joinGET() {
		mylog.debug(" joinGET() 호출 ");
		
	}
	
	
	
}
