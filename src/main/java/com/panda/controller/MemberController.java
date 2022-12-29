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


	
	//http://localhost:8080/member/insert
	
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
	 
		return "redirect:/member/login";
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

	
	// 아이디 중복 체크
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public String idCheck(MemberVO vo, @ModelAttribute("userid") String user_id) throws Exception {
		mylog.info("idCheck() 호출");
		mylog.info("@@@@@@"+vo);
		
		MemberVO checkVO = service.getMember(user_id);
		mylog.debug(checkVO + "");
		
		if(checkVO == null) {
			//디비에 정보가 없음 -> 해당 아이디 사용 가능 
			return "OK";
		}else {
			return "NO";
			
		}
	}
	//비밀번호 중복 체크 
	
	//로그인 get
	
	@GetMapping(value="/login")
	public void loginGET() throws Exception{
		mylog.debug("loginGET 호출");
		//연결된 뷰페이지 구현
	}
	
	//로그인 post
	@PostMapping(value="/login")
	public String loginPOST(MemberVO vo, HttpSession session) throws Exception{
		mylog.debug("loginPOST() 호출");
		
		//전달 정보 저장(userid,userpw)
		mylog.debug("로그인정보 :" + vo);
		
		//서비스 - DAO (로그인체크)
		boolean loginStatus = service.memberLogin(vo);
		mylog.debug("로그인상태 : " + loginStatus);
		
		// 로그인 여부 확인
		if(loginStatus != null) {
		                    
		session.setAttribute("user_id", loginStatus.getUser_id());
		session.setAttribute("loginStatus", loginStatus);
		session.setAttribute("user_name", loginStatus.getUser_name());
		String user_id = (String)session.getAttribute("user_id");
		String user_name = (String)session.getAttribute("user_name");
		
		log.info(user_id + "세션값");
				
		
		//로그인 성공 -> main
		//로그인 실패 -> login 그대로..
		
		String resultURI="";
		if(loginStatus) {
			resultURI ="redirect:/main/index";
			session.setAttribute("userid", vo.getUser_id());
		
		}
		return resultURI;
		
		
	}
	
	}
	
}
