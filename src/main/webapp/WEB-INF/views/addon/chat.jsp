<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
body {
	margin: 0;
}
</style>
<title>웹소켓 채팅</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<link
	href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" tyconpe="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
<script src="bootstrap-modal-wrapper-factory.min.js"></script>

<script type="text/javascript">
	var cur_session = '${user_id}';

$(function() {
	
	$.ajax({
		url:'/chat/getMsgs/${user_id}/${param.u}',
		type:'get',
		contentType:"application/json; charset:UTF-8",
		success:function(data) {
			$("#divChatData").empty();
			$(data).each(function(index,item) {
				var msg_time = new Date(item.msg_date);
				var time_hour = (msg_time.getHours() > 12) ? "오후 "
						+ (msg_time.getHours() - 12) : "오전 "
						+ msg_time.getHours();
				if (item.send_id != cur_session) {
					$('#divChatData')
							.append(
									"<div class='direct-chat-msg'><div class='direct-chat-info clearfix'><span class='direct-chat-name pull-left'>"
											+ item.send_id 
											+ "</span><span class='direct-chat-timestamp' style='float: left;'>&nbsp;&nbsp;"
											+ msg_time.getFullYear()+"-"+(msg_time.getMonth()+1)+"-"+msg_time.getDate()+" "+time_hour
											+ " : "
											+ msg_time.getMinutes()
											+ "</span></div><div class='direct-chat-text' style='margin-left: 0px; margin-right: 40%'>"
											+ item.message + "</div></div>");
				} else {
					$('#divChatData')
							.append(
									"<div class='direct-chat-msg right'><div class='direct-chat-info clearfix'>"
											+ "<span class='direct-chat-timestamp' style='float: right;'>"
											+ msg_time.getFullYear()+"-"+(msg_time.getMonth()+1)+"-"+msg_time.getDate()+" "+time_hour
											+ " : "
											+ msg_time.getMinutes()
											+ "</span></div><div class='direct-chat-text' style='margin-right:0px; margin-left:40%;'>"
											+ item.message + "</div></div>");
				}
			});
		}
	});
	
	
	setInterval(function() {
		$.ajax({
			url:'/chat/getNewMsg/${bang_id}/${param.u}',
			type:'get',
			contentType:"application/json; charset:UTF-8",
			success:function(data) {
				$(data).each(function(index,item) {
					var msg_time = new Date(item.msg_date);
					var time_hour = (msg_time.getHours() > 12) ? "오후 "
							+ (msg_time.getHours() - 12) : "오전 "
							+ msg_time.getHours();
						$('#divChatData')
								.append(
										"<div class='direct-chat-msg'><div class='direct-chat-info clearfix'><span class='direct-chat-name pull-left'>"
										+ item.send_id 
										+ "</span><span class='direct-chat-timestamp' style='float: left;'>&nbsp;&nbsp;"
										+ msg_time.getFullYear()+"-"+(msg_time.getMonth()+1)+"-"+msg_time.getDate()+" "+time_hour
										+ " : "
										+ msg_time.getMinutes()
										+ "</span></div><div class='direct-chat-text' style='margin-left: 0px; margin-right: 40%'>"
										+ item.message + "</div></div>");
				});
			}
		});
	}, 1000);
	
	function sendChat() {
		var cur_time = new Date().getTime();
		var msg_time = new Date(cur_time);
		var time_hour = (msg_time.getHours() > 12) ? "오후 "
				+ (msg_time.getHours() - 12) : "오전 "
				+ msg_time.getHours();
		var msg = $('#message').val();
		$.ajax({
			url:'/chat/insertMsg',
			type:'post',
			contentType:"application/json; charset:UTF-8",
			data: JSON.stringify({
				send_id:'${user_id}',
				receive_id:'${param.u}',
				bang_id:'${bang_id}',
				goods_no:'${param.g}',
				auction_no:'${param.a}',
				message:msg,
				msg_date:cur_time
			}),
			success:function(data) {
				$('#divChatData')
				.append(
						"<div class='direct-chat-msg right'><div class='direct-chat-info clearfix'>"
						+ "<span class='direct-chat-timestamp' style='float: right;'>"
						+ msg_time.getFullYear()+"-"+(msg_time.getMonth()+1)+"-"+msg_time.getDate()+" "+time_hour
						+ " : "
						+ msg_time.getMinutes()
						+ "</span></div><div class='direct-chat-text' style='margin-right:0px; margin-left:40%;'>"
						+ msg + "</div></div>");
			}
		});
		$('#message').val('');
	}

	$("#message").keydown(function(keyNum){
		if(keyNum.keyCode == 13){
			sendChat();
		}
	});
	
	$("#btnSend").click(function() {
		sendChat();		
	});
	
	
});
</script>
</head>
<body>

	<div class="box box-success direct-chat direct-chat-success">
		<div class="box-header with-border">
			<h3 class="box-title">Panda Chat</h3>
		</div>


		<div class="box-body">

			<div style="height: 81vh;" class="direct-chat-messages">
				<div id="divChatData">
					<div class="col-md-4"
						style="padding-right: 0px; padding-left: 0px;">

						<c:if test='${goods!=null }'>
							<div class="box box-widget widget-user-2">

								<div class="widget-user-header"
									style="background-color: #00a65a;">
									<div class="widget-user-image">
										<img class="img-circle" width="30" height="30"
											src="../resources/image/emoji_6.png"> <span
											style="font-size: 17px">${goods.goods_title }</span>
									</div>

									<h3 class="widget-user-username"
										style="margin-top: 4px; margin-bottom: 4px;">
										<fmt:formatNumber value="${goods.goods_price }" />
										원
									</h3>
									<h5 class="widget-user-desc">
										<b>${goods.goods_trade}</b>
									</h5>
								</div>
								<div class="box-footer no-padding">
									<ul class="nav nav-stacked">
										<li><a style="display: inline;"
											href="/goods/read?goods_no=${goods.goods_no}" target="_blank">상품
												보기</a> <a style="display: inline;" data-toggle="modal"
											data-target="#myModal">신고하기</a></li>
									</ul>
								</div>
							</div>
						</c:if>
						<c:if test='${auctions!=null }'>
							<div class="box box-widget widget-user-2">

								<div class="widget-user-header"
									style="background-color: #00a65a;">
									<div class="widget-user-image">
										<img class="img-circle" width="30" height="30"
											src="../resources/image/emoji_6.png"> <span
											style="font-size: 17px">${auctions.auction_title }</span>
									</div>

									<h3 class="widget-user-username"
										style="margin-top: 4px; margin-bottom: 4px;">
										<fmt:formatNumber value="${auctions.auction_bid }" />
										원
									</h3>
									<%-- <h5 class="widget-user-desc"><b>${goods.goods_trade}</b></h5> --%>
								</div>
								<div class="box-footer no-padding">
									<ul class="nav nav-stacked">
										<li><a style="display: inline;"
											href="/auction/a_read?auction_no=${auctions.auction_no}&user_no=${auctions.user_no}"
											target="_blank">상품 보기</a> <a style="display: inline;"
											data-toggle="modal" data-target="#myModal">신고하기</a></li>
									</ul>
								</div>
							</div>
						</c:if>


					</div>

				</div>
			</div>


			<div class="direct-chat-contacts">
				<ul class="contacts-list">
					<li><a href="#"> <img class="contacts-list-img"
							src="../dist/img/user1-128x128.jpg" alt="User Image">
							<div class="contacts-list-info">
								<span class="contacts-list-name"> Count Dracula <small
									class="contacts-list-date pull-right">2/28/2015</small>
								</span> <span class="contacts-list-msg">How have you been? I
									was...</span>
							</div>

					</a></li>

				</ul>

			</div>

		</div>

		<div class="box-footer">
			<div class="input-group">
				<input type="text" id="message" size="110" class="form-control">
				<span class="input-group-btn">
					<button type="button" id="btnSend" class="btn btn-success btn-flat">채팅 전송</button>
				</span>
			</div>
		</div>

	</div>


	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 80%;">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">신고하기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="/member/report" method="post" id="frm">
						<input type="hidden" name="rep_u_id" value="${param.u }">
						<c:if test='${param.g!=null }'>
							<input type="hidden" name="goods_no" value="${param.g }">
						</c:if>
						<c:if test='${param.a!=null }'>
							<input type="hidden" name="auction_no" value="${param.a }">
						</c:if>
						<input type="hidden" name="u_id" value="${user_id }"> <input
							type="text" name="rep_subject" placeholder="신고 제목"
							style="width: 100%;"><br>
						<br> <select name="rep_sort" style="width: 100%;">
							<option selected>신고 분류</option>
							<option value="1">욕설</option>
							<option value="2">거래에 문제가 있었어요!</option>
							<option value="3">기타</option>
						</select><br>
						<br>
						<textarea rows="10" cols="10" style="width: 100%;"
							name="rep_reason" placeholder="신고 사유"></textarea>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="#" class="btn btn-primary"
						onclick="document.getElementById('frm').submit();">신고하기</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>




</body>
</html>