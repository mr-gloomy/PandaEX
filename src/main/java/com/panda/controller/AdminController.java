package com.panda.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String boardRegistPOST(BoardVO vo,RedirectAttributes rttr)throws Exception{
		mylog.debug(" boardRegistGET() 호출 ");
		
		service.insertBoard(vo);
		
		mylog.debug(" 게시판 글쓰기 완료");
		
		// 글쓰기 완료시 전달.
		rttr.addFlashAttribute("result", "registOK");
		
		return "redirect:/admin/list";
	}
	
	// 공지사항 게시판 list GET
	// http://localhost:8080/admin/list
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public void listGET(Model model,HttpSession session)throws Exception {
		
		mylog.debug(" listGET() 호출 ");
		
//		mylog.debug(" 글쓰기 결과 (result) : "+result);
		session.setAttribute("updateCheck", true);
		
		List<BoardVO> boardList =  service.getBoardAll();
		
		model.addAttribute("boardList", boardList);
		
		}
		
	// 게시판 본문보기 GET
	// http://localhost:8080/admin/content
	// http://localhost:8080/admin/content?bno=1
	@RequestMapping(value = "/content",method = RequestMethod.GET)
	public void contentGET(Model model,@RequestParam("bno") int bno,HttpSession session) throws Exception{
		mylog.debug(" contentGET() 호출 => 글번호(bno) : "+bno);
		
		
		boolean isUpdateCheck = (boolean)session.getAttribute("updateCheck");
		mylog.debug(" 조회수 증가 전 isUpdateCheck : "+isUpdateCheck);
		
		
		if(isUpdateCheck) {
			// list >> content 로 왔을때만 
			mylog.debug(" 조회수 1증가 ! ");
			
			
			session.setAttribute("updateCheck", !isUpdateCheck);
			
			mylog.debug(" isUpdateCheck : "+isUpdateCheck);
			
			service.upReadCnt(bno);
			
		}
		
		// 서비스 -> DAO (특정 글번호에 해당하는 정보 가져오기)
		BoardVO cvo = service.getContent(bno);
		
		model.addAttribute("cvo", cvo);
		
	}
	
	
	// 게시판 수정 GET
	@RequestMapping(value = "/modify",method = RequestMethod.GET)
	public void modifyGET(Model model,@ModelAttribute("bno") int bno)throws Exception{
		model.addAttribute("cvo", service.getContent(bno));	
		
	}
	
	// 게시판 수정 POST
	@RequestMapping(value = "/modify",method = RequestMethod.POST)
	public String modifyPOST(BoardVO vo,RedirectAttributes rttr)throws Exception{
		
		mylog.debug(" modifyPOST() 호출"); 
		
		Integer result = service.updateBoard(vo);
		
		if(result>0) {
			// "수정완료" - 정보전달
			rttr.addFlashAttribute("result","modOK");
		}
		
		return "redirect:/admin/list";
	}
	
	// 게시판 삭제 POST
	@RequestMapping(value = "/remove",method = RequestMethod.POST)
	public String removePOST(@RequestParam("bno")int bno, RedirectAttributes rttr)throws Exception{
		

		Integer result = service.deleteBoard(bno);
		
		if(result>0) {
			// "수정완료" - 정보전달
			rttr.addFlashAttribute("result","remOK");
		}
		
		return "redirect:/admin/list";
	}
	
}
