/* 마이페이지 스크립트 */
$(function(){
	var s1 = $('.myp_subtab1');
	var s2 = $('.myp_subtab2');
	var s3 = $('.myp_subtab3');
	var s4 = $('.myp_subtab4');
	var s5 = $('.myp_subtab5');
	$(s1).on('click',function(){
		$(s1).addClass('myp_subtab_active');
		$(s1).css('border-bottom','0px');
		$(s2).css('border-bottom','1px solid');
		$(s3).css('border-bottom','1px solid');
		$(s4).css('border-bottom','1px solid');
		$(s5).css('border-bottom','1px solid');
		$(s2).removeClass('myp_subtab_active');
		$(s3).removeClass('myp_subtab_active');
		$(s4).removeClass('myp_subtab_active');
		$(s5).removeClass('myp_subtab_active');
	});
	$(s2).on('click',function(){
		$(s2).addClass('myp_subtab_active');
		$(s2).css('border-bottom','0px');
		$(s1).css('border-bottom','1px solid');
		$(s3).css('border-bottom','1px solid');
		$(s4).css('border-bottom','1px solid');
		$(s5).css('border-bottom','1px solid');
		$(s1).removeClass('myp_subtab_active');
		$(s3).removeClass('myp_subtab_active');
		$(s4).removeClass('myp_subtab_active');
		$(s5).removeClass('myp_subtab_active');
	});
	$(s3).on('click',function(){
		$(s3).addClass('myp_subtab_active');
		$(s3).css('border-bottom','0px');
		$(s1).css('border-bottom','1px solid');
		$(s2).css('border-bottom','1px solid');
		$(s4).css('border-bottom','1px solid');
		$(s5).css('border-bottom','1px solid');
		$(s1).removeClass('myp_subtab_active');
		$(s2).removeClass('myp_subtab_active');
		$(s4).removeClass('myp_subtab_active');
		$(s5).removeClass('myp_subtab_active');
	});
	$(s4).on('click',function(){
		$(s4).addClass('myp_subtab_active');
		$(s4).css('border-bottom','0px');
		$(s1).css('border-bottom','1px solid');
		$(s2).css('border-bottom','1px solid');
		$(s3).css('border-bottom','1px solid');
		$(s5).css('border-bottom','1px solid');
		$(s1).removeClass('myp_subtab_active');
		$(s2).removeClass('myp_subtab_active');
		$(s3).removeClass('myp_subtab_active');
		$(s5).removeClass('myp_subtab_active');
	});
	$(s5).on('click',function(){
		$(s5).addClass('myp_subtab_active');
		$(s5).css('border-bottom','0px');
		$(s1).css('border-bottom','1px solid');
		$(s2).css('border-bottom','1px solid');
		$(s3).css('border-bottom','1px solid');
		$(s4).css('border-bottom','1px solid');
		$(s1).removeClass('myp_subtab_active');
		$(s2).removeClass('myp_subtab_active');
		$(s3).removeClass('myp_subtab_active');
		$(s4).removeClass('myp_subtab_active');
	});
});
$(function(){
	var hide1 = $('.hide001');
	var hide2 = $('.hide002');
	var hide3 = $('.hide003');
	var hide4 = $('.hide004');
	var hide5 = $('.hide005');
	var hide6 = $('.hide006');
	var hide7 = $('.hide007');
	var side1 = $('.side_info');
	var side2 = $('.side_auction');
	var side3 = $('.side_modify');
	var side4 = $('.side_pointcharge');
	var side5 = $('.side_pointhistory');
	var side6 = $('.side_drop');
	var side7 = $('.side_orderlist');
	$(side1).on('click',function(){
		$(side1).addClass('mypactive');
		$(side2).removeClass('mypactive');
		$(side3).removeClass('mypactive');
		$(side4).removeClass('mypactive');
		$(side5).removeClass('mypactive');
		$(side6).removeClass('mypactive');
		$(side7).removeClass('mypactive');
		$(hide7).css('display','none');
		$(hide1).css('display','block');
		$(hide2).css('display','none');
		$(hide3).css('display','none');
		$(hide4).css('display','none');
		$(hide5).css('display','none');
		$(hide6).css('display','none');
		$('.delep').text("회원탈퇴");
		$('.deletep2').css('display','none');
		$('.deletep1').css('display','block');
		$('.user_pwmo').val("");
		$('.pwerror').text("");
		$('.user_pwmo').css('margin-bottom','25px');
	});
	$(side2).on('click',function(){
		$(side2).addClass('mypactive');
		$(side1).removeClass('mypactive');
		$(side3).removeClass('mypactive');
		$(side4).removeClass('mypactive');
		$(side5).removeClass('mypactive');
		$(side6).removeClass('mypactive');
		$(side7).removeClass('mypactive');
		$(hide7).css('display','none');
		$(hide1).css('display','none');
		$(hide2).css('display','block');
		$(hide3).css('display','none');
		$(hide4).css('display','none');
		$(hide5).css('display','none');
		$(hide6).css('display','none');
		$('.delep').text("회원탈퇴");
		$('.deletep2').css('display','none');
		$('.deletep1').css('display','block');
		$('.user_pwmo').val("");
		$('.pwerror').text("");
		$('.user_pwmo').css('margin-bottom','25px');
	});
	$(side3).on('click',function(){
		$(side3).addClass('mypactive');
		$(side1).removeClass('mypactive');
		$(side2).removeClass('mypactive');
		$(side4).removeClass('mypactive');
		$(side5).removeClass('mypactive');
		$(side6).removeClass('mypactive');
		$(side7).removeClass('mypactive');
		$(hide7).css('display','none');
		$(hide1).css('display','none');
		$(hide2).css('display','none');
		$(hide3).css('display','block');
		$(hide4).css('display','none');
		$(hide5).css('display','none');
		$(hide6).css('display','none');
		$('.delep').text("회원탈퇴");
		$('.deletep2').css('display','none');
		$('.deletep1').css('display','block');
		$('.user_pwmo').val("");
		$('.pwerror').text("");
		$('.user_pwmo').css('margin-bottom','25px');
	});
	$(side4).on('click',function(){
		$(side4).addClass('mypactive');
		$(side1).removeClass('mypactive');
		$(side2).removeClass('mypactive');
		$(side3).removeClass('mypactive');
		$(side5).removeClass('mypactive');
		$(side6).removeClass('mypactive');
		$(side7).removeClass('mypactive');
		$(hide7).css('display','none');
		$(hide1).css('display','none');
		$(hide2).css('display','none');
		$(hide4).css('display','block');
		$(hide3).css('display','none');
		$(hide5).css('display','none');
		$(hide6).css('display','none');
		$('.delep').text("회원탈퇴");
		$('.deletep2').css('display','none');
		$('.deletep1').css('display','block');
		$('.user_pwmo').val("");
		$('.pwerror').text("");
		$('.user_pwmo').css('margin-bottom','25px');
	});
	$(side5).on('click',function(){
		$(side5).addClass('mypactive');
		$(side1).removeClass('mypactive');
		$(side2).removeClass('mypactive');
		$(side3).removeClass('mypactive');
		$(side4).removeClass('mypactive');
		$(side6).removeClass('mypactive');
		$(side7).removeClass('mypactive');
		$(hide7).css('display','none');
		$(hide1).css('display','none');
		$(hide2).css('display','none');
		$(hide5).css('display','block');
		$(hide3).css('display','none');
		$(hide4).css('display','none');
		$(hide6).css('display','none');
		$('.delep').text("회원탈퇴");
		$('.deletep2').css('display','none');
		$('.deletep1').css('display','block');
		$('.user_pwmo').val("");
		$('.pwerror').text("");
		$('.user_pwmo').css('margin-bottom','25px');
	});
	$(side6).on('click',function(){
		$(side6).addClass('mypactive');
		$(side1).removeClass('mypactive');
		$(side2).removeClass('mypactive');
		$(side3).removeClass('mypactive');
		$(side4).removeClass('mypactive');
		$(side5).removeClass('mypactive');
		$(side7).removeClass('mypactive');
		$(hide7).css('display','none');
		$(hide1).css('display','none');
		$(hide2).css('display','none');
		$(hide6).css('display','block');
		$(hide4).css('display','none');
		$(hide5).css('display','none');
		$(hide3).css('display','none');
	});
	$(side7).on('click',function(){
		$(side7).addClass('mypactive');
		$(side1).removeClass('mypactive');
		$(side2).removeClass('mypactive');
		$(side3).removeClass('mypactive');
		$(side4).removeClass('mypactive');
		$(side5).removeClass('mypactive');
		$(side6).removeClass('mypactive');
		$('.delep').text("회원탈퇴");
		$('.deletep2').css('display','none');
		$('.deletep1').css('display','block');
		$('.user_pwmo').val("");
		$('.pwerror').text("");
		$('.user_pwmo').css('margin-bottom','25px');
		$(hide1).css('display','none');
		$(hide2).css('display','none');
		$(hide3).css('display','none');
		$(hide7).css('display','block');
		$(hide4).css('display','none');
		$(hide5).css('display','none');
		$(hide6).css('display','none');
	});

	$('.info-modify').on('click',function(){
		if($('#myppw').val() != $('.user_pwchk').val()){
			$('.user_pwchk').focus();
			$('.pwerr').css('opacity','1');
		} else {
			$("#modimodi").submit();
		}
	});
	$('#namemo').on("keyup", function() {
		   $(this).val($(this).val().replace(/[^ㄱ-힣]/g, ''));
	});
	$('#mypnick').on("keyup",function() {
        $(this).val($(this).val().replace(/[^a-zA-Z0-9ㄱ-힣]/g, ''));
	});
	$(document).on("keyup","#myptel",function() { 
		   $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		});
	

	$('.sibals').on("click", function() {
		$.ajax({
			type : "GET",
			url : "/myp/ckpw",
			data : {user_pw : $(".user_pwmo").val(),
				user_id:$('.pwcksd').val()},
				contentType:"application/json; charset:UTF-8",
			success : function(data) {
				if (data == "OK") {		
					$('.deletep2').css('display','block');
					$('.deletep1').css('display','none');
					$('.delep').text("정말 탈퇴하시겠습니까?");
				} else {
					$('.user_pwmo').focus();
					$('.user_pwmo').css('margin-bottom','0px');
					$('.pwerror').text("패스워드가 일치하지 않습니다.");
					$('.pwerror').css('color','red');
				}
			}
		});
		
	});

	$('.delebtn').on('click',function(){
		alert("탈퇴가 완료되었습니다.");
	});
});
