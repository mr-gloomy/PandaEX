package com.panda.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.panda.domain.MemberVO;

@Controller
public class ModalController {
	
	@RequestMapping(value="/*", method = RequestMethod.POST)
	public @ResponseBody Object modallogin(@RequestBody Map<String, String> loginMap,
			HttpServletRequest request, Model model) throws Exception{
		try {
			
		} catch (Exception e) {
			
		}
		return "";
	}
	
	
	
	
}
