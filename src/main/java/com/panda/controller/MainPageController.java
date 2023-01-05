package com.panda.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.panda.domain.ChatVO;
import com.panda.service.ChatService;


@Controller
@RequestMapping(value = "/main/*")
public class MainPageController {
	
	@Inject
	ChatService service;
	
	private static final Logger logger
				= LoggerFactory.getLogger(MainPageController.class);
	
	
	// http://localhost:8080/main/index
	@RequestMapping(value = "/index",method = RequestMethod.GET)
	public void indexGET(HttpSession session) {
		logger.debug(" 메인페이지 GET() 호출123123 ");
		
	}
	
	@GetMapping("/chat")
	public String chat(Model model,ChatVO vo,String bang_id) throws Exception{
		
		if (vo!=null) {
			bang_id = service.getRoom(vo);
		}
		
		if (bang_id==null) {
            for (int i = 0; i < 15; i++) {
                char upperCh = (char)((int)(Math.random()*25) + 97);
                bang_id += upperCh;
            }
		}
		model.addAttribute("bang_id",bang_id);
		return "/addon/chat";
	}
	
	@RequestMapping(value = "/test",method = RequestMethod.GET)
	public void test() {
		
		
	}
}
