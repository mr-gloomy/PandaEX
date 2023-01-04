package com.panda.controller;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.panda.domain.KakaoVO;
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

	@Autowired
	private HttpSession session;
	
	
	//http://localhost:8080/main/index
	
	// 회원가입 - GET
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String joinGET() throws Exception {
		return "redirect:/main/index";
	}
	
	// 회원가입 - POST
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPOST(MemberVO vo, HttpServletResponse response) throws Exception {
		mylog.info("insertPOST() 호출");
		mylog.info(vo.toString());
		
		service.insert(vo);

		mylog.info("회원가입 성공! ");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('회원가입완료~ 이메일 인증해주세용!');");
		out.println("location.href='/main/index'");
		out.println("</script>");
		out.close();
		return "redirect:/main/index";
	}
	
	
	@GetMapping("/registerEmail")
	public String emailConfirm(MemberVO vo)throws Exception{

	    service.updateMailAuth(vo);

	    return "/member/emailAuthSuccess";
	}
	
	
	
		// GET 방식 - /members/ckID + 데이터
		// 아이디 정보를 전달받아서 서비스에서 해당아이디가 중복인지 여부판단
		@RequestMapping(value = "/ckID",method = RequestMethod.GET )
		public String checkID(MemberVO vo,
				 @ModelAttribute("user_id") String user_id) throws Exception{
			mylog.debug(" checkID() 호출 ");
			mylog.debug(vo+"");
			mylog.debug(user_id+"");
			
			
			MemberVO checkVO = service.getMember(user_id);
			mylog.debug(checkVO+"");
			
			if(checkVO ==null) {
				//디비에 정보가 없음 -> 해당 아이디 사용 가능 
				return "OK";
						
			}else {
				//디비에 정보가 있음 -> 해당 아이디를 사용 x 
				return "NO";
			}
		}
		
	//로그인 post
	@PostMapping(value="/login")
	public String loginPOST(String id, MemberVO vo, HttpServletRequest request, Model model) throws Exception{
		HttpSession session =request.getSession();	
		mylog.debug("loginPOST() 호출");
		
		//전달 정보 저장(user_id,user_pw)
		mylog.debug("로그인정보 :" + vo);
		
		
		//이메일 인증 했는지 확인
        if (service.emailAuthFail(id) != 1) {
            return "/member/emailAuthFail";
        }

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
			session.setAttribute("user_name", vo.getUser_name()); 
			session.setAttribute("user_nick", vo.getUser_nick());

		}else {
			//return "redirect:/member/login";
			resultURI = "redirect:/main/index";
		}
		
		return resultURI;
	}
	// http://localhost:8080/main/index
		// 메인페이지
		@RequestMapping(value = "/main",method = RequestMethod.GET)
		public String mainGET(HttpSession session) throws Exception{
			mylog.info(" mainGET() 호출 ");
			
			if(session.getAttribute("id") == null) {
				mylog.debug("아이디 정보 없음");
				return "redirect:/main/index";
			}
			
			// 연결된 뷰페이지 호출		
			return "/main/index";
		}
		
		//카카오 로그인
		@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
		public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
			System.out.println("#########" + code);
			String access_Token = service.getAccessToken(code);
			HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
			System.out.println("###access_Token#### : " + access_Token);
			
			// 아래 코드가 추가되는 내용
			session.invalidate();
			// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드.
			session.setAttribute("user_id", userInfo.get("k_name"));
			session.setAttribute("user_email", userInfo.get("k_email"));
			// 위 2개의 코드는 닉네임과 이메일을 session객체에 담는 코드
			// jsp에서 ${sessionScope.kakaoN} 이런 형식으로 사용할 수 있다.
		    
			access_Token = "";
			
			return "main/index";
	    	}
	    
		
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "/main/index";
	}
	
	
}
