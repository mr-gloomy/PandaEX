<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/admin/boardRegist.jsp</h1>

	<form name="theForm" id="theForm" action="" method="post">

		제목 : <input type="text" name="title" > <br>
		내용 :
		<textarea rows="3" placeholder="Enter..." name="content"></textarea>
		<br> 작성자 : <input type="text" name="writer" >
		<br> 카테고리 : <select name="category" id="id_select" >
			<option value selected disabled hidden>카테고리를 선택하세요</option>
			<option value="notice">공지사항</option>
			<option value="event">이벤트</option>
			<option value="donate">기부문의</option>
		</select> 
		<br>
		
		 <input type="submit" class="" value="글쓰기">
	</form>
	<button type="button" class="" onclick="location.href='/admin/list';">글목록</button>

<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.6.16/dist/sweetalert2.all.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
	
<script type="text/javascript">
$(document).ready(function(){
	
	$('#theForm').submit(function(event){
	
	// 자동 submit을 시키는 것을 막는다.
	event.preventDefault();

    // 초기값은 false로 셋팅을 한다.
  	var isSubmit = false;
	
  		if($("input[name=title]").val() == ""){
  			Swal.fire({
  				  icon: 'error',
  				  title: '제목을 작성하세요!'
  				})
  				isSubmit = false;
  			}
  		
  		else if($("input[name=writer]").val() == ""){
  			Swal.fire({
  				  icon: 'error',
  				  title: '작성자명을 작성하세요!'
  				})
  				isSubmit = false;
  			}
  		
  		else if($("#id_select").val() == null){
  			Swal.fire({
  				  icon: 'error',
  				  title: '카테고리를 선택하세요!'
  				})
  				
  				isSubmit = false;
  			}
  		
  		
  		else{
  			isSubmit = true;
  		}
  		
  		
	if(isSubmit)this.submit();
	
  	});
    
    
  	
});
</script>


</body>
</html>