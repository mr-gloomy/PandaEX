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
			$('.remote').css("display", "flex");
		} else {
			$('.remote').css("display", "none");
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
		$('.back-joinpage').show();
		$(".modal-join").slideDown(300);
		$('.modal-top').text("PANDA JOIN");
		$('.modal-body').css("height", "650px");
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
		$('.modal-body').css("height", "650px");
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
		navigator.geolocation.getCurrentPosition(function(position) {
//			alert("좌측상단 위치정보 허용해주세요");
			
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
						}
					});
				}	
			});
		});
		
	})
});

