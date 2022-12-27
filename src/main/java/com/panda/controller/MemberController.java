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
	
	// http://localhost:8080/member/join
	@RequestMapping(value = "/join",method = RequestMethod.GET)
	public void joinGET() {
		mylog.debug(" joinGET() 호출 ");
		
	}

	
	// 회원가입 - GET
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertGET(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		mylog.info("@@@@@ insertGET() 호출");
		mylog.info(" /member/sign (get) -> /member/insert.jsp 로 연결");
		
//		// 네이버 URL
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//		log.info("@@@@@ naver : "+naverAuthUrl);
//		model.addAttribute("naverURL", naverAuthUrl);
//		
//		// 카카오 URL
//		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
//		log.info("@@@@@ kakao :" + kakaoAuthUrl);		
//		model.addAttribute("kakaoURL", kakaoAuthUrl);
	}
	
	// 회원가입 - POST
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPOST(MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		mylog.info("insertPOST() 호출");
		mylog.info("@@@@@"+vo);
		int result = service.idCheck(vo);

		try {
			if (result == 1) {
				return "/member/insert";
			} else if (result == 0) {
				mylog.info(vo + "");
				service.insert(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}

		mylog.info("회원가입 성공! ");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('회원가입완료!');");
		out.println("location.href='/member/login'");
		out.println("</script>");
		out.close();
	   

		return "redirect:/member/login";
	}

	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheck(MemberVO vo) throws Exception {
		mylog.info("idCheck() 호출");
		mylog.info("@@@@@@"+vo);
		String result = service.idCheck(vo)+"";
		return result;
	}
	
}
