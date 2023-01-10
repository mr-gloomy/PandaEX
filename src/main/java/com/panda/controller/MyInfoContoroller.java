package com.panda.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/myinfo/*")
public class MyInfoContoroller {

	
	// http://localhost:8080/myinfo/myinfo
	@RequestMapping(value = "/myinfo",method = RequestMethod.GET)
	public void indexGET(HttpSession session) {
		
	}
}
