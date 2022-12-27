(function($) {
	"use strict";

	/*
	 * [ Load page ] ===========================================================
	 */
	$(".animsition").animsition({
		inClass : 'fade-in',
		outClass : 'fade-out',
		inDuration : 1500,
		outDuration : 800,
		linkElement : '.animsition-link',
		loading : true,
		loadingParentElement : 'html',
		loadingClass : 'animsition-loading-1',
		loadingInner : '<div class="loader05"></div>',
		timeout : false,
		timeoutCountdown : 5000,
		onLoadEvent : true,
		browser : [ 'animation-duration', '-webkit-animation-duration' ],
		overlay : false,
		overlayClass : 'animsition-overlay-slide',
		overlayParentElement : 'html',
		transition : function(url) {
			window.location.href = url;
		}
	});

	/*
	 * [ Back to top ]
	 * ===========================================================
	 */
	var windowH = $(window).height() / 2;

	$(window).on('scroll', function() {
		if ($(this).scrollTop() > windowH) {
			$("#myBtn").css('display', 'flex');
		} else {
			$("#myBtn").css('display', 'none');
		}
	});

	$('#myBtn').on("click", function() {
		$('html, body').animate({
			scrollTop : 0
		}, 300);
	});

	/* 우측 리모트 생성 제어 */
	$(window).scroll(function() {
		var top = $(window).scrollTop();

		if (top >= 620) {
			$('.remote').css("opacity", "1");
			$('.remote').css("transition", "1.5s");
		} else {
			$('.remote').css("opacity", "0");
			$('.remote').css("transition", "1.5s");
		}
	});

	/*
	 * ================================================================== [
	 * Fixed Header ]
	 */
	var headerDesktop = $('.container-menu-desktop');
	var wrapMenu = $('.wrap-menu-desktop');

	if ($('.top-bar').length > 0) {
		var posWrapHeader = $('.top-bar').height();
	} else {
		var posWrapHeader = 0;
	}

	if ($(window).scrollTop() > posWrapHeader) {
		$(headerDesktop).addClass('fix-menu-desktop');
		$(wrapMenu).css('top', 0);
	} else {
		$(headerDesktop).removeClass('fix-menu-desktop');
		$(wrapMenu).css('top', posWrapHeader - $(this).scrollTop());
	}

	$(window).on('scroll', function() {
		if ($(this).scrollTop() > posWrapHeader) {
			$(headerDesktop).addClass('fix-menu-desktop');
			$(wrapMenu).css('top', 0);
		} else {
			$(headerDesktop).removeClass('fix-menu-desktop');
			$(wrapMenu).css('top', posWrapHeader - $(this).scrollTop());
		}
	});

	/*
	 * ================================================================== [ Menu
	 * mobile ]
	 */
	$('.btn-show-menu-mobile').on('click', function() {
		$(this).toggleClass('is-active');
		$('.menu-mobile').slideToggle();
	});

	var arrowMainMenu = $('.arrow-main-menu-m');

	for (var i = 0; i < arrowMainMenu.length; i++) {
		$(arrowMainMenu[i]).on('click', function() {
			$(this).parent().find('.sub-menu-m').slideToggle();
			$(this).toggleClass('turn-arrow-main-menu-m');
		})
	}

	$(window).resize(function() {
		if ($(window).width() >= 992) {
			if ($('.menu-mobile').css('display') == 'block') {
				$('.menu-mobile').css('display', 'none');
				$('.btn-show-menu-mobile').toggleClass('is-active');
			}

			$('.sub-menu-m').each(function() {
				if ($(this).css('display') == 'block') {
					console.log('hello');
					$(this).css('display', 'none');
					$(arrowMainMenu).removeClass('turn-arrow-main-menu-m');
				}
			});

		}
	});

	/*
	 * ================================================================== [ Show /
	 * hide modal search ]
	 */
	// $('.js-show-modal-search').on('click', function(){
	// $('.modal-search-header').addClass('show-modal-search');
	// $(this).css('opacity','0');
	// });
	//
	// $('.js-hide-modal-search').on('click', function(){
	// $('.modal-search-header').removeClass('show-modal-search');
	// $('.js-show-modal-search').css('opacity','1');
	// });
	//
	// $('.container-search-header').on('click', function(e){
	// e.stopPropagation();
	// });
	/*
	 * ================================================================== [
	 * Isotope ]
	 */
	var $topeContainer = $('.isotope-grid');
	var $filter = $('.filter-tope-group');

	// filter items on button click
	$filter.each(function() {
		$filter.on('click', 'button', function() {
			var filterValue = $(this).attr('data-filter');
			$topeContainer.isotope({
				filter : filterValue
			});
		});

	});

	// init Isotope
	$(window).on('load', function() {
		var $grid = $topeContainer.each(function() {
			$(this).isotope({
				itemSelector : '.isotope-item',
				layoutMode : 'fitRows',
				percentPosition : true,
				animationEngine : 'best-available',
				masonry : {
					columnWidth : '.isotope-item'
				}
			});
		});
	});

	var isotopeButton = $('.filter-tope-group button');

	$(isotopeButton).each(function() {
		$(this).on('click', function() {
			for (var i = 0; i < isotopeButton.length; i++) {
				$(isotopeButton[i]).removeClass('how-active1');
			}

			$(this).addClass('how-active1');
		});
	});

	/*
	 * ================================================================== [
	 * Filter / Search product ]
	 */
	$('.js-show-filter').on('click', function() {
		$(this).toggleClass('show-filter');
		$('.panel-filter').slideToggle(400);

		if ($('.js-show-search').hasClass('show-search')) {
			$('.js-show-search').removeClass('show-search');
			$('.panel-search').slideUp(400);
		}
	});

	$('.js-show-search').on('click', function() {
		$(this).toggleClass('show-search');
		$('.panel-search').slideToggle(400);

		if ($('.js-show-filter').hasClass('show-filter')) {
			$('.js-show-filter').removeClass('show-filter');
			$('.panel-filter').slideUp(400);
		}
	});

	/*
	 * ================================================================== [ Cart ]
	 */
	$('.js-show-cart').on('click', function() {
		$('.js-panel-cart').addClass('show-header-cart');
	});

	$('.js-hide-cart').on('click', function() {
		$('.js-panel-cart').removeClass('show-header-cart');
	});

	/*
	 * ================================================================== [ Cart ]
	 */
	$('.js-show-sidebar').on('click', function() {
		$('.js-sidebar').addClass('show-sidebar');
	});

	$('.js-hide-sidebar').on('click', function() {
		$('.js-sidebar').removeClass('show-sidebar');
	});

	/*
	 * ================================================================== [ +/-
	 * num product ]
	 */
	$('.btn-num-product-down').on('click', function() {
		var numProduct = Number($(this).next().val());
		if (numProduct > 0)
			$(this).next().val(numProduct - 1);
	});

	$('.btn-num-product-up').on('click', function() {
		var numProduct = Number($(this).prev().val());
		$(this).prev().val(numProduct + 1);
	});

	/*
	 * ================================================================== [
	 * Rating ]
	 */
	$('.wrap-rating').each(function() {
		var item = $(this).find('.item-rating');
		var rated = -1;
		var input = $(this).find('input');
		$(input).val(0);

		$(item).on('mouseenter', function() {
			var index = item.index(this);
			var i = 0;
			for (i = 0; i <= index; i++) {
				$(item[i]).removeClass('zmdi-star-outline');
				$(item[i]).addClass('zmdi-star');
			}

			for (var j = i; j < item.length; j++) {
				$(item[j]).addClass('zmdi-star-outline');
				$(item[j]).removeClass('zmdi-star');
			}
		});

		$(item).on('click', function() {
			var index = item.index(this);
			rated = index;
			$(input).val(index + 1);
		});

		$(this).on('mouseleave', function() {
			var i = 0;
			for (i = 0; i <= rated; i++) {
				$(item[i]).removeClass('zmdi-star-outline');
				$(item[i]).addClass('zmdi-star');
			}

			for (var j = i; j < item.length; j++) {
				$(item[j]).addClass('zmdi-star-outline');
				$(item[j]).removeClass('zmdi-star');
			}
		});
	});

	/*
	 * ================================================================== [ Show
	 * modal1 ]
	 */
	$('.js-show-modal1').on('click', function(e) {
		e.preventDefault();
		$('.js-modal1').addClass('show-modal1');
	});

	$('.js-hide-modal1').on('click', function() {
		$('.js-modal1').removeClass('show-modal1');
	});

	/* 유저 hover 창 */
	var user = $('.panda-header-user');
	$(user).on('click', function() {

	});

	/* 채팅봇 */
	var bot = $('.chat-bot');
	$(bot).on('click', function() {
		ht.open();
	});
	/* 로그인 모달창 제어 */
	$('.usermodal').click(function() {
		$('html').css({
			'overflow' : 'hidden'
		});
		$(".login-modal").css("display", "flex");
		$(".back-joinpage").hide();
		$(".modal-join").hide();
		$('.modal-text').fadeIn();
		$('.login-submit').fadeIn();
		$('.find').fadeIn();
		$('.join').fadeIn();
		$('.social-login').fadeIn();
		$('.kakaologin').fadeIn();
		$('.modal-top').text("PANDA LOGIN");
		$('.modal-body').css("height", "500px");
		event.preventDefault();
		event.stopPropagation();
		return false;
	});
	$('.modalhide').on('click', function() {
		$('.login-modal').css("display", "none");
		$('#element').off('scroll touchmove mousewheel');
		$('html').css({
			'overflow' : 'visible'
		});
		$('.modal-body').css("height", "500px");
	});

})(jQuery);
/* 로그인창 캡스락 알림 */
function chkCapsLock(event) {
	if (event.getModifierState("CapsLock")) {
		document.getElementById("capslock").innerText = "Caps Lock이 켜져 있습니다."
	} else {
		document.getElementById("capslock").innerText = ""
	}
}

