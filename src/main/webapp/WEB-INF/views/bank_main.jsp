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
<script type="text/javascript">
	$(document).ready(function() {
		$('#price').val(sessionStorage.getItem('price'));
		$('#price2').val(sessionStorage.getItem('price'));
		alert("test");
// 		$(".btn-danger").click(function(){
		function pay(){
		$('#clickTest').click(function(){
		//$('#clickTest').on("click", function(){
			
		//페이지 로드 시 함수 바로 실행
// 		window.onload = function(){
			alert('클릭');
			//let info = $('#fr').serializeArray();
			let info = $('#fr').serializeObject();
			let infoD = $('#fr22').serializeObject();
			
			var result = confirm("이체를 진행하시겠습니까?");
			if(result){
			
			alert('실행');
			//출금이체////////////////////////////////////
			$.ajax({
				url  : "/openbanking/withdraw",
				type : "POST",
				async : true,
				data : JSON.stringify(info),
				dataType:"json",
				contentType : "application/json;charset=UTF-8",
				success 	: function(data) {
					if(data.rsp_code == "A0000"){
						alert("출금성공");
						$('#result').html(data.account_num_masked + " / " + data.bank_name + " / " + data.account_holder_name + "님의 계좌에서 <br>");
						
						$('#req_account_num_masked').val(data.account_num_masked);
						$('#req_bank_name').val(data.bank_name);
						$('#req_account_holder_name').val(data.account_holder_name);
					} else {
						alert('출금에 실패하였습니다.');
						$.ajax({
							url  : "/deal/deleteBuyer",
							type : "GET",
							dataType:'json',
							data : {
								'deal_num':'${sessionScope.prod_num}',
							},
							contentType : "application/json;charset=UTF-8",
		    });
						location.href = "/";
						return false;
					}
				
			    },
			    error		: function(error) {
			    	console.log(error);
			    	alert('이체에 실패하셨습니다.');
			    	$.ajax({
						url  : "/deal/deleteBuyer",
						type : "GET",
						dataType:'json',
						data : {
							'deal_num':'${sessionScope.prod_num}',
						},
						contentType : "application/json;charset=UTF-8",
	    });
			    	location.href = "/";
			    }
			});
			}else{
			    alert("이체를 취소하였습니다.");
			    var answer = confirm("거래를 취소하시겠습니까?");
			    
			    if(answer){
					$.ajax({
									url  : "/deal/deleteBuyer",
									type : "GET",
									dataType:'json',
									data : {
										'deal_num':'${sessionScope.prod_num}',
									},
									contentType : "application/json;charset=UTF-8",
				    });
				    location.href = "/";
				}//if 종료
				 else{
					return false;
				}
			}
// 		    }
			
		}); // click
		}; 
		// pay click
		

 	});//jquery
			
</script>    
<h1>인증완료(토큰발급)</h1>
<h2>access_token : ${responseTokenVO.access_token }</h2>
<h2>token_type : ${responseTokenVO.token_type }</h2>
<h2>expires_in : ${responseTokenVO.expires_in }</h2>
<h2>refresh_token : ${responseTokenVO.refresh_token }</h2>
<h2>scope : ${responseTokenVO.scope }</h2>
<h2>user_seq_no : ${responseTokenVO.user_seq_no }</h2> <!-- 사용자일련번호 -->

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
<form method="post" action="withdraw" id="fr">
		<input type="hidden" name="access_token" value="${responseTokenVO.access_token }">
<%-- 		<input type="hidden" name="access_token" value="${sessionScope.token }"> --%>
<!-- 		<input type="hidden" name="access_token" value="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAxMDE0NzM5Iiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwib29iIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE2NzYyNTg0MDQsImp0aSI6IjQ0NTAyNTNhLWY1YTEtNGRmOC05ODQ0LTdlNzVmYWRhZTRhZiJ9._yvPTWTIohkjlQx5ii_UmnyIFLB3VzFNFtlOcfdpC9U"> -->
		
		<input type="hidden" name="bank_tran_id" value="M202202391U7BC366365">
		<input type="hidden" name="cntr_account_type" value="N">
		<input type="hidden" name="cntr_account_num" value="7777777777777777">
		<input type="hidden" name="dps_print_content" value="마지막">
		<input type="hidden" name="fintech_use_num" value="120220239188941217478246">
<!-- 		<input type="hidden" name="fintech_use_num" value="120220208388941285310465"> -->
<!-- 		<input type="hidden" name="wd_print_content" value="오픈뱅킹출금"> -->
		
		<input type="hidden" id="price" name="tran_amt" value="1000"> <!-- tran_amt : 거래금액 -->
		<input type="hidden" name="tran_dtime" value="202301012002"> <!-- 요청일시 -->
		<input type="hidden" name="req_client_name" value="강중혁">
		<input type="hidden" name="req_client_bank_code" value="004">
		<input type="hidden" name="req_client_account_num" value="1101230000678">
		<input type="hidden" name="req_client_num" value="hyucky1225">
		<input type="hidden" name="transfer_purpose" value="TR"> <!-- transfer_purpose 이체 용도 안내 송금:TR-->
		<input type="hidden" name="req_client_account_num" value="7777777777777777">
		<input type="hidden" name="sub_frnc_name" value="하위가맹점">
		<input type="hidden" name="sub_frnc_num" value="123456789012">
		<input type="hidden" name="sub_frnc_business_num" value="1234567890">
		
		<input type="hidden" name="recv_client_name" value="강중혁">
		<input type="hidden" name="recv_client_bank_code" value="004">
		<input type="hidden" name="recv_client_account_num" value="7777777777777777">
		 <input type="submit" value = "출금API " id="clickTest">
	</form>

</body>
</html>