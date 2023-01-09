<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="../include/header.jsp" %>
    
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script type="text/javascript"> </script>
			
	<style>
	
		.checkout_area mb-100 {
			width: 1000px; 
			margin: 0px auto;
		
		}
		
		.btn alazea-btn w-120 {
			width:250pt;
			height:40pt;
			margin:auto; 
			display:block;
		}
		
		@media only screen and (max-width: 767px){
			
		.container {
			width:90%;

		}

}
	
	</style>		
			
			
    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${pageContext.request.contextPath }/resources/img/bg-img/golf-2704608.jpg);">
            <h2>Update My Account</h2>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item"><a href="/member/mypage"> Mypage </a>
                            <li class="breadcrumb-item active" aria-current="page">Update</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
<!-- ##### Breadcrumb Area End ##### --> 
    
				
				
		 	
    


	<!-- 본문 -->

    <!-- ##### Checkout Area Start ##### -->
    <div class="checkout_area mb-100">
        <div class="container">
<!--             <div class="row justify-content-between"> -->
<!--                 <div class="col-12 col-lg-7"> -->
                    <div class="checkout_details_area clearfix">
                        <h2>Update</h2>
                        <br><br><br><br>
                        <form action="${pageContext.request.contextPath }/member/updatePro" id="updateFrm1" method="post">
                            <div class="row">
                                <div class="col-12 mb-4">
                                    <label for="email_address">회원님의 ID (E-mail) 수정불가 *</label>
                                    <input type="email" class="form-control" id="email_address" name="user_id" value="${loginVO.user_id }" readonly><br>
                                </div>
                                
                                <div class="col-md-12 mb-12">
                                    <label for="first_name">Name *</label>
                                    <input type="text" class="form-control" id="first_name" name="user_name" value="${loginVO.user_name }" required=""><br>
                                </div>
                                <div class="col-md-6 mb-4 mt-3">
                                    <label for="last_name">Password *</label>
                                    <input type="password" class="form-control" id="user_pw" name="user_pw"><br>
                                </div>
                                <div class="col-md-6 mb-4 mt-3">
                                    <label for="last_name">Password Confirm *</label>
                                    <input type="password" class="form-control" id="pw2" name="pw2"  ><br>
                                </div>
                                          
                                                                
                                <div class="col-md-6 mb-4 mt-3">
                                    <label for="email_address">Phone Number *</label>
                                    <input type="tel" class="form-control" id="user_phone" 	name="user_phone" value="${loginVO.user_phone }">
                                    <input type="hidden" name="user_phone1" id="user_phone1">                                                                    
                                </div>
                                 <div class="col-md-6 mb-4 mt-3" style="line-height: 105px;"> 
                                    <button type="button" class="btn alazea-btn w-80" 
                                   id="updatePhoneForm" value="Y" style="width:40pt;height:30pt;">전화번호 수정</button>    
                                                                                                    
                                    <button type="button" class="updatePhoneCheck btn btn-danger alazea-btn w-80"  style="display: none"
                                   id="updatePhoneCheck" value="Y" style="width:40pt;height:30pt;">전화번호 수정하기</button>
                                   <br><br>
                                </div>
                                
                                
                             
                               <%--  <div class="col-12 mb-12">
                                    <label for="phone_number">My Locations *</label>                                   
								</div>  
								
								<div class="col-md-6 mb-4 mt-3">                                  
                                    <input type="number" class="form-control" name="latitude"	id="latitude" min="0" value="${loginVO.latitude}"  placeholder="latitude">
                                </div>
                                
                                <div class="col-md-6 mb-4 mt-3">                                  
                                    <input type="number" class="form-control" name="longitude"	id="latitude" min="0" value="${loginVO.longitude}"   placeholder="longitude" >
                                </div> --%>
      
                                
                                <button type="button"	onclick="javascript:btn()" class="btn alazea-btn w-120">회원정보 수정하기</button>
                                
                            </div>
                        </form>
                    </div>

            </div><br><br>
            	
			<script>
				//전화번호 수정하기
				$(document).ready(function() {
				$('.updatePhoneCheck').click(function() {
						//alert($("#user_id").val());
						$.ajax({
							url : "/member/updatePhone",
							type : "post",
							dataType : "json",
							data : {
								"user_phone" : $("#user_phone").val()
							},
							success : function(data) {
								console.log(data);
								//alert(data);
								if (data == 1) {
									$('#loginVO.user_phone').val(1);
									alert("전화번호 수정 되었습니다.");
									
						
									$("#user_phone").attr("readonly",true);
									$("#updatePhoneCheck").hide();
									$("#updatePhoneForm").show();
									
								} else if (data == -1) {
									$('#loginVO.user_phone').val(0);
									$("#updatePhoneCheck").attr("value", $("#user_phone"));
									alert("이미 사용중인 전화번호 입니다.");
								}
							},
							error:function(error){
								console.log("에러 : ", error);
								if(parseInt(error.responseText)===-2){
									alert("이미 사용중인 전화번호 입니다.");	
								}
								
							}
						}); 
					});
				
				$("#updatePhoneForm").on("click", function(e){
					$(this).hide();
					setTimeout(() => {
						$("#updatePhoneCheck").show();	
					}, 300);
					$("#user_phone").attr("readonly",false);
					
				})
				
			});
				
				// 회원정보 수정완료 alert
				function btn(){
						const user_name=$("#first_name").val();
						const user_pw=$("#user_pw").val();
						const pw2 =$("#pw2").val();
						if(!user_name){
							alert("이름을 입력해 주세요.");
							return;
						}
						if(!user_pw){
							alert("비밀번호를 입력해 주세요.");
							return ;
						}
						if(!pw2){
							alert("비밀번호확인을 입력해 주세요.");
							return ;
						}
						if(user_pw!==pw2){
							alert("비밀번호와 비밀번호 확인 일치하지 않습니다.");
							return;
						}
						
						$.ajax({
							type:"POST",
							url:"/member/updatePro",
							data: $("#updateFrm1").serialize(),
							success:function(res){
								console.log(res);
								if(res==="success"){
									alert('수정이 완료되었습니다.');		
									location.reload();
									location.href="/member/mypage";
								}
							},
							error:function(error){
								console.log(error);
							}
							
						})
					   
				}
				
				</script>
<!-- 				    
				    private String user_id;
	private String user_pw; 
	private String user_name;
	private String user_phone;
	private Date reg_date;
	private int score;
	private double latitude;
	private double longitude; -->
    </div>
    <!-- ##### Checkout Area End ##### -->
    <!-- 본문 -->

	


	
	<%@ include file="../include/footer.jsp" %>