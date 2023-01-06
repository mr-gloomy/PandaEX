package com.panda.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.panda.domain.BoardVO;
import com.panda.domain.Criteria;
import com.panda.domain.PageVO;
import com.panda.service.BoardService;


//@RestController
//@RequestMapping(value = "/admins")
public class AdminRestController {
	
	
	private static final Logger mylog
		= LoggerFactory.getLogger(AdminRestController.class);
	
	@Inject
	private BoardService service;
	
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String listGET(@ModelAttribute("category")String category,
			Criteria cri,Model model,HttpSession session)throws Exception {
		
		mylog.debug(" listGET() 호출 ");
		
		mylog.debug(category+"");
		
		session.setAttribute("updateCheck", true);
		
		List<BoardVO> boardList =  service.getBoardAll(cri);
		
		// 페이징처리 하단부 정보 준비 -> view페이지 전달
		PageVO pvo = new PageVO();
		
		pvo.setCri(cri);
		mylog.debug(" totalCnt : "+service.totalCnt());
		pvo.setTotalCount(service.totalCnt()); // 작성되어있는 글 전체 개수
		
		
		model.addAttribute("pvo", pvo);
		model.addAttribute("boardList", boardList);
		
		return category;
		
		}
	
	

}
