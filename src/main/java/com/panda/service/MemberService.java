package com.panda.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.panda.domain.KakaoVO;
import com.panda.domain.MemberVO;
import com.panda.domain.ReportVO;


public interface MemberService {
	
	
		// 토큰 받기
		public String getAccessToken (String authorize_code) throws Exception;
	
		//회원 가입 처리
		public void insert(MemberVO vo)throws Exception;
		
		//로그인
		public boolean memberLogin(MemberVO vo) throws Exception;

		//회원조회
		public MemberVO getMember(String user_id) throws Exception;

		//닉네임 조회
		public MemberVO getNick(String user_nick) throws Exception;
		
		
		
		public HashMap<String,Object> getUserInfo(String access_Token)throws Exception;

	
		//이메일인증~
		int updateMailKey(MemberVO vo) throws Exception;
		int updateMailAuth(MemberVO vo) throws Exception;
		int emailAuthFail(String user_id) throws Exception;

		// 아이디 찾기
		public MemberVO findId(MemberVO vo) throws Exception;
//
//		//비밀번호 찾
//		public void findPw(String user_id, String user_email, MemberVO vo) throws Exception;

		public void insertRep(ReportVO vo) throws Exception;

}
