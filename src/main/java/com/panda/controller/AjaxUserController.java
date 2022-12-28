package com.panda.controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.panda.domain.MemberVO;

@RestController
public class AjaxUserController {
	
	@RequestMapping(value="/ajaxlogin", method = RequestMethod.POST)
	public void ajaxlogin(@RequestBody MemberVO vo) throws Exception{
		
	}
	
	
}


