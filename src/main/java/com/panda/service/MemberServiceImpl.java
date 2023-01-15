package com.panda.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.panda.domain.KakaoVO;
import com.panda.domain.MemberVO;
import com.panda.domain.ReportVO;
import com.panda.mail.MailHandler;
import com.panda.mail.TempKey;
import com.panda.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	
	private static final Logger mylog = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Inject
	private MemberDAO dao;

	@Autowired
    JavaMailSender mailSender;
	
	//횐갑
	@Override
	public void insert(MemberVO vo) throws Exception {
			 //랜덤 문자열을 생성해서 mail_key 컬럼에 넣어주기
	        String mail_key = new TempKey().getKey(30,false); //랜덤키 길이 설정
	        vo.setMail_key(mail_key);

	        //회원가입
	        dao.insert(vo);
	        dao.updateMailKey(vo);

	        //회원가입 완료하면 인증을 위한 이메일 발송
	        MailHandler sendMail = new MailHandler(mailSender);
	        sendMail.setSubject("[PANDA 인증메일 입니다.]"); //메일제목
	        sendMail.setText(
	                "<h1>PANDA 메일인증</h1>" +
	                "<br>PANDA에 오신것을 환영합니다!" +
	                "<br>아래 [이메일 인증 확인]을 눌러주세요." +
	                "<br><a href='http://testteam.ga/member/registerEmail?email=" + vo.getUser_email() +
	                "&mail_key=" + mail_key +
	                "' target='_blank'>이메일 인증 확인</a>");
	        sendMail.setFrom("leweeewel@gmail.com", "Panda 판다");
	        sendMail.setTo(vo.getUser_email());
	        sendMail.send();
	}

	//로긴
	@Override
	public boolean memberLogin(MemberVO vo)throws Exception {
		mylog.debug("memberLogin(vo) 호출");
		
		MemberVO resultVO = dao.loginMember(vo);
		
		mylog.debug(" DAO 처리 결과 : "+resultVO);
		// null-false , not null-true
//		if(resultVO != null) 
//			return true;
//		else 
//			return false;
		
		return (resultVO != null)? true:false; 
	}

	@Override
	public MemberVO getMember(String user_id)throws Exception {
		return dao.getMember(user_id);
	}
	
	
	
	@Override
	public MemberVO getNick(String user_nick) throws Exception {
		
		return dao.getNick(user_nick);
	}

	@Override
	public String getAccessToken (String authorize_code)throws Exception {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
            
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
        
			sb.append("&client_id=d2adbec5b44fdcc0559d1e3ca898739e"); //본인이 발급받은 key
			sb.append("&redirect_uri=http://testteam.ga/member/kakaoLogin"); // 본인이 설정한 주소

            
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
            
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
            
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
            
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
            
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
            
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
            
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}

	@Override
	public HashMap<String, Object> getUserInfo(String access_Token)throws Exception {
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			String email="";
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			if (kakao_account.getAsJsonObject().get("email")!=null) {
				email = kakao_account.getAsJsonObject().get("email").getAsString();
			}
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);

		} catch (IOException e) {
			e.printStackTrace();
		}
//		 catch 아래 코드 추가.
		HashMap<String, Object> result = dao.findkakao(userInfo);
				mylog.info("ddddddddddddddd"+result);
				// 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
				System.out.println("S:" + result);
				if(result==null) {
				// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
					dao.kakaoinsert(userInfo);
					// 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
					return dao.findkakao(userInfo);
					// 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
					//  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
				} else {
					return result;
					// 정보가 이미 있기 때문에 result를 리턴함.
				}
	}
	
	//이메일인증..
	@Override
	public int updateMailKey(MemberVO vo) throws Exception {
	    return dao.updateMailKey(vo);
	}

	@Override
	public int updateMailAuth(MemberVO vo) throws Exception {
	    return dao.updateMailAuth(vo);
	}

	@Override
	public int emailAuthFail(String user_id) throws Exception {
	    return dao.emailAuthFail(user_id);
	}

	@Override
	public void insertRep(ReportVO vo) throws Exception {
		dao.insertRep(vo);
	}

	
	// 아이디 찾기
		@Override
		public MemberVO findId(MemberVO vo) throws Exception {
			mylog.info("findId(MemberVO vo) 호출");
			
			return dao.findId(vo);
		}

		
		
		
		
		
		
		//비밀번호 찾기
		@Override
		public void findPw(HttpServletResponse response, MemberVO vo) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			String user_email = "";
			
			PrintWriter out = response.getWriter();
			// 가입된 아이디가 없으면
//			if(dao.getMember(vo.getUser_id()) == null) {
//				out.print("등록되지 않은 아이디입니다.");
//				out.close();
			
			// 가입된 이메일이 아니면
//			else if(!vo.getUser_email().equals(user_email)) {
//				out.print("등록되지 않은 이메일입니다.");
//				out.close();
//			}else {
			
				// 임시 비밀번호 생성
				String pw = "";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}
				vo.setUser_pw(pw);
				// 비밀번호 변경
				dao.updatePwF(vo);
				// 비밀번호 변경 메일 발송
				sendEmail(vo, "findpw");

				out.print("이메일로 임시 비밀번호를 발송하였습니다.");
				out.close();
//			}
		}
		
		//비밀번호 찾기 이메일발송
				@Override
				public void sendEmail(MemberVO vo, String div) throws Exception {

			        //비밀번호 찾기 버튼을 누르면 인증을 위한 이메일 발송
			        MailHandler sendMail = new MailHandler(mailSender);
			        sendMail.setSubject("[PANDA 비밀번호 찾기 메일 입니다.]"); //메일제목
			        sendMail.setText(
			                "<h1>PANDA 비밀번호 찾기</h1><br>" + vo.getUser_pw() + 
			                		
			                "<br> 비밀번호 바꾸러 가기! click! " +
			                "<br><a href='http://testteam.ga/member/pwUpdate?user_no=" + vo.getUser_no() + 
			                "' target='_blank'>마이페이지에서 변경해주세요....</a>");
			        sendMail.setFrom("leweeewel@gmail.com", "Panda 판다");
			        sendMail.setTo(vo.getUser_email());
			        sendMail.send();
					}

				
				@Override
				public String pwCheck(int user_no)throws Exception{
					return dao.pwCheck(user_no);
				}
				
				@Override
				public void updatePw(MemberVO vo)throws Exception{
					dao.updatePw(vo);
				}
				
				
				//   전체회원 목록 조회
				@Override
				public List<MemberVO> getMemList(String id) throws Exception {
					return dao.getMemList(id);
				}
				// 관리자용 회원정보 조회
				@Override
				public MemberVO getMemberA(MemberVO mVO) throws Exception {
					return dao.getMemberA(mVO);
				}
				// 관리자용 일반 <-> 블랙회원 전환
				@Override
				public void changeblack(MemberVO mvo) throws Exception {
						dao.changeblack(mvo);
				}
		
		

}
