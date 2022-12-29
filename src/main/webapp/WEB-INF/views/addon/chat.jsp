<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/js/chat.js"></script>

<div class="chat">
	<div class="chat-body">
		<div class="chat-top">
			<div class="chat-clock"></div>
			<p class="chat-name">Panda Chat</p>
			<img src="/resources/images/icons/signal.png" class="signal"> <img
				src="/resources/images/icons/wi-fi.png" class="wi-fi">
		</div>
		<div class="chat-menu">
			<img src="/resources/images/icons/chatting.png" class="chatting">
			<img src="/resources/images/icons/option.png" class="option">
		</div>
		<div class="menu-name">채팅</div>
		<div class="addv1">
			<p class="addt">AD</p>
			<img src="https://itwillbs.co.kr/css/wvtex/img/wvUser/busan/logo.png"
				class="addv">
		</div>


		<!--@@@@@@@@직접 반복문으로 값넣는 부분@@@@@@@-->



		<!-- 임시변수 -->
		<c:set var="chatroom" value="1" /> <%-- 채팅룸 존재여부 확인입니다 --%>
<!--	<c:set var="chatroom" value="0" /> -->
		<%-- value=""  << 채팅방없을때 화면 표시 확인해보세요 밸류값 비워야함 --%>
		<%-- value="1"  << 채팅방있을때 화면 표시 확인해보세요 --%>
											
		<c:set var="oppenent" value='' />
		<c:set var="oppenentname" value="김태홍"/>
		<c:set var="lasttextsample1" value="이거살려고하는데요"/>
		<c:set var="lasttextsample2" value="네고괜찮은가요..?"/>
		<%--임시날짜변수임 --%>
		<c:set var="today" value="<%=new Date()%>" />
		<c:set var="yesterday" value="<%=new Date(new Date().getTime() - 60 * 60 * 24 * 1000 * 1)%>" />
		<fmt:formatDate var="last" pattern="a HH:mm" value="${today }" />
		<c:set var="lasttime" value="${last }"/>		
		<%--임시날짜변수임 --%>
		<!-- 임시변수 -->



		<!-- 채팅방 리스트보기 -->
		<div class="chat-list">
			<%-- 채팅방 없을 때 기본상태입니다. --%>
			<c:if test="${chatroom == '' }">
				<img src="/resources/images/icons/no-chat.png" class="nochat">
				<div class="no-chatroom">대화중인 채팅방이 없습니다.</div>
			</c:if>
			<%-- 채팅방 없을 때 기본상태입니다. --%>


			<div class="chat-position">
			<%--채팅방 존재할 경우 시작 --%>
				<c:if test="${chatroom != '' }">
					<%-- 	반복문 임시 주석처리 나중에 올바르게 로직짜시면 됍니다~ --%>

					<%-- 					<c:forEach var="i" items="${chatroom }" begin="0" --%>
					<%-- 						end="${chatroom.size() }" step="1"> --%>

					<%--!!!!!여기가 채팅방 한세트입니다.!!!!! --%>
					<%--// 첫번째 게시글 id값은 펑션제어이고 ajax이용 화면 불러오기로 나중에 설정해주세요 --%>
					<%--// 첫번째 게시글 펑션제어는 맨밑에 스크립트안에 있으니 삭제하시면 됍니다. --%>
					<div class="yes-chatroom" memo="채팅방 세트시작">
					<%-- 상대방 이미지 존재여부 --%>
						<c:choose>
							<c:when test="${oppenent == '' }">
								<img class="opponent-img"
									src="/resources/images/icons/opponent.png"
									memo="대화상대 프로필사진 없거나/구현귀찮을때.">
							</c:when>
							<c:when test="${oppenent != '' }">
							<img class="opponent-img"
									src="${oppenent }"
									memo="대화상대 프로필사진가져오기 구현성공 시.">
							</c:when>
						</c:choose>
						<%-- 상대방 이미지 존재여부 --%>
						
						<div class="nameandtext"> <%--위치조정 div --%>
						<%--대화중인 상대이름 칸 --%>  
							<div class="oppname">${oppenentname }</div>
							
						<%--마지막으로 남긴말 --%>  
							<div class="text">${lasttextsample1 }</div>
							
							<div class="timeposition"><%--위치조정 div --%>
						<%-- 최종대화시간 --%>
							<div class="lasttime">${lasttime }</div>
							</div><%--위치조정 div --%>
						</div><%--위치조정 div --%>
					</div memo="채팅방 세트끝 주석제거하고 정리하세요">
					<%--!!!!!여기가 채팅방 한세트입니다.!!!!!  --%>
					<%-- 					</c:forEach> --%>
					
					
					<!-- 예제샘플입니다 삭제하셔도 상관없어요 -->
					<div class="yes-chatroom" memo="예제샘플1 시작">
						<c:choose>
							<c:when test="${oppenent == '' }">
								<img class="opponent-img"
									src="/resources/images/icons/man.png"
									memo="대화상대 프로필사진 없거나/구현귀찮을때.">
							</c:when>
							<c:when test="${oppenent != '' }">
							<img class="opponent-img"
									src="${oppenent }"
									memo="대화상대 프로필사진가져오기 구현성공 시.">
							</c:when>
						</c:choose>
						<div class="nameandtext">
							<div class="oppname">정영진</div>							
							<div class="text">저기근데 당근마켓에는 이거 5만원에 올라왔던데 왜 여기는 10만원에 파는건가요?</div>
							<div class="timeposition">
							<div class="lasttime">오전 07:50</div>
							</div>
						</div>
					</div memo="예제샘플1 끝">
					<div class="yes-chatroom" memo="예제샘플2 시작">
						<c:choose>
							<c:when test="${oppenent == '' }">
								<img class="opponent-img"
									src="/resources/images/icons/girl.png"
									memo="대화상대 프로필사진 없거나/구현귀찮을때.">
							</c:when>
							<c:when test="${oppenent != '' }">
							<img class="opponent-img"
									src="${oppenent }"
									memo="대화상대 프로필사진가져오기 구현성공 시.">
							</c:when>
						</c:choose>
						<div class="nameandtext">
							<div class="oppname">정지원</div>							
							<div class="text">사기꾼 신고할겠습니다. 답장하지마세요.</div>
							<div class="timeposition">
							<div class="lasttime">오후 12:20</div>
							</div>
						</div>
					</div memo="예제샘플2 끝">
					<div class="yes-chatroom" memo="예제샘플3 시작">
						<c:choose>
							<c:when test="${oppenent == '' }">
								<img class="opponent-img"
									src="/resources/images/icons/panda-user.png"
									memo="대화상대 프로필사진 없거나/구현귀찮을때.">
							</c:when>
							<c:when test="${oppenent != '' }">
							<img class="opponent-img"
									src="${oppenent }"
									memo="대화상대 프로필사진가져오기 구현성공 시.">
							</c:when>
						</c:choose>
						<div class="nameandtext">
							<div class="oppname">정규태</div>							
							<div class="text">지환씨~ 모델 쩜 어트리뷰트 쩜. 호출!</div>
							<div class="timeposition">
							<div class="lasttime">어제</div>
							</div>
						</div>
					</div memo="예제샘플3 끝">
					<div class="yes-chatroom" memo="예제샘플4 시작">
						<c:choose>
							<c:when test="${oppenent == '' }">
								<img class="opponent-img"
									src="/resources/images/icons/man1.png"
									memo="대화상대 프로필사진 없거나/구현귀찮을때.">
							</c:when>
							<c:when test="${oppenent != '' }">
							<img class="opponent-img"
									src="${oppenent }"
									memo="대화상대 프로필사진가져오기 구현성공 시.">
							</c:when>
						</c:choose>
						<div class="nameandtext">
							<div class="oppname">mumallaengi muchim</div>							
							<div class="text">Hello, nego ga nuong?</div>
							<div class="timeposition">
							<div class="lasttime">2일 전</div>
							</div>
						</div>
					</div memo="예제샘플4 끝">
					<div class="yes-chatroom" memo="예제샘플5 시작">
						<c:choose>
							<c:when test="${oppenent == '' }">
								<img class="opponent-img"
									src="/resources/images/icons/halbae.png"
									memo="대화상대 프로필사진 없거나/구현귀찮을때.">
							</c:when>
							<c:when test="${oppenent != '' }">
							<img class="opponent-img"
									src="${oppenent }"
									memo="대화상대 프로필사진가져오기 구현성공 시.">
							</c:when>
						</c:choose>
						<div class="nameandtext">
							<div class="oppname">최춘갑</div>							
							<div class="text">우리손주가..갖고싶어하는데 네고를..어찌..좀</div>
							<div class="timeposition">
							<div class="lasttime">2일 전</div>
							</div>
						</div>
					</div memo="예제샘플5 끝">
					<div class="yes-chatroom" memo="예제샘플6 시작">
						<c:choose>
							<c:when test="${oppenent == '' }">
								<img class="opponent-img"
									src="/resources/images/icons/girl12.png"
									memo="대화상대 프로필사진 없거나/구현귀찮을때.">
							</c:when>
							<c:when test="${oppenent != '' }">
							<img class="opponent-img"
									src="${oppenent }"
									memo="대화상대 프로필사진가져오기 구현성공 시.">
							</c:when>
						</c:choose>
						<div class="nameandtext">
							<div class="oppname">최송이</div>							
							<div class="text">아니요 오늘은 각코 할게요 ㅅㄱ~</div>
							<div class="timeposition">
							<div class="lasttime">3일전</div>
							</div>
						</div>
					</div memo="예제샘플6 끝">
					
					
					
					
				</c:if>
			</div>
			<!-- 반복문 돌려서 넣으시면 됍니다. 예제샘플 몇개 만들게요 -->

		</div>
		<div class="option-list">
			<div class="backsel">백그라운드 색상 변경</div>
			<div class="background">
				<div class="bluegreen">블루그린</div>
				<div class="blueberry">블루베리</div>
				<div class="orangered">오렌지레드</div>
				<div class="Lavender">라벤더</div>
				<div class="blacksimple">블랙심플</div>
			
			</div>
		</div>

		<!--@@@@@@@@직접 반복문으로 값넣는 부분@@@@@@@-->




	</div>
	<div class="chat-footer">
		<img src="/resources/images/icons/off1.png" class="off">
		<div class="off1"></div>
	</div>


</div>





<script>
	// 좌측상단 시간:분 실시간 업데이트
	var clockt = $('.chat-clock');
	$(function() {

		function clock() {
			const date = new Date();
			const h = date.getHours().toString().padStart(2, '0');
			const min = date.getMinutes().toString().padStart(2, '0');
			$(clockt).text(h + ':' + min);
		}

		function init() {
			clock();
			setInterval(clock, 1000);
		}
		init();
	});
</script>


