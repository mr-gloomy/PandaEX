package com.panda.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.panda.domain.AuctionVO;
import com.panda.domain.BoardVO;
import com.panda.domain.ChatVO;
import com.panda.domain.Criteria;
import com.panda.domain.GoodsVO;
import com.panda.domain.PageVO;
import com.panda.service.AuctionService;
import com.panda.service.BoardService;
import com.panda.service.ChatService;
import com.panda.service.GoodsService;
import com.panda.service.MemberService;

import lombok.NoArgsConstructor;


@Controller
@RequestMapping(value = "/main/*")
@NoArgsConstructor
public class MainPageController {
	
	@Inject
	ChatService service;
	
	@Inject
	GoodsService gService;
	
	@Inject
	AuctionService aService;
	
	@Inject
	private MemberService mService;
	
	@Inject
	private BoardService bService;
	
	@Autowired
	private HttpSession session;
	
	private static final Logger mylog
				= LoggerFactory.getLogger(MainPageController.class);
	
	
	// http://localhost:8080/main/index
	@RequestMapping(value = "/index",method = RequestMethod.GET)
	public void indexGET(HttpSession session, Model model, GoodsVO gvo, AuctionVO avo) throws Exception {
		
		mylog.debug(" /main/index 호출 ");
		
		// random List
		model.addAttribute("GoodsRand", gService.g_randList());
		model.addAttribute("AuctionRand", gService.a_randList());
		model.addAttribute("vo",mService.getMember((String)session.getAttribute("user_id")));
		model.addAttribute("gvo",gService.getGoods2(gvo));

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
		mylog.info("bang_id:"+bang_id);
		model.addAttribute("u",vo.getU());
		if (vo.getG()!=0) {
		model.addAttribute("goods", gService.getGoods(vo.getG()));
		} else if (vo.getA()!=0) {
		model.addAttribute("auctions",aService.getAuction(vo.getA()));
		}
		return "/addon/chat";
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// http://localhost:8080/main/board
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public void mainBoard(Criteria cri,Model model)throws Exception{
		
		mylog.debug(" mainBoard() 호출 ");
		
		session.setAttribute("updateCheck", true);
		
		List<BoardVO> boardList =  bService.getBoardAll(cri);
		
		// 페이징처리 하단부 정보 준비 -> view페이지 전달
		PageVO pvo = new PageVO();
		
		pvo.setCri(cri);
		
		
		mylog.debug(" totalCnt : "+bService.totalCnt());
		pvo.setTotalCount(bService.totalCnt()); // 작성되어있는 글 전체 개수
		
		
		model.addAttribute("pvo", pvo);
		model.addAttribute("boardList", boardList);
		
		
		
		
	}
	
	// http://localhost:8080/main/content?bno=1
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public void mainContent(Model model,@RequestParam("bno") int bno)throws Exception{
		
		
		boolean isUpdateCheck = (boolean)session.getAttribute("updateCheck");
		mylog.debug(" 조회수 증가 전 isUpdateCheck : "+isUpdateCheck);
		
		
		if(isUpdateCheck) {
			mylog.debug(" 조회수 1증가 ! ");
			
			
			session.setAttribute("updateCheck", !isUpdateCheck);
			
			mylog.debug(" isUpdateCheck : "+isUpdateCheck);
			
			bService.upReadCnt(bno);
		}
		
		BoardVO cvo = bService.getContent(bno);
		
		model.addAttribute("cvo", cvo);
		
	}
	
	
}