function chkCapsLock1(event) {
	document.getElementById("capslock").innerText = ""
}
/* 로그인창 패스워드 보기/안보기 */
$(document).ready(function() {
	$(".pw_show").change(function() {

		if ($(this).is(':checked')) {
			$(".pass").attr("type", "text");
		} else {
			$(".pass").attr("type", "password");
		}
	});
});
/* 로그인창 한글 제어 */
$(function() {
	$('.id').on("blur keyup", function() {
		$(this).val($(this).val().replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, ''));
	});
})
$(function() {
	$('.pass').on("blur keyup", function() {
		$(this).val($(this).val().replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, ''));
	});
})

/* 로그인창 아이디저장 쿠키 */

$(".id").val(Cookies.get('key'));
if ($(".id").val() != "") {
	$(".id_save").attr("checked", true);
}

$(".id_save").change(function() {
	if ($(".id_save").is(":checked")) {
		Cookies.set('key', $(".id").val(), {
			expires : 365
		});
	} else {
		Cookies.remove('key');
	}
});
$(".id").keyup(function() {
	if ($(".id_save").is(":checked")) {
		Cookies.set('key', $(".id").val(), {
			expires : 365
		});
	} else {
		Cookies.remove('key');
	}
});

$(".id_save").keyup(function() {
	if ($(".id_save").is(":checked")) {
		Cookies.set('key', $(".id").val(), {
			expires : 365
		});
	}
});

