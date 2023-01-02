package com.panda.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.panda.domain.AuctionVO;
import com.panda.domain.GoodsVO;
import com.panda.service.AuctionService;

@Controller
@RequestMapping(value="/auction/*")
public class AuctionController {
   
   private static final Logger mylog = LoggerFactory.getLogger(AuctionController.class);
   
   @Inject
   private AuctionService service;
   
   //http://localhost:8080/auction/a_regist
   // 기부경매 상품 등록하기 GET
   @RequestMapping(value = "/a_regist", method = RequestMethod.GET)
   public void a_registGET() throws Exception {
	   mylog.debug("/auction/a_regist(GET) 호출 -> 페이지 이동");
   }
   
   // 기부경매 상품 등록하기 POST
   @RequestMapping(value = "/a_regist", method = RequestMethod.POST)
   public String a_registPOST(AuctionVO avo, RedirectAttributes rttr) throws Exception {
	   mylog.debug("/auction/a_regist(POST) 호출");
	   
	   mylog.debug(avo.toString());
	   
	   service.insertAuction(avo);
	   mylog.debug("경매 상품 등록 완료");
	   
	   rttr.addFlashAttribute("result", "creatOK");
	   
	   return "redirect:/auction/a_list";
   }
      
   
   // http://localhost:8080/auction/a_list
   // 기부경매 전체 상품 목록
   @RequestMapping(value = "/a_list", method=RequestMethod.GET)
   public void a_listGET(HttpSession session,Model model,@ModelAttribute("result") String result) throws Exception {
	  mylog.debug("/auction/a_list(GET) 호출 -> DB정보 가져와서 출력 "); 
	  mylog.debug("전달정보 : "+result);
	  
	  session.setAttribute("updateCheck", true);
	  
	  List<AuctionVO> auctionList = service.getAuctionListAll();
	  
	  model.addAttribute("auctionList", auctionList);
   }
   
    // http://localhost:8080/auction/a_read
	// 기부경매 상품 상세페이지
	@GetMapping(value = "/a_read")
	public void a_readGET(@RequestParam("auction_no") int auction_no, HttpSession session, Model model) throws Exception{
		mylog.debug("전달정보 : " + auction_no);
		
		// 세션객체
		boolean isUpdateCheck = (boolean) session.getAttribute("updateCheck");
		mylog.debug("조회수 증가 상태 : " + isUpdateCheck);

		if (isUpdateCheck) { // true
			service.updateViewcnt(auction_no);
			mylog.debug("조회수 1 증가");
			
			session.setAttribute("updateCheck", !isUpdateCheck);
		}
		
		// 서비스 -> DAO (특정 글번호에 해당하는 정보 가져오기)
		AuctionVO avo = service.getAuction(auction_no);
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("avo", avo);
	}   
   
   
}