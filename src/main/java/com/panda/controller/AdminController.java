package com.panda.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.panda.domain.BoardVO;
import com.panda.service.BoardService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Inject
	private BoardService service;
	
	// 로거객체
	private static final Logger mylog
		= LoggerFactory.getLogger(AdminController.class);
	
	
	// 어드민 메인페이지
	// http://localhost:8080/admin/main
	@RequestMapping(value = "/main")
	public void mainGET(HttpSession session)throws Exception{
		mylog.debug(" mainGET() 호출 ");
	}
	
	// 공지사항 게시판 작성페이지 GET
	
	// http://localhost:8080/admin/boardRegist
	@RequestMapping(value = "/boardRegist",method = RequestMethod.GET)
	public void boardRegistGET()throws Exception{
		mylog.debug(" boardRegistGET() 호출 ");
		
	}
	
	
	// 공지사항 게시판 작성페이지 POST
	// http://localhost:8080/admin/boardRegist
	@RequestMapping(value = "/boardRegist",method = RequestMethod.POST)
	public String boardRegistPOST(BoardVO vo)throws Exception{
		mylog.debug(" boardRegistGET() 호출 ");
		
		service.insertBoard(vo);
		mylog.debug(" 게시판 글쓰기 완료");
		
		return "redirect:/admin/list";
	}
	
	// 공지사항 게시판 list
	// http://localhost:8080/admin/list
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public void listGET() {
		mylog.debug(" listGET() 호출 ");
		
		
		
		
	}
	
}
