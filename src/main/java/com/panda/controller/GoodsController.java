package com.panda.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.panda.domain.GoodsVO;
import com.panda.domain.MemberVO;
import com.panda.domain.SearchVO;
import com.panda.service.GoodsService;
import com.panda.service.MemberService;

@Controller
@RequestMapping("/goods/*")
public class GoodsController {
	
	// 객체 로거 생성
	private static final Logger mylog = LoggerFactory.getLogger(GoodsController.class);	
	
	// 서비스 객체-주입
	@Inject
	private GoodsService service;
	
	@Inject
	private MemberService mService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// http://localhost:8080/goods/regist
	// http://localhost:8080/goods/list
	// http://localhost:8080/goods/modify?goods_no=61
	
	// 상품 글쓰기 GET
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public void registGET() throws Exception {
		mylog.debug(" /goods/regist(GET) 호출 -> 페이지 이동 ");		
	}
	
	// 상품 글쓰기 POST
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String registPOST(GoodsVO vo, MultipartFile file, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		mylog.debug(" /goods/regist(POST) 호출 ");	
		mylog.debug(" GET방식의 데이터 전달 -> DB 저장 -> 페이지 이동 ");
		
		String user_id = (String)session.getAttribute("user_id");
		
		MemberVO mvo = mService.getMember(user_id);
		
		mylog.debug(vo.toString());
		vo.setUser_no(mvo.getUser_no());
		vo.setUser_nick(mvo.getUser_nick());
		vo.setUser_addr(mvo.getUser_addr());
		vo.setUser_area(mvo.getUser_area());
		
		// 1. 전달된 정보 저장 
		mylog.debug(vo.toString());
		
		// 2. 이미지 업로드
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
			
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		
		} else {
			
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		vo.setUploadFile(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setThumbnail(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		// 3. 서비스 -> DAO 접근 (mapper)
		service.insertGoods(vo);
		
		mylog.debug(" 글쓰기 완료 ");
		rttr.addFlashAttribute("result", "creatOK");

		// 4. 페이지로 이동(list페이지)
		
		
		return "redirect:/goods/list?s=0";
	}
		
	// 상품목록(All)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listGET(HttpSession session , Model model,SearchVO vo,
						@ModelAttribute("result") String result) throws Exception {
		mylog.debug(" /Goods/list 호출 -> DB정보 가져와서 출력 ");
		
		
		// 전달받은 정보 x
		// 세션객체 - 글 조회수 증가 체크정보
		session.setAttribute("updateCheck", true);		
		
		// 연결되어 있는 뷰페이지로 정보 전달 (Model 객체)
		model.addAttribute("GoodsList", service.getGoodsListAll(vo));
		model.addAttribute("vo",mService.getMember((String)session.getAttribute("user_id")));
		// 페이지 이동(/goods/list.jsp)
	}
	
	// 상품 상세페이지
	@RequestMapping(value = "/read",method = RequestMethod.GET)
	public void readGET(@ModelAttribute("goods_no") int goods_no, 
							@ModelAttribute("user_no") int user_no, Model model, HttpSession session) throws Exception{
		// 전달정보 (goods_no) 
		mylog.debug("전달정보 (goods_no): " + goods_no);
		mylog.debug("전달정보 (user_no): " + user_no);
		
		// 세션객체 
		boolean isUpdateCheck = false;
		
		if (session.getAttribute("updateCheck")!=null) {
			isUpdateCheck = (boolean) session.getAttribute("updateCheck");
		}
		mylog.debug("조회수 증가 상태 : " + isUpdateCheck);
		
		if(isUpdateCheck) {
			// 서비스 -> DAO 동작 호출
			service.updateViewcnt(goods_no);
			mylog.debug(" 조회수 1증가 ");
			
			// 상태 변경(true -> false);
			session.setAttribute("updateCheck", !isUpdateCheck);
		}
		
		// 서비스 -> DAO (특정 글번호에 해당하는 정보 가져오기)
		GoodsVO vo = new GoodsVO();
		vo.setGoods_no(goods_no);
		vo.setUser_no(user_no);
				
		// 연결된 뷰페이지로 정보 전달(model)	
		model.addAttribute("vo", service.getGoods2(vo));
		
	}
	
	//수정 GET
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(int goods_no, Model model) throws Exception {
		// 파라미터 저장(goods_no)
		// 서비스 - DAO(글 조회)
		// model 객체 사용 - view 페이지로 정보 전달
		model.addAttribute("vo", service.getGoods(goods_no));
		
		
	}

	//수정 POST
	@RequestMapping(value = "/modify",method = RequestMethod.POST)
	public String modifyPOST(GoodsVO vo, RedirectAttributes rttr) throws Exception {
		// 전달된 정보(수정할 정보)저장
		mylog.debug(vo + "");
		
		// 서비스 - DAO : 정보 수정 메서드 
		Integer result = service.updateGoods(vo);
		
		if (result > 0) {
 			// "수정완료" - 정보 전달
 			rttr.addFlashAttribute("result", "modOK");
 		}
		
		// 페이지 이동(/goods/list)
		return "redirect:/goods/list?s=0";
	}

	// 글 삭제하기
	@RequestMapping(value = "/remove" , method = RequestMethod.GET)
	public String removePOST(int goods_no, RedirectAttributes rttr) throws Exception {
		// 전달정보 저장(goods_no)
		mylog.debug(goods_no + "");
		
		// 서비스 - DAO : 게시판 글 삭제 메서드 호출
		Integer result = service.removeGoods(goods_no);
		
		if(result > 0) {
			rttr.addFlashAttribute("result", "removeOK");
		}
		
		// 게시판 리스트로 이동(/goods/list)
		return "redirect:/goods/list?s=0";
	}
	
	// 상품 찜
	@PostMapping(value="/list/{goods_no}")
	@ResponseBody
	public int updateLikePOST(@RequestParam("goods_no") int goods_no, 
							  @RequestParam("goods_like") int goods_like,
							  @RequestParam("user_no") int user_no, 
							  HttpSession session, Model model) throws Exception {

		mylog.debug("goods_no : " + goods_no);
		
		GoodsVO vo = new GoodsVO();
		
		vo.setGoods_no(goods_no);
		vo.setUser_no(user_no);
		vo.setGoods_like(goods_like);
		
		return service.updateLike(vo);
		
	}
	

}