/* 로그인창 각종 효과 및 기능 */
/* value 값 초기화버튼 리셋이벤트는 쿠키값저장과 충돌문제로 주석처리 */
// var idinput = $(".id").val('')
// var pwinput = $(".pass").val('');
$(".id").on('focus', function() {
	$(".id").css("opacity", "1");
});

// $("#idreset").on('click',function(){
// $(".id").css("opacity", "1");
// $("#idreset").css("display","none");
// $(idinput).val('');
// $(".id").focus();
// });
$(".id").on('blur', function() {
	$(".id").css("opacity", "0.7");
});

$(".pass").on('focus', function() {
	$(".pass").css("opacity", "1");
});

// $("#pwreset").on('click',function(){
// $(".pass").css("opacity", "1");
// $("#pwreset").css("display","none");
// $(pwinput).val('');
// $(".pass").focus();
// });
$(".pass").on('blur', function() {
	$(".pass").css("opacity", "0.7");
});
// $(function(){
// $(".id").keyup(function(){
// if($(idinput != null)){
// $("#idreset").css("display","block");
// }
// });
// });
// $(function(){
// $(".pass").keyup(function(){
// if($(idinput != null)){
// $("#pwreset").css("display","block");
// }
// });
// });

/* 모달창 회원가입 */
$(function() {
	$('#onclick-join').on("click", function() {
		$('.modal-text').fadeOut();
		$('.login-submit').fadeOut();
		$('.find').fadeOut();
		$('.join').fadeOut();
		$('.social-login').fadeOut();
		$('.kakaologin').fadeOut();
		$('.back-joinpage').fadeIn();
		$(".modal-join").slideDown(300);
		$('.modal-top').text("PANDA JOIN");
		$('.modal-body').css("height", "770px");
	});
})
$(function() {
	$('.back-joinpage').on("click", function() {
		$('.modal-text').fadeIn();
		$('.login-submit').fadeIn();
		$('.find').fadeIn();
		$('.join').fadeIn();
		$('.social-login').fadeIn();
		$('.kakaologin').fadeIn();
		$('.back-joinpage').fadeOut();
		$(".modal-join").slideUp(300);
		$('.modal-top').text("PANDA LOGIN");
		$('.modal-body').css("height", "500px");
	});
})
$(function() {
	$('#user-join').on('click',function() {
		$('html').css('overflow', 'hidden');
		$(".login-modal").css("display", "flex");
		$('.modal-top').text("PANDA JOIN");
		$('.modal-join').fadeIn();
		$('.join-text').fadeIn();
		$('.back-joinpage').fadeIn();
		$('.modal-body').css("height", "770px");
		$('.modal-text').fadeOut();
		$('.login-submit').fadeOut();
		$('.find').fadeOut();
		$('.join').fadeout();
		$('.social-login').fadeOut();
		$('.kakaologin').fadeOut();
	});
});

