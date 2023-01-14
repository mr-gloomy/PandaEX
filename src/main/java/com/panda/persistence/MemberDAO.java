package com.panda.persistence;

import java.util.HashMap;
import java.util.List;

import com.panda.domain.MemberVO;
import com.panda.domain.ReportVO;

public interface MemberDAO {
			//회원가입 처리
			public void insert(MemberVO vo) throws Exception;
		
			//로그인
			public MemberVO loginMember(MemberVO vo)throws Exception;
			
			//회원조회
			public MemberVO getMember(String user_id) throws Exception;
			//닉네임조회
			public MemberVO getNick(String user_nick) throws Exception;
			
			//카카오로그인
			public HashMap<String, Object> findkakao(HashMap<String, Object> userInfo)throws Exception;

			public void kakaoinsert(HashMap<String, Object> userInfo)throws Exception;
			
		
			
			//이메일인증~
			int updateMailKey(MemberVO vo) throws Exception;
			int updateMailAuth(MemberVO vo) throws Exception;
			int emailAuthFail(String user_id) throws Exception;

			// 아이디 찾기
			public MemberVO findId(MemberVO vo) throws Exception;
			
			// 신고 관련
			public void insertRep(ReportVO vo) throws Exception;
			
			// 마이 페이지 - 메인 
			public MemberVO getMemberss(String user_id);

			
			// 마이 페이지 - 정보 수정 
			public void modify(MemberVO memberVO) throws Exception;
			
			// 마이페이지 회원조회
			public MemberVO getMemberss(MemberVO vo) throws Exception;
			
			// 마이 페이지 - 정보 수정 - 비밀번호 확인 
			public Integer passCheck(MemberVO memberVO) throws Exception;
			
			// 마이 페이지 - 회원 탈퇴 
			public void exit(MemberVO memberVO) throws Exception;

			// 비밀번호 변경
			public int updatePw(MemberVO vo) throws Exception;

			public String pwCheck(int user_no)throws Exception;
			
			public int updatePwF(MemberVO vo) throws Exception;
			
//			public Integer mypupdate(MemberVO vo) throws Exception;
			
			
			// * 관리자용
			//   전체회원 목록 조회
			public List<MemberVO> getMemList(String id)throws Exception;
			
			// 일반회원 <-> 블랙회원 전환
			public void changeblack(MemberVO mvo)throws Exception;
			
			// 관리자용 회원조회
			public MemberVO getMemberA(MemberVO vo);
			
}
