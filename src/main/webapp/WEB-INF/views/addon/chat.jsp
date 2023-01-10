<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
	<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" tyconpe="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript">
		
		var cur_session='${user_id}';
		
		var webSocket = {
			init: function(param) {
				this._url = param.url;
				this._initSocket();
			},
			sendChat: function() {
				var cur_time = new Date().getTime();
				this._sendMessage('${user_id}','12','${param.u}','${param.bang_id}', 'CMD_MSG_SEND', cur_time, $('#message').val());
				$('#message').val('');
			},
			sendEnter: function() {
				var cur_time = new Date().getTime();
				this._sendMessage('${user_id}','12','${param.u}','${param.bang_id}', 'CMD_ENTER', cur_time, $('#message').val());
				$('#message').val('');
			},
			receiveMessage: function(msgData) {
			
				// 정의된 CMD 코드에 따라서 분기 처리
				if(msgData.cmd == 'CMD_MSG_SEND') {	
					var msg_time = new Date(msgData.msg_date);
					var time_hour = (msg_time.getHours()>12)?"오후 "+(msg_time.getHours()-12):"오전 "+msg_time.getHours();
					
					if(msgData.send_id != cur_session) {
						$('#divChatData').append("<div class='direct-chat-msg'><div class='direct-chat-info clearfix'><span class='direct-chat-name pull-left'>"+msgData.send_id+"</span><span class='direct-chat-timestamp pull-right'>"+time_hour+" : "+msg_time.getMinutes()+"</span></div><div class='direct-chat-text'>"+msgData.msg+"</div></div>");
					}
					else {
						$('#divChatData').append("<div class='direct-chat-msg right'><div class='direct-chat-info clearfix'><span class='direct-chat-name pull-right'>"+msgData.send_id+"</span><span class='direct-chat-timestamp pull-left'>"+time_hour+" : "+msg_time.getMinutes()+"</span></div><img class='direct-chat-img' src='../dist/img/user3-128x128.jpg' alt='Message User Image'><div class='direct-chat-text'>"+msgData.msg+"</div></div>");
					}
				}
				// 입장
				else if(msgData.cmd == 'CMD_ENTER') {
					$('#divChatData').append('<div>' + msgData.msg + '</div>');
				}
				// 퇴장
				else if(msgData.cmd == 'CMD_EXIT') {					
					$('#divChatData').append('<div>' + msgData.msg + '</div>');
				}
			},
			closeMessage: function(str) {
				$('#divChatData').append('<div>' + '연결 끊김 : ' + str + '</div>');
			},
			disconnect: function() {
				this._socket.close();
			},
			_initSocket: function() {
				this._socket = new SockJS(this._url);
				this._socket.onopen = function(evt) {
					webSocket.sendEnter();
				};
				this._socket.onmessage = function(evt) {
					webSocket.receiveMessage(JSON.parse(evt.data));
				};
				this._socket.onclose = function(evt) {
					webSocket.closeMessage(JSON.parse(evt.data));
				}
			},
			_sendMessage: function(send_id, goods_no ,receive_id ,bang_id ,cmd,time ,msg) {
				var msgData = {
						send_id : send_id,
						goods_no : goods_no,
						receive_id : receive_id,
						bang_id : bang_id,
						cmd : cmd,
						msg : msg,
						time : time
				};
				var jsonData = JSON.stringify(msgData);
				this._socket.send(jsonData);
			}
		};
	</script>	
	<script type="text/javascript">
        $(window).on('load', function () {
			webSocket.init({ url: '<c:url value="/chatting" />' });	
		});
	</script>
</head>
<body>


<div class="box box-success direct-chat direct-chat-success">
<div class="box-header with-border">
<h3 class="box-title">Panda Chat</h3>
<div class="box-tools pull-right">
<span data-toggle="tooltip" title="" class="badge bg-green" data-original-title="3 New Messages">3</span>
<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
</button>
<button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="" data-widget="chat-pane-toggle" data-original-title="Contacts">
<i class="fa fa-comments"></i></button>
<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
</div>
</div>


<div class="box-body">

<div style="height:81vh;" class="direct-chat-messages">
<div id="divChatData"></div>
</div>


<div class="direct-chat-contacts">
<ul class="contacts-list">
<li>
<a href="#">
<img class="contacts-list-img" src="../dist/img/user1-128x128.jpg" alt="User Image">
<div class="contacts-list-info">
<span class="contacts-list-name">
Count Dracula
<small class="contacts-list-date pull-right">2/28/2015</small>
</span>
<span class="contacts-list-msg">How have you been? I was...</span>
</div>

</a>
 </li>

</ul>

</div>

</div>

<div class="box-footer">
<div class="input-group">
	<input type="text" id="message" size="110" class="form-control" onkeypress="if(event.keyCode==13){webSocket.sendChat();}">
<span class="input-group-btn">
	<button type="button" id="btnSend" class="btn btn-success btn-flat" onclick="webSocket.sendChat()" >채팅 전송</button>
</span>
</div>
</div>

</div>



</body>
</html>