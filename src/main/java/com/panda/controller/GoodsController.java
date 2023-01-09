package com.panda.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.panda.domain.GoodsVO;
import com.panda.service.GoodsService;

import net.coobird.thumbnailator.Thumbnailator;

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
	// http://localhost:8080/goods/modify?goods_no=61
	
	// 상품 글쓰기 GET
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public void registGET() throws Exception {
		mylog.debug(" /goods/regist(GET) 호출 -> 페이지 이동 ");		
	}
	
	
	// 파일 년/월/일 폴더생성
	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}
	
	// 이미지 파일 판단
	private boolean checkImageType(File file) {

		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");

		} catch (IOException e) {
			e.printStackTrace();
		}

		return false;
	}
	
	
	// 상품 글쓰기 POST
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String registPOST(GoodsVO vo, MultipartFile[] uploadFile) throws Exception {
		mylog.debug(" /goods/regist(POST) 호출 ");	
		mylog.debug(" GET방식의 데이터 전달 -> DB 저장 -> 페이지 이동 ");
		// 0. 한글처리 (필터)
		// 1. 전달된 정보 저장 
		mylog.debug(vo.toString());
		
		// 2. 이미지 파일 첨부
		String uploadFolder = "C:\\upload";
		
	    File uploadPath = new File(uploadFolder, getFolder());
        mylog.info("업로드 경로 : " + uploadPath);
        
        // 업로드 날짜별로 폴더 생성
	    if (uploadPath.exists() == false) {
	    	uploadPath.mkdirs();
	    }
	    
	    // 파일 업로드
		for (MultipartFile multipartFile : uploadFile) {

			mylog.info("-------------------------------------");
			mylog.info("파일명: " + multipartFile.getOriginalFilename());
			mylog.info("파일크기: " + multipartFile.getSize());
			
			String uploadFileName =  multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			mylog.info("업로드 파일명 : " + uploadFileName);
			
			// 파일명 중복방지 - 고유값 파일명 생성
			UUID uuid = UUID.randomUUID(); 
			uploadFileName = uuid.toString() + "_" + uploadFileName; 
			

			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				
				multipartFile.transferTo(saveFile);
				
				// 이미지 파일 확인
				 if (checkImageType(saveFile)) {
				
					 FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					
					 Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100,100);
					
					 thumbnail.close();
				 }
			} catch (Exception e) {
				mylog.error(e.getMessage());
			} 
			
		} // end
		
		
		// 3. 서비스 -> DAO 접근 (mapper)
		service.insertGoods(vo);
			
		mylog.debug(" 글쓰기 완료 ");
			
		// 4. 페이지로 이동(list페이지)
			
		return "redirect:/goods/list";
	}
	
	
	
	// 상품목록(All)
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public void listGET(HttpSession session , Model model,@ModelAttribute("result") String result) throws Exception {
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
	public void readGET(Model model, @RequestParam("goods_no") int goods_no, HttpSession session) throws Exception{
		// 전달정보 (goods_no) 
		mylog.debug("전달정보 (goods_no): " + goods_no);
		
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
		GoodsVO vo = service.getGoods(goods_no);
		// 연결된 뷰페이지로 정보 전달(model)	
		model.addAttribute("vo", vo);
		
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
	public String modifyPOST(GoodsVO vo) throws Exception {
		// 전달된 정보(수정할 정보)저장
		mylog.debug(vo + "");
		
		// 서비스 - DAO : 정보 수정 메서드 
		service.updateGoods(vo);
		
		// 페이지 이동(/goods/list)
		return "redirect:/goods/list";
	}

	// 글 삭제하기
	@RequestMapping(value = "/remove" , method = RequestMethod.POST)
	public String removePOST(int goods_no) throws Exception {
		// 전달정보 저장(goods_no)
		mylog.debug(goods_no + "");
		
		// 서비스 - DAO : 게시판 글 삭제 메서드 호출
		service.removeGoods(goods_no);
		
		// 게시판 리스트로 이동(/goods/list)
		return "redirect:/goods/list";
	}

}
