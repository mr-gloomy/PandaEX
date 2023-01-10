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