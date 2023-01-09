<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




	<!-- 본문 -->
		
	<div class="checkout_area mb-100">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-12 col-lg-7">
					<div class="checkout_details_area clearfix">
						<h5>Find My Email</h5>
						<br><br>
						
						
							<div class="row">
								<div class="col-12 mb-4">
									<label for="user_name">찾으시는 아이디는 ${id }입니다.</label> 
									<br><br><br>
								
								
								<div>
									<a class="action remind" href="${pageContext.request.contextPath }/member/login"><span>Go To Login</span></a><br>
								</div>
								<div>
									<a class="action remind" href="${pageContext.request.contextPath }/member/findPw"><span>Forgot Your Password?</span></a><br>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
                
	<!-- 본문 -->



	


<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
</script>