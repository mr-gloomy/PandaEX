package com.panda.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.panda.domain.MemberVO;
import com.panda.service.MyPageService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Inject
	private MyPageService myservice;
	
	private static final Logger mylog = LoggerFactory.getLogger(MypageController.class);
	
	// http://localhost:8080/mypage/main
	
	// 마이 페이지 - 메인 
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainGET(HttpSession session, Model model, MemberVO memberVO) throws Exception {
		// 로그인 제어	
		String user_id = (String) session.getAttribute("user_id");
		mylog.debug(user_id);
		
		if(user_id == null) {
			return "/main/index";
		}
		
		memberVO.setUser_id(user_id);
		memberVO = myservice.getMembers(memberVO);
		
		model.addAttribute("memberVO", memberVO);
		
		mylog.debug("마이페이지 이동!");

		return "/mypage/main";
	}
	
	// 마이 페이지 - 정보  
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void infoGet(HttpSession session, Model model, MemberVO memberVO) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		
		memberVO.setUser_id(user_id);
		memberVO = myservice.getMembers(memberVO);
		mylog.debug("myInfo: 회원정보 저장 완료!");
		mylog.debug("myInfo: 내 정보 탭 이동!");
		
		model.addAttribute("memberVO", memberVO);
	}
	
	// 마이 페이지 - 회원 정보 수정(GET) 
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(HttpSession session, MemberVO memberVO, Model model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
				
		memberVO.setUser_id(user_id);
		memberVO = myservice.getMembers(memberVO);
		mylog.debug(" modify ");
		
		model.addAttribute("memberVO", memberVO);		
	}
	
	// 마이 페이지 - 회원 정보 수정(POST) 
	@ResponseBody
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public void modifyPOST(@RequestParam("user_id") String user_id,
								@RequestParam("user_tel") String user_tel,
								@RequestParam("user_nick") String user_nick,
								@RequestParam("user_email") String user_email,
								MemberVO memberVO) throws Exception {
		
		
		memberVO.setUser_id(user_id);
		memberVO.setUser_tel(user_tel);
		memberVO.setUser_nick(user_nick);
		memberVO.setUser_email(user_email);
		
		myservice.modify(memberVO);
		mylog.debug(" myModify ");
	}
	
	// 회원 정보 수정 - 비밀번호 확인 
	@ResponseBody
	@RequestMapping(value = "/passCheck", method = RequestMethod.POST)
	public Integer passCheck(@RequestParam("user_pw") String user_pw, HttpSession session, MemberVO memberVO) throws Exception {
		
		memberVO.setUser_id((String) session.getAttribute("user_id"));
		memberVO.setUser_pw(user_pw);
		
		Integer result = myservice.passCheck(memberVO);
		mylog.debug(" passChk ");
		
		return result;
	}
	
	// 회원 탈퇴 
	@ResponseBody
	@RequestMapping(value = "/exit", method = RequestMethod.POST)
	public void exitPOST(@RequestParam("user_pw") String user_pw,RedirectAttributes rttr,HttpSession session, MemberVO memberVO) throws Exception {
		
		String user_id = (String) session.getAttribute("user_id");
		memberVO.setUser_pw(user_pw);
		memberVO.setUser_id(user_id);
		
		myservice.exit(memberVO);
		session.invalidate();
		mylog.debug(" myDelete ");
	}
	
	
	// 찜 목록 불러오기 
//	@RequestMapping(value = "likeList", method = RequestMethod.GET)
//	public void likeListGET(HttpSession session, LikeVO likeVO, Model model) throws Exception {
//		
//		String user_id = (String) session.getAttribute("user_id");
		
		// ++++++++++++++++++++++++++++
//	}
	
	
}