/* 채팅방 전용 자바스크립트 */

// 창 끄기 켜기 제어
$(function(){
	$('.off').on('click',function(){
		$('.chat').css('display','none');
		$('.menu-name').text("채팅");
		$('.option-list').fadeOut(400);
	})
	$('.panda-header-chaticon-hover').on('click',function(){
		$('.chat').css('display','flex');
		$('.chat-list').fadeIn(400);
		$('.option-list').fadeOut(10);
	})
	$('.panda-header-chaticon').on('click',function(){
		$('.chat').css('display','flex');
		$('.chat').delay(100).slideDown(400);
		$('.chat-list').fadeIn(400);
		$('.option-list').fadeOut(100);
	})
	$('.chatting').on('click',function(){
		$('.menu-name').text("채팅");
		$('.chat-list').delay(400).fadeIn(400);
		$('.option-list').fadeOut(400);
	})
	$('.option').on('click',function(){
		$('.menu-name').text("사용자 설정");
		$('.option-list').delay(400).fadeIn(400);
		$('.chat-list').fadeOut(400);
	})
	$('.addv').on('click',function(){
	 window.open('https://itwillbs.co.kr/','_blank','height=600,width=500');
	});
	
});
// 커스텀 설정기능
$(function(){
	$('.bluegreen').on('click',function(){
		$('.chat').css("background-image","linear-gradient(135deg, #040d5c 0%, #02aa0d 100%)");
		$('.chat-footer').css("background","none");
	});
	$('.orangered').on('click',function(){
		$('.chat').css("background-image","linear-gradient(135deg, #370942 0%, #ed6605 100%)");
		$('.chat-footer').css("background","none");
	});
	$('.blueberry').on('click',function(){
		$('.chat').css("background-image","linear-gradient(135deg, #009fff 0%, #ec2f4b 100%)");
		$('.chat-footer').css("background","none");
	});
	$('.Lavender').on('click',function(){
		$('.chat').css("background-image","linear-gradient(135deg, #fa98f7 0%, #076387 100%)");
		$('.chat-footer').css("background","none");
	});
	$('.blacksimple').on('click',function(){
		$('.chat').css("background-image","linear-gradient(to bottom, #423a3a, #bdbdb6)");
		$('.chat-footer').css("background","#605f5f");
	});
	
	
});

//$( 'p' ).slideUp( 200 ).delay( 2000 ).slideDown( 200 );

// 채팅창 제어
$(function(){
	$('#chatOpen').on('click',function(){
		
		var id = $('#idVal').val();
		
		$.ajax({
			url:'/chat/getRooms/'+id,
			type:'get',
			contentType:"application/json; charset:UTF-8",
			success:function(data) {
				$(".chat-position").empty();
				$(data).each(function(index,item) {
					var date = new Date(item.msg_date);
					var month = date.getMonth()+1;
					var msg = JSON.parse(item.message);
					$(".chat-position").append("<a onclick='window.open('')'><div class='yes-chatroom'><c:choose><c:when test='${oppenent == '' }'>"
								+"<img class='opponent-img src='/resources/images/icons/man.png'></c:when><c:when test='${oppenent != '' }'>"
								+"<img class='opponent-img' src='${oppenent }'></c:when></c:choose><div class='nameandtext'><div class='oppname'>"+item.receive_id+"</div>"						
								+"<div class='text'>"+msg.msg+"</div><div class='timeposition'>"
								+"<div class='lasttime'>"+month+"."+date.getDate()+"</div></div></div></div></a>");
				});
			}
		});
	});
});
