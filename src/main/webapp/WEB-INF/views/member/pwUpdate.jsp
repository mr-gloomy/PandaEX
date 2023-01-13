<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!DOCTYPE html>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script type="text/javascript"></script>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>update password</title>
  
    
   <link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />


  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<body class="hold-transition skin-blue sidebar-mini">
<!-- <div class="wrapper"> -->

  <!-- Left side column. contains the logo and sidebar -->>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Back to Home
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="error-page">
        <h4 class="headline text-yellow"> update my password</h4>
<br><br><br><br><br><br>
        <div class="error-content">
           	
           	
           	
           	 <form action="/member/pwUpdate" method="post" id="pwUpdateForm" name="pwUpdateForm">
                       <input type="hidden" id="memberId" name="user_no" value="${param.user_no}">
    <div class="col-sm-30 col-sm-offset-20">
        <div class="panel panel-default panel-margin-10">
            <div class="panel-body panel-body-content text-center">
                <p class="lead">변경하실 비밀번호를 입력해 주세요.</p>
                <div class="form-group">
                    <input type="password" name="user_pw" id="memberPw" class="form-control form-control-inline text-center" placeholder="임시 비밀번호" />
                </div>
                <div class="form-group">
                    <input type="password" id="memberPw1" class="form-control form-control-inline text-center" placeholder="새 비밀번호" />
                </div>
                <div class="form-group">
                    <input type="password" name="pw2" id="memberPw2" class="form-control form-control-inline text-center" placeholder="새 비밀번호 확인" />
                </div>
                <button type="submit" id="pwUpdate" name="pwUpdate" class="btn btn-primary">비밀번호 변경</button> 
                
                <a href="/main/index" class="btn btn-default">취소</a>
            </div>
        </div>
    </div>
    </form>
    
   

            </div>
            <!-- /.input-group -->
        </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<!-- </div> -->









<script>
		$(document).ready(function(){
		
			$("#.pwUpdate").on("click", function(){
				if($("#memberPw").val==""){
					alert("현재 비밀번호를 입력해주세요");
					$("#memberPw").focus();
					return false
				}
				if($("#memberPw1").val==""){
					alert("변경비밀번호를 입력해주세요");
					$("#memberPw1").focus();
					return false
				}
				if($("#memberPw2").val==""){
					alert("변경비밀번호를 입력해주세요");
					$("#memberPw2").focus();
					return false
				}
				if ($("#memberPw").val() != $("#memberPw2").val()) {
					alert("변경비밀번호가 일치하지 않습니다.");
					$("#memberPw2").focus();
					 
				
				$.ajax({
					url : "/member/pwCheck",
					type : "POST",
					dataType : "json",
					data : $("#pwUpdateForm").serializeArray(),
					success: function(data){
						
						if(data==0){
							alert("패스워드가 틀렸습니다.");
							return;
						}else{
							if(confirm("변경하시겠습니까?")){
								$("#pwUpdateForm").submit();
							}
							
						}
					}
				})
				
			});
			
				
			
		})
	</script>
<%@ include file="/WEB-INF/views/admin/include/footer.jsp"%>