/* 우리동네(gps값 기준) 조회 */
$(function() {
	$('#findlocation').on('click', function() {
		// 참고하세요~
		// watchPosition() : 최초 위치조회 후 실시간 추적(wgs84좌표)
		// getCurrentPosition() : 최초에 한해 위치 추적(wgs84좌표)
		navigator.geolocation.getCurrentPosition(function(position) {
			var error = "위치정보 조회실패";
			var error2 = "위치정보 조회를 동의 후 재시도해주세요";
			var succe = "위치조회가 완료되었습니다.";
			var userlat = position.coords.latitude;
			var userlong = position.coords.longitude;
			var href = window.location.href;
			var userlocation = {
					"userlat" : userlat,
					"userlong" : userlong
			};
			$.ajax({
				type : "get",
				url : href,
				data : userlocation,
				async:false,
				success : function(data) {
					$.ajax({
						type : 'get',
						url : "https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x="+userlong+"&y="+userlat,
						headers: {
		                    Authorization: "KakaoAK 02cf39cd2fef571915d16c04ab4e60f7"
		                },
		                datatype : 'json',
		                async:false,
						success : function(data){		
							var address = JSON.stringify(data);
							var addp = JSON.parse(address);
							var si = addp.documents[0].region_1depth_name;
							var gu = addp.documents[0].region_2depth_name;
							$('#si').attr('value',si);
							$('#gu').attr('value',gu);
//	성공					if($('#si').val() != "" ){
							if($('#si').val() != "" ){
							$('#si').css('border','2px solid rgb(105 155 105)');
							$('#gu').css('border','2px solid rgb(105 155 105)');
							$('.locationfind-false').text(succe);
							$('.locationfind-false').css('color','rgb(105 155 105)');
							} else {
								$('#si').attr('value',error);
								$('#gu').attr('value',error);
								$('#si').css('border','2px solid rgb(255 50 50)');
								$('#gu').css('border','2px solid rgb(255 50 50)');
								$('.locationfind-false').text(error2);
								window.open('https://support.google.com/chrome/answer/142065?hl=ko&co=GENIE.Platform%3DDesktop','_blank','height=600,width=500');							
							}
						}
					});
				}	
			});
		});
		
	})
});
/* 전화번호 자동 하이픈 생성 */
$(document).on("keyup",".telephone",function() { 
	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
});
/* 전화번호 앞자리 유효성 검사 */
	$('.telephone').on('keyup', function() {
		var tellength = $('.telephone').val().length;
		var telval = $('.telephone').val();
		var phonetel = telval.split("-", 1);
//		var phonetelchk_array = ['010', '011', '016', '017', '019'];
//		var chksuccess = phonetelchk_array.find(val => (val != phonetel));
		if (tellength > 11){
		if (phonetel == '010' || phonetel == '011') {
			$('.teltooltip').text("전화번호가 유효합니다.(쿼리에서비교는 추후추가)");
			$('#user-tel-join').css('border','2px solid rgb(105 155 105)');
			$('.teltooltip').css("color", "rgb(105 155 105)");
		} else if(phonetel == '016' || phonetel == '017') {
			$('.teltooltip').text("전화번호가 유효합니다.(쿼리에서비교는 추후추가)");
			$('#user-tel-join').css('border','2px solid rgb(105 155 105)');
			$('.teltooltip').css("color", "rgb(105 155 105)");
		} else if(phonetel == '019') {
			$('.teltooltip').text("전화번호가 유효합니다.(쿼리에서비교는 추후추가)");
			$('.teltooltip').css("color", "rgb(105 155 105)");
			$('#user-tel-join').css('border','2px solid rgb(105 155 105)');
		} else {
			$('.teltooltip').text("전화번호 앞자리가 유효하지 않습니다..");
			$('.teltooltip').css("color", "red");
			$('#user-tel-join').css('border','2px solid rgb(255 50 50)');
		}
	} else{
		$('.teltooltip').text("전화번호가 유효하지 않습니다..");
		$('.teltooltip').css("color", "red");
		$('#user-tel-join').css('border','2px solid rgb(255 50 50)');
	}
});



