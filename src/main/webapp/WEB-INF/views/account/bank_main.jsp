<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
</head>
<body>
<script src="${pageContext.request.contextPath }/resources/js/jquery/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.serializeObject.js"></script>
<h1>views/bank_main.jsp</h1>

<h1>인증완료(토큰발급)</h1>
<h2>access_token : ${responseTokenVO.access_token }</h2>
<h2>token_type : ${responseTokenVO.token_type }</h2>
<h2>expires_in : ${responseTokenVO.expires_in }</h2>
<h2>refresh_token : ${responseTokenVO.refresh_token }</h2>
<h2>scope : ${responseTokenVO.scope }</h2>
<h2>user_seq_no : ${responseTokenVO.user_seq_no }</h2> <!-- 사용자일련번호 -->

<h1>bank_tran_id : ${responseTokenVO.bank_tran_id }</h1>

<h2>사용자정보 조회</h2> <!-- p32 -->
<form action="userInfo" method="get">
 <input type="hidden" name="access_token" value = "${responseTokenVO.access_token }">
 <input type="hidden" name="user_seq_no" value = "${responseTokenVO.user_seq_no }">
 <input type="submit" value = "사용자정보조회">
</form>

<h2>등록계좌조회</h2> <!-- p36 -->
<form action="accountList" method="get">
 <input type="hidden" name="access_token" value = "${responseTokenVO.access_token }">
 <input type="hidden" name="user_seq_no" value = "${responseTokenVO.user_seq_no }">
 <input type="hidden" name="include_cancel_yn" value = "Y"> <!-- 해지계좌포함여부 - ‘Y’:해지계좌포함, ‘N’:해지계좌불포함 -->
 <input type="hidden" name="sort_order" value = "D"> 
<!--  정렬순서
- ‘D’:Descending, ‘A’:Ascending
- 정렬 기준 : 조회서비스 동의일시, 출금서비스 동의일시 중 최근 값 -->
 <input type="submit" value = "등록계좌조회">
</form>

<h2> 출금API </h2>
<form method="post" action="withdraw" >
		<input type="hidden" name="access_token" value="${responseTokenVO.access_token }">
<%-- 		<input type="hidden" name="access_token" value="${sessionScope.token }"> --%>
<!-- 		<input type="hidden" name="access_token" value="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAxMDE0NzM5Iiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwib29iIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE2NzYyNTg0MDQsImp0aSI6IjQ0NTAyNTNhLWY1YTEtNGRmOC05ODQ0LTdlNzVmYWRhZTRhZiJ9._yvPTWTIohkjlQx5ii_UmnyIFLB3VzFNFtlOcfdpC9U"> -->
		
		<input type="hidden" name="bank_tran_id" value="${responseTokenVO.bank_tran_id }">
		<input type="hidden" name="cntr_account_type" value="N">
		<input type="hidden" name="cntr_account_num" value="7777777777777777">
		<input type="hidden" name="dps_print_content" value="이용료(강중혁)">
		<input type="hidden" name="fintech_use_num" value="120220239188941217478246">
<!-- 		<input type="hidden" name="fintech_use_num" value="120220208388941285310465"> -->
<!-- 		<input type="hidden" name="wd_print_content" value="오픈뱅킹출금"> -->
		
		<input type="hidden" name="tran_amt" value="000000001000"> <!-- tran_amt : 거래금액 -->
		<input type="hidden" name="tran_dtime" value="20230101"> <!-- 요청일시 -->
		<input type="hidden" name="req_client_name" value="강중혁">
<!-- 		<input type="hidden" name="req_client_bank_code" value="004"> -->
<!-- 		<input type="hidden" name="req_client_account_num" value="1101230000678"> -->
		<input type="hidden" name="req_client_fintech_use_num" value="120220239188941217478246">
		<input type="hidden" name="req_client_num" value="hyucky1234">
		<input type="hidden" name="transfer_purpose" value="TR"> <!-- transfer_purpose 이체 용도 안내 송금:TR-->
<!-- 		<input type="hidden" name="req_client_account_num" value="7777777777777777"> -->
<!-- 		<input type="hidden" name="sub_frnc_name" value="하위가맹점"> -->
<!-- 		<input type="hidden" name="sub_frnc_num" value="123456789012"> -->
<!-- 		<input type="hidden" name="sub_frnc_business_num" value="1234567890"> -->
		
<!-- 		<input type="hidden" name="recv_client_name" value="강중혁"> -->
<!-- 		<input type="hidden" name="recv_client_bank_code" value="004"> -->
<!-- 		<input type="hidden" name="recv_client_account_num" value="7777777777777777"> -->
		 <input type="submit" value = "출금API ">
	</form>
	
	<h2> 입금API </h2>
	<form method="post" action="deposit" >
		<input type="hidden" name="access_token" value="${responseTokenVO.access_token }">
<%-- 		<input type="hidden" name="access_token" value="${sessionScope.token }"> --%>
<!-- 		<input type="hidden" name="access_token" value="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAxMDE0NzM5Iiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwib29iIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE2NzYyNTg0MDQsImp0aSI6IjQ0NTAyNTNhLWY1YTEtNGRmOC05ODQ0LTdlNzVmYWRhZTRhZiJ9._yvPTWTIohkjlQx5ii_UmnyIFLB3VzFNFtlOcfdpC9U"> -->
		
		<input type="hidden" name="bank_tran_id" value="${responseTokenVO.bank_tran_id }">
		<input type="hidden" name="cntr_account_type" value="N">
		<input type="hidden" name="cntr_account_num" value="7777777777777777">
		<input type="hidden" name="wd_pass_phrase" value="NONE">
		<input type="hidden" name="wd_print_content" value="마지막중고거래">
		<input type="hidden" name="name_check_option" value="off">
		<input type="hidden" name="tran_dtime" value="20230101200200"> <!-- 요청일시 -->
		<input type="hidden" name="req_cnt" value="1">
		<input type="hidden" name="tran_no" value="1">
		<input type="hidden" name="fintech_use_num" value="120220239188941217478246">
		<input type="hidden" name="print_content" value="마지막중고거래">
		<input type="hidden" name="tran_amt" value="500"> <!-- tran_amt : 거래금액 -->
		<input type="hidden" name="req_client_name" value="강중혁">
		<input type="hidden" name="req_client_num" value="HONGGILDONG1234">
		<input type="hidden" name="transfer_purpose" value="TR"> <!-- transfer_purpose 이체 용도 안내 송금:TR-->
		
		<input type="hidden" name="req_client_fintech_use_num" value="120220239188941217478246">
		 <input type="submit" value = "입금API ">
	</form>

</body>
</html>