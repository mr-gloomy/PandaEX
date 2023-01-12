package com.panda.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.panda.domain.ChatVO;
import com.panda.service.AuctionService;
import com.panda.service.ChatService;
import com.panda.service.GoodsService;


@Controller
@RequestMapping(value = "/main/*")
public class MainPageController {
	
	@Inject
	ChatService service;
	
	@Inject
	GoodsService gService;
	
	@Inject
	AuctionService aService;
	
	private static final Logger logger
				= LoggerFactory.getLogger(MainPageController.class);
	
	
	// http://localhost:8080/main/index
	@RequestMapping(value = "/index",method = RequestMethod.GET)
	public void indexGET(HttpSession session) {
		logger.debug(" 메인페이지 GET() 호출123123 ");
		
	}
	
	@GetMapping("/chat")
	public String chat(Model model,HttpSession session,String bang_id, ChatVO vo, HttpServletResponse response) throws Exception{
		
		if ((String)session.getAttribute("user_id")!=null) {
			vo.setSend_id((String)session.getAttribute("user_id"));
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 이용할 수 있습니다.');");
			out.println("window.close();");
			out.println("</script>");
		}
		vo.setReceive_id(vo.getU());
		
		if (vo!=null) {
			bang_id = service.getRoom(vo);
		}
		
		if (bang_id==null) {
			bang_id="";
            for (int i = 0; i < 15; i++) {
                char upperCh = (char)((int)(Math.random()*25) + 97);
                bang_id += upperCh;
            }
		} 
		model.addAttribute("bang_id",bang_id);
		logger.info("bang_id:"+bang_id);
		model.addAttribute("u",vo.getU());
		if (vo.getG()!=0) {
		model.addAttribute("goods", gService.getGoods(vo.getG()));
		} else if (vo.getA()!=0) {
		model.addAttribute("auctions",aService.getAuction(vo.getA()));
		}
		return "/addon/chat";
	}
	
	@RequestMapping(value = "/test",method = RequestMethod.GET)
	public void test() {
		
		
	}
}
