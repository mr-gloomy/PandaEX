package com.panda.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.panda.domain.AuctionVO;
import com.panda.domain.Criteria;
import com.panda.domain.MemberVO;
import com.panda.domain.PageVO;
import com.panda.domain.SearchVO;
import com.panda.service.AuctionService;
import com.panda.service.MemberService;


@Controller
@RequestMapping(value="/auction/*")
public class AuctionController {
   
   private static final Logger mylog = LoggerFactory.getLogger(AuctionController.class);
   
   @Inject
   private MemberService mService;
   
   @Inject
   private AuctionService service;
   
   @Resource(name="uploadPath")
   private String uploadPath;
   
   //http://localhost:8080/auction/a_regist
   // 기부경매 상품 등록하기 GET
   @RequestMapping(value = "/a_regist", method = RequestMethod.GET)
   public void a_registGET() throws Exception {
	   
	   mylog.debug("/auction/a_regist(GET) 호출 -> 페이지 이동");
//	   return "redirect:/auction/a_regist";
   }
   
   
   // 기부경매 상품 등록하기 POST
   @RequestMapping(value = "/a_regist", method = RequestMethod.POST)
   public String a_registPOST(AuctionVO avo, MultipartFile file, RedirectAttributes rttr,HttpSession session) throws Exception {
	   mylog.debug("/auction/a_regist(POST) 호출");
	   
	   String user_id = (String)session.getAttribute("user_id");
	   
	   mylog.debug(avo.toString());
	   MemberVO vo = mService.getMember(user_id);
	   mylog.info(vo.toString());
	   avo.setUser_no(vo.getUser_no());
	   
	   service.insertAuction(avo);
	   mylog.debug("경매 상품 등록 완료");
	   
	   rttr.addFlashAttribute("result", "creatOK");
	   
	   
	   
	   //이미지 업로드
	   String imgUploadPath = uploadPath + File.separator + "imgUpload";
	   String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
	   String fileName = null;
	   
	   if(file != null) {
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		avo.setUploadFile(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		avo.setThumbnail(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	   
		service.insertAuction(avo);
		
	   return "redirect:/auction/a_list";
   }
   
   
   // http://localhost:8080/auction/a_list
   // 기부경매 전체 상품 목록
   @RequestMapping(value = "/a_list", method=RequestMethod.GET)
   public void a_listGET(HttpSession session,Model model, SearchVO vo) throws Exception {
	  mylog.debug("/auction/a_list(GET) 호출 -> DB정보 가져와서 출력 "); 
	  
	  session.setAttribute("updateCheck", true);
	  
	  model.addAttribute("auctionList", service.getAuctionListAll(vo));
	  
   }
   
   
    // http://localhost:8080/auction/a_read?auction_no=1&user_no=1
	// 기부경매 상품 상세페이지
    @GetMapping(value = "/a_read")
	public void a_readGET(@ModelAttribute("auction_no") int auction_no, 
						  @ModelAttribute("user_no") int user_no, 
						  HttpSession session, Model model) throws Exception{
		
		mylog.debug("전달정보 : " + auction_no);
		mylog.debug("전달정보 : " + user_no);
		
		boolean isUpdateCheck=false;
		
		// 세션객체
		if(session.getAttribute("updateCheck")!=null) {
			isUpdateCheck = (boolean) session.getAttribute("updateCheck");
		}
		mylog.debug("조회수 증가 상태 : " + isUpdateCheck);

		if (isUpdateCheck) { // true
			service.updateViewcnt(auction_no);
			mylog.debug("조회수 1 증가");
			
			session.setAttribute("updateCheck", !isUpdateCheck);
		}
		
		// 서비스 -> DAO (특정 글번호에 해당하는 정보 가져오기)
//		AuctionVO avo = service.getAuction(auction_no);
//		AuctionVO avo1 = service.getUser(user_no);
		AuctionVO vo = new AuctionVO();
		vo.setAuction_no(auction_no);
		vo.setUser_no(user_no);
		//service.getAuctions(vo);
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("avooo", service.getAuctions(vo));
//		model.addAttribute("avo1", avo1);
	}   
	
    // http://localhost:8080/auction/a_modify
	// http://localhost:8080/auction/a_modify?auction_no=1&user_no=1
    // 기부경매 상품 글 수정 GET
 	@GetMapping(value = "/a_modify")
 	public void a_modifyGET(Model model, AuctionVO vo) throws Exception{
 		// model 객체 사용 - view 페이지로 정보 전달
 		mylog.debug(vo+"");
 		
 		model.addAttribute("acmap",service.getAuctions(vo));
 	}
 	
    
     // 기부경매 상품 글 수정 POST
 	@PostMapping(value = "/a_modify")
 	public String a_modifyPOST(AuctionVO avo, RedirectAttributes rttr) throws Exception {
 		// 전달된 정보(수정할 정보) 저장
 		mylog.debug(avo+"");
 		
 		// 서비스 - DAO : 정보 수정 메서드 호출
 		Integer result = service.updateAuction(avo);
 		
 		if (result > 0) {
 			// "수정완료" - 정보 전달
 			rttr.addFlashAttribute("result", "modOK");
 		}
 		
 		// 페이지 이동
 		return "redirect:/auction/a_list";
 	}

	
	// 기부경매 상품 글 삭제
	@PostMapping(value="/a_remove")
	public String removePOST(AuctionVO avo, RedirectAttributes rddr) throws Exception {
		//mylog.debug("@@@@@@@@@@" + avo);
		Integer result = service.removeAuction(avo);
		
		if(result > 0) {
			rddr.addFlashAttribute("result", "removeOK");
		}
		
		// 페이지 이동
		return "redirect:/auction/a_list";
	}
	
	
	// 기부경매 상품 찜 업데이트
	@PostMapping(value="/a_list/{auction_no}")
	@ResponseBody
	public int updateLikePOST(@RequestParam("auction_no") int auction_no, 
							  @RequestParam("auction_like") int auction_like,
							  @RequestParam("user_no") int user_no, 
							  HttpSession session, Model model) throws Exception {
		//mylog.debug("@@@@@@@@@@@@");
		mylog.debug("auction_no : " + auction_no);
		
		AuctionVO avo = new AuctionVO();
		
		avo.setAuction_no(auction_no);
		avo.setUser_no(user_no);
		avo.setAuction_like(auction_like);
		
//		Integer result = service.updateLike(avo);
		
//		model.addAttribute(service.updateLike(avo));
		return service.updateLike(avo);
	}

	
	// 입찰하기
	@PostMapping(value = "/a_bid")
	public String bidPOST(AuctionVO avo, RedirectAttributes rbbr) throws Exception {
		mylog.debug("@@@@@@@@@@@"+avo);
		
		Integer result = service.updateBid(avo);
		
		if(result>0) {
			rbbr.addFlashAttribute("result", "bidUpdateOK");
			rbbr.addFlashAttribute("auction_no", avo.getAuction_no());
			rbbr.addFlashAttribute("user_no", avo.getUser_no());
		}
		return "redirect:/auction/a_read";
	}
	
	
	
}