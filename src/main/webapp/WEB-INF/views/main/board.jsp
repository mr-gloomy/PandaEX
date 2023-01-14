<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/css.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>


	<div class="board_list_wrap">
		<h1>통합게시판</h1>
		<table class="board_list">
			<thead>
				<tr >
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회</th>
				</tr>
			</thead>

			<tbody class="board_tilte">
				<c:forEach var="vo" items="${boardList }" step="1">
					<tr>
						<td><c:choose>
								<c:when test="${vo.category.equals('notice') }">공지사항</c:when>
								<c:when test="${vo.category.equals('event') }">이벤트</c:when>
								<c:when test="${vo.category.equals('donate') }">기부문의</c:when>
							</c:choose></td>
						<td class="tit" style="	width: 400px; padding-left:110px;"><a href="/main/content?bno=${vo.bno }">${vo.title }</a></td>
						<td>${vo.writer }</td>
						<td><fmt:formatDate value="${vo.regdate }" type="date" /></td>
						<td>${vo.viewcnt }</td>
					</tr>
				</c:forEach>

			<!-- 	<tr>
					<td></td>
					<td class="tit"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr> -->
			</tbody>
		</table>
		<div class="paging">
			<c:if test="${pvo.prev }">
					<a href="/main/board?page=${pvo.startPage-1 }" class="bt">이전페이지</a>
			</c:if> 
				
			<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }"
					step="1">

					 
                
                <a href="/main/board?page=${i }" <c:out value="${i==pvo.cri.page? 'class=numon':'class=num' }" />>${i }</a>

				</c:forEach>
			
			<c:if test="${pvo.next }">
					<a href="/main/board?page=${pvo.endPage+1 }" class="bt">다음페이지</a>
			</c:if>
		</div>
	</div>




</body>
<style>

* {
	margin: 0;
	padding: 0;
}

table {
	border-collapse: collapse;
}

caption {
	display: none;
}

a {
	text-decoration: none;
	color: inherit;
}

.board_list_wrap {
	padding: 10%;
}

.board_list {
	width: 100%;
	border-top: 2px solid green;
}

.board_list tr {
	border-bottom: 1px solid #ccc;
}

.board_list th, .board_list td {
	padding: 10px;
	font-size: 14px;
}

.board_list td {
	text-align: center;
}

.board_list .tit {
	text-align: left;
}

.board_list .tit:hover {
	text-decoration: underline;
}

.board_list_wrap .paging {
	margin-top: 20px;
	text-align: center;
	font-size: 0;
}

.board_list_wrap .paging a {
	display: inline-block;
	margin-left: 10px;
	padding: 5px 10px;
	border-radius: 100px;
	font-size: 12px;
}

.board_list_wrap .paging a:first-child {
	margin-left: 0;
}

.board_list_wrap .paging a.bt {
	border: 1px solid #eee;
	background: #eee;
}

.board_list_wrap .paging a.num {
	border: 1px solid green;
	font-weight: 600;
	color: green;
}

.board_list_wrap .paging a.numon {
	background: green;
	color: #fff;
}
.board_list thead>tr>th {
	text-align:center;
}

</style>
<%@ include file="../include/footer.jsp"%>
</html>