package com.panda.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.panda.domain.MemberVO;


public interface MemberService {
	
	
		// 토큰 받기
		public String getAccessToken (String authorize_code) throws Exception;
	
		//회원 가입 처리
		public void insert(MemberVO vo)throws Exception;
		
		//로그인
		public boolean memberLogin(MemberVO vo) throws Exception;

		//회원조회
		public MemberVO getMember(String user_id) throws Exception;

	
		

}
