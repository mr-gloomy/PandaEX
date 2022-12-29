package com.panda.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.panda.domain.MemberVO;
import com.panda.service.MemberService;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	
	// 로거객체
	private static final Logger mylog
		= LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService service;


	
	//http://localhost:8080/main/index
	
	// 회원가입 - GET
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String joinGET() throws Exception {
		mylog.info("/member/insert 이동");
		
//		// 네이버 URL
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//		log.info("@@@@@ naver : "+naverAuthUrl);
//		model.addAttribute("naverURL", naverAuthUrl);
//		
//		// 카카오 URL
//		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
//		log.info("@@@@@ kakao :" + kakaoAuthUrl);		
//		model.addAttribute("kakaoURL", kakaoAuthUrl);
	 
		return "redirect:/main/index";
	}
	
	// 회원가입 - POST
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPOST(MemberVO vo) throws Exception {
		mylog.info("insertPOST() 호출");
		mylog.info(vo.toString());
		
		service.insert(vo);

		mylog.info("회원가입 성공! ");
		
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out=response.getWriter();
//		out.println("<script>");
//		out.println("alert('회원가입완료!');");
//		out.println("location.href='/member/login'");
//		out.println("</script>");
//		out.close();
		return "redirect:/main/index";
	}

	
	//로그인 post
	@PostMapping(value="/login")
	public String loginPOST(MemberVO vo, HttpServletRequest request) throws Exception{
		HttpSession session =request.getSession();	
		mylog.debug("loginPOST() 호출");
		
		//전달 정보 저장(user_id,user_pw)
		mylog.debug("로그인정보 :" + vo);
		
		//서비스 - DAO (로그인체크)
		boolean loginStatus = service.memberLogin(vo);
		mylog.debug(" 로그인 상태 : "+loginStatus);
		
		// 로그인 여부에 따라서 페이지 이동
		// 성공 - main페이지 (실패시 alert으로 제어)
		String resultURI="";
		if(loginStatus) {
			//return "redirect:/member/main";
			resultURI = "redirect:/main/index";
			session.setAttribute("user_id", vo.getUser_id());
			session.setAttribute("user_name", vo.getUser_id());
			session.setAttribute("user_nick", vo.getUser_id());
		}else {
			//return "redirect:/member/login";
			resultURI = "redirect:/main/index";
		}
		
		return resultURI;
	}
	// http://localhost:8080/member/main
		// 메인페이지
		@RequestMapping(value = "/main",method = RequestMethod.GET)
		public String mainGET(HttpSession session) throws Exception{
			mylog.info(" mainGET() 호출 ");
			
			if(session.getAttribute("id") == null) {
				mylog.debug("아이디 정보 없음");
				return "redirect:/main/index";
			}
			
			// 연결된 뷰페이지 호출		
			return "/member/index";
		}
		
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "/main/index";
	}
	
	
}
