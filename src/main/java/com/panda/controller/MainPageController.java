package com.panda.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/main/*")
public class MainPageController {
	
	
	private static final Logger logger
				= LoggerFactory.getLogger(MainPageController.class);
	
	
	// http://localhost:8080/main/index
	@RequestMapping(value = "/index",method = RequestMethod.GET)
	public void indexGET() {
		
		logger.debug(" 메인페이지 GET() 호출123123 ");
		
	}
	
}