/* 닉네임 유효성 체크 */
$('#user-nick-join').on(
		"keyup",
		function() {
			$(this).val($(this).val().replace(/[^a-zA-Z0-9ㄱ-힣]/g, ''));
			if ($('#user-nick-join').val() != null
					&& $('#user-nick-join').val().length < 3) {
				$('.nicktooltip').css("color", "red");
				$('.nicktooltip').text("사용불가능한 닉네임입니다.");
				$('#user-nick-join').css('border','2px solid rgb(255 50 50)');
			} else if ($('#user-nick-join').val() != null
					&& $('#user-nick-join').val().length >= 3) {
		 		$('.nicktooltip').css("color", "rgb(105 155 105)");
				$('.nicktooltip').text("사용가능한 닉네임입니다.(쿼리에서비교는 추후추가)");
				$('#user-nick-join').css('border','2px solid rgb(105 155 105)');
			}
		});
/* 이름 유효성 체크 */
$('#user-name-join').on("keyup", function() {
	$(this).val($(this).val().replace(/[^ㄱ-힣]/g, ''));
	for (var i = 0; i < $('#user-name-join').val().length; i++) {
		var namechk = $('#user-name-join').val().substring(i, i + 1);
		if (namechk.match(/([^가-힣\x20])/i)) {
			$('.nametooltip').css("color", "red");
			$('.nametooltip').text("사용불가능한 이름입니다.");
			$('#user-name-join').css('border','2px solid rgb(255 50 50)');
			return;
		}
		if ($('#user-name-join').val().length < 2) {
			$('.nametooltip').css("color", "red");
			$('.nametooltip').text("사용불가능한 이름입니다.");
			$('#user-name-join').css('border','2px solid rgb(255 50 50)');
			return;
		} else {
			$('.nametooltip').css("color", "rgb(105 155 105)");
			$('.nametooltip').text("멋진 이름이네요!");
			$('#user-name-join').css('border','2px solid rgb(105 155 105)');
		}
	}
});
/* 비밀번호 유효성 체크 / 안전도 검사 */
var 졸림 = "일어나서할게요~";


/* 회원가입 아이디/패스워드 특수문자,영어,스페이스바 등 입력제어 */
$(function() {
	$('#user-id-join').on("blur keyup", function() {
		$(this).val($(this).val().replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, ''));
		$(this).val($(this).val().replace(/[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi, ''));
	});
})
$(function() {
	$('#user-pw-join').on("blur keyup", function() {
		$(this).val($(this).val().replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, ''));
		$(this).val($(this).val().replace(" ", ''));
	});
})
/* 판다 서비스 이용 약관 동의여부 체크 */
$("#service-chk").change(function() {
	if ($("#service-chk").is(":checked")) {
		$('#service-chk-val').attr('value', '1');
	} else {
		$('#service-chk-val').attr('value','0');
	}
});
/* 개인 정보 광고 활용 동의(선택) 약관 동의여부 체크 */
$("#advertising-chk").change(function() {
	if ($("#advertising-chk").is(":checked")) {
		$('#advertising-chk-val').attr('value', '1');
	} else {
		$('#advertising-chk-val').attr('value', '0');
	}
});

