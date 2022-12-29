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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.panda.domain.GoodsVO;
import com.panda.service.GoodsService;

@Controller
@RequestMapping("/goods/*")
public class GoodsController {
	
	// 객체 로거 생성
	private static final Logger mylog = LoggerFactory.getLogger(GoodsController.class);
	
	// 서비스 객체-주입
	@Inject
	private GoodsService service;
	
	// http://localhost:8080/goods/regist
	// http://localhost:8080/goods/list
	
	// 상품 글쓰기 GET
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public void registGET() throws Exception {
		mylog.debug(" /goods/regist(GET) 호출 -> 페이지 이동 ");		
	}
	
	// 상품 글쓰기 POST
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String registPOST(GoodsVO gvo) throws Exception {
		mylog.debug(" /goods/regist(POST) 호출 ");	
		mylog.debug(" GET방식의 데이터 전달 -> DB 저장 -> 페이지 이동 ");
		// 0. 한글처리 (필터)
		// 1. 전달된 정보 저장 
		mylog.debug(gvo.toString());
		
		// 2. 서비스 -> DAO 접근 (mapper)
		service.insertGoods(gvo);
			
		mylog.debug(" 게시판 글쓰기 완료 ");
			
		// 3. 페이지로 이동(list페이지)
			
		return "redirect:/goods/list";
	}
	
	
	// 상품목록(All)
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public void listGET(HttpSession session,Model model,@ModelAttribute("result") String result) throws Exception {
		mylog.debug(" /Goods/list 호출 -> DB정보 가져와서 출력 ");
		
		// 전달받은 정보 x
		mylog.debug(" 전달정보 : " + result);
		
		// 세션객체 - 글 조회수 증가 체크정보
		session.setAttribute("updateCheck", true);		
		
		// 서비스 -> DAO 게시판 리스트 가져오기
		List<GoodsVO> GoodsList = service.getGoodsListAll();
		
		// 연결되어 있는 뷰페이지로 정보 전달 (Model 객체)
		model.addAttribute("GoodsList", GoodsList);
		
		// 페이지 이동(/goods/list.jsp)		
	}
	
	// 게시판 본문보기
	@RequestMapping(value = "/read",method = RequestMethod.GET)
	public void readGET(Model model,@RequestParam("goods_no") int goods_no,HttpSession session) throws Exception{
		// 전달정보 (goods_no) 
		mylog.debug("전달정보 (goods_no): " + goods_no);
		
		// 세션객체 
		boolean isUpdateCheck = (boolean) session.getAttribute("updateCheck");
		mylog.debug("조회수 증가 상태 : "+isUpdateCheck);
		
		if(isUpdateCheck) { //true
			// 서비스 -> DAO 동작 호출
			service.updateViewcnt(goods_no);
			mylog.debug(" 조회수 1증가 ");
			
			// 상태 변경(true -> false);
			session.setAttribute("updateCheck", !isUpdateCheck);			
		}
		
		// 서비스 -> DAO (특정 글번호에 해당하는 정보 가져오기)
		GoodsVO gvo = service.getGoods(goods_no);
		// 연결된 뷰페이지로 정보 전달(model)	
		model.addAttribute("gvo", gvo);
		
	}
//		//수정 GET
//		@RequestMapping(value = "/modify", method = RequestMethod.GET)
//		public void modifyGET(int bno, Model model) throws Exception {
//			// 파라미터 저장(bno)
//			
//			// 서비스 - DAO(글 조회)
//			
//			// model 객체 사용 - view 페이지로 정보 전달
//			model.addAttribute("vo",service.getBoard(bno));
//			// /board/modify.jsp 페이지 이동
//		}
//	
//		//수정 POST
//		@RequestMapping(value = "/modify",method = RequestMethod.POST)
//		public String modifyPOST(BoardVO vo,RedirectAttributes rttr) throws Exception {
//			// 전달된 정보(수정할 정보)저장
//			mylog.debug(vo + "");
//			
//			// 서비스 - DAO : 정보 수정 메서드 호출
//			Integer result = service.updateBoard(vo);
//			
//			if(result > 0 ) {
//				// 수정완료 - 정보전달
//				rttr.addAttribute("result",",modOK");
//			}
//			
//			// 페이지 이동(/board/list)
//			
//			return "redirect:/board/list";
//		}
//	
//	
//		// 글 삭제하기
//		@RequestMapping(value = "/remove" , method = RequestMethod.POST)
//		public String removePOST(int bno,RedirectAttributes rttr) throws Exception {
//			// 전달정보 저장(bno)
//			mylog.debug(bno + "");
//			
//			// 서비스 - DAO : 게시판 글 삭제 메서드 호출
//			service.removeBoard(bno);
//			
//			// "삭제완료" 정보를 list 페이지로 전달
//			rttr.addAttribute("result", "delOK" );
//			// 게시판 리스트로 이동(/board/list)
//			
//			return "redirect:/board/list";
//		}
//	
}
