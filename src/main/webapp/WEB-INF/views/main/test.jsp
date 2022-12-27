<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<h1>/views/test.jsp</h1>
	<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" tyconpe="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    
    <div class="col-md-3">

<div class="box box-success direct-chat direct-chat-success">
<div class="box-header with-border">
<h3 class="box-title">Direct Chat</h3>
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

<div class="direct-chat-messages">

<div class="direct-chat-msg">
<div class="direct-chat-info clearfix">
<span class="direct-chat-name pull-left">Alexander Pierce</span>
<span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
</div>

<img class="direct-chat-img" src="../dist/img/user1-128x128.jpg" alt="Message User Image">
<div class="direct-chat-text">
Is this template really for free? That's unbelievable!
</div>

</div>


<div class="direct-chat-msg right">
<div class="direct-chat-info clearfix">
<span class="direct-chat-name pull-right">Sarah Bullock</span>
<span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
</div>

<img class="direct-chat-img" src="../dist/img/user3-128x128.jpg" alt="Message User Image">
<div class="direct-chat-text">
You better believe it!
</div>

</div>

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
<form action="#" method="post">
<div class="input-group">
<input type="text" name="message" placeholder="Type Message ..." class="form-control">
<span class="input-group-btn">
<button type="submit" class="btn btn-success btn-flat">Send</button>
</span>
</div>
</form>
</div>

</div>

</div>
<%@ include file="../include/footer.jsp" %>