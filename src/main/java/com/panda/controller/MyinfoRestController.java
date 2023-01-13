package com.panda.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.panda.domain.MemberVO;
import com.panda.service.MyPageService;

@RestController
@RequestMapping("/myp")
public class MyinfoRestController {
	@Inject
	private MyPageService myservice;
	
	private static final Logger mylog = LoggerFactory.getLogger(MyinfoRestController.class);
	@RequestMapping(value = "/ckpw",method = RequestMethod.GET )
	public String checkID(MemberVO vo) throws Exception{
	
		vo = myservice.getMembera(vo);
		mylog.debug("어디까지인가"+myservice.getMembera(vo));
		
		if(vo == null) {
			// 디비에 정보가 없음 -> 해당 아이디 사용가능
			return "NO";
		}else {
			// 디비에 정보가 있음 -> 해당 아이디 사용불가능
			return "OK";
		}
		
	}
}
