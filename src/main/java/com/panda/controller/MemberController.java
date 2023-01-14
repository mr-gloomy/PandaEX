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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.panda.domain.AuctionVO;
import com.panda.domain.MemberVO;
import com.panda.domain.ReportVO;
import com.panda.service.AuctionService;
import com.panda.service.MemberService;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	
	
	// 로거객체
	private static final Logger mylog
		= LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService service;
	
	@Inject
	private AuctionService aService;
	
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
	public String emailConfirm(MemberVO vo,String email)throws Exception{
		vo.setUser_email(email);
	    service.updateMailAuth(vo);

	    return "/member/emailAuthSuccess";
	}
	
	
		

	//로그인 post
	@PostMapping(value="/login")
	public String loginPOST(String user_id, MemberVO vo, HttpServletRequest request, Model model,HttpServletResponse response,@RequestParam("exUrl") String exUrl ) throws Exception{
		HttpSession session =request.getSession();	
		mylog.debug("loginPOST() 호출");
		
		//전달 정보 저장(user_id,user_pw)
		mylog.debug("로그인정보 :" + vo);
		
		
		//이메일 인증 했는지 확인
		if (service.emailAuthFail(user_id) != 1 /* || vo.getMail_key() == null */) {
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
			resultURI = "redirect:/"+ exUrl.replace("!rep!","&");
			session.setAttribute("user_id", vo.getUser_id());
		}else {
			//return "redirect:/member/login";
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 실패 삐빅');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
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
			session.setAttribute("kakao", "1");
			// 위 2개의 코드는 닉네임과 이메일을 session객체에 담는 코드
			// jsp에서 ${sessionScope.kakaoN} 이런 형식으로 사용할 수 있다.
		    
			access_Token = "";
			
			return "main/index";
	    	}
		
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session,String exUrl) throws Exception {
		session.invalidate();
		
//		//mylog.info(req.getContextPath());
//		//response.setHeader("Refesh","1; url="+req.getContextPath());
//		
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out=response.getWriter();
//		out.println("<script>");
//		out.println("history.back();");
//		out.println("</script>");
//		out.close();
		
		mylog.info(exUrl);
		
		return "redirect:/"+exUrl.replace("!rep!","&");
	}
	
	@PostMapping("/report")
	public void reportUser(ReportVO vo, HttpServletResponse response) throws Exception {
		
		service.insertRep(vo);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('신고 완료!');");
		out.println("history.back()");
		out.println("</script>");
		out.close();
		
	}
	
	// 아이디 찾기
		@RequestMapping(value="/findId",method=RequestMethod.GET)
		public String findIdGET() throws Exception {
			mylog.info("findIdGET() 호출");
					
			return "member/searchID";
		}
				
		@RequestMapping(value="/findId",method=RequestMethod.POST)
		public String findIdPOST(MemberVO vo, Model model) throws Exception {
			mylog.info("findIdPOST(MemberVO vo, Model model) 호출");
					
			MemberVO findIdVo = service.findId(vo);
			// System.out.println(findIdVo.getUser_id());
					
			if(findIdVo == null) {
				model.addAttribute("check",1);
					return "/member/findError";
			}else {
				model.addAttribute("check", 0);
				model.addAttribute("id", findIdVo.getUser_id());
				return "/member/searchID";
			}
					
		}
				
		// 아이디 결과
		@RequestMapping(value="/resultId", method=RequestMethod.GET)
		public String resultIdGET(HttpServletRequest request,Model model, @RequestParam(required=false,value="user_name") String user_name, @RequestParam(required=false,value="user_tel") String user_tel, MemberVO vo) throws Exception{
					
			vo.setUser_name(user_name);
			vo.setUser_tel(user_tel);
			MemberVO findId = service.findId(vo);
					
					
			model.addAttribute("searchVO", findId);
					
					
			return "member/searchID";
		}
				
		
		/* 비밀번호 찾기 */
		@RequestMapping(value = "/findpw", method = RequestMethod.GET)
		public String findPwGET() throws Exception{
			mylog.info("findPwGET() 호출");
			
			return "main/index";
		}

		@RequestMapping(value = "/findpw", method = RequestMethod.POST)
		public String findPwPOST(@ModelAttribute MemberVO vo, HttpServletResponse response, Model model) throws Exception{
			mylog.info("findPwPOST() 호출");
			MemberVO vo2 = null;
			if (service.getMember(vo.getUser_id())!=null) {
				vo2 = service.getMember(vo.getUser_id());
			}
			if(vo2 == null) {
				model.addAttribute("check",1);
					return "/member/findError";
			}else {
				model.addAttribute("check", 0);
				vo.setUser_no(vo2.getUser_no());
				service.findPw(response, vo);
				return "main/index";
			}
			
			
			
		}
		
		
//		비밀번호 변경 view
		@GetMapping("/pwUpdate")
		public void pwUpdate(MemberVO vo)throws Exception{

		}
		
		@PostMapping("/pwUpdate")
		public String pwUpdateP(MemberVO vo, RedirectAttributes rttr,HttpServletResponse response,String pw2)throws Exception{
			mylog.info("pwUpdate 왔음");
			rttr.addFlashAttribute("msg", "정보 수정이 완료되었습니다. 다시 로그인해주세요.");
			if (service.pwCheck(vo.getUser_no())!=null) {
				if (vo.getUser_pw().equals(service.pwCheck(vo.getUser_no()))) {
					vo.setUser_pw(pw2);
					service.updatePw(vo);
				}
				else {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out=response.getWriter();
					out.println("<script>");
					out.println("alert('회원정보 없음!');");
					out.println("history.back();");
					out.println("</script>");
					out.close();
				}
			}
//			else {
//				response.setContentType("text/html; charset=UTF-8");
//				PrintWriter out=response.getWriter();
//				out.println("<script>");
//				out.println("alert('잘못된 임시 비밀번호입니다!');");
//				out.println("history.back()");
//				out.println("</script>");
//				out.close();
//			}
			return "/main/index";
		}
		
		
}
		
