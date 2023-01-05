package com.panda.openbanking;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/account/*")
public class PayController {
	
	
	
	// 페이페이지 임시 컨트롤러입니다.
	
	// http://localhost:8080/account/pay_page
	@RequestMapping(value = "/pay_page",method = RequestMethod.GET)
	public void pay_page() {
		
	}
	
}
