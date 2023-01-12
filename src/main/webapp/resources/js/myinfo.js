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
	var side1 = $('.side_info');
	var side2 = $('.side_auction');
	var side3 = $('.side_modify');
	var side4 = $('.side_pointcharge');
	var side5 = $('.side_pointhistory');
	var side6 = $('.side_drop');
	$(side1).on('click',function(){
		$(side1).addClass('mypactive');
		$(side2).removeClass('mypactive');
		$(side3).removeClass('mypactive');
		$(side4).removeClass('mypactive');
		$(side5).removeClass('mypactive');
		$(side6).removeClass('mypactive');
		$(hide1).css('display','block');
		$(hide2).css('display','none');
		$(hide3).css('display','none');
		$(hide4).css('display','none');
		$(hide5).css('display','none');
		$(hide6).css('display','none');
	});
	$(side2).on('click',function(){
		$(side2).addClass('mypactive');
		$(side1).removeClass('mypactive');
		$(side3).removeClass('mypactive');
		$(side4).removeClass('mypactive');
		$(side5).removeClass('mypactive');
		$(side6).removeClass('mypactive');
		$(hide1).css('display','none');
		$(hide2).css('display','block');
		$(hide3).css('display','none');
		$(hide4).css('display','none');
		$(hide5).css('display','none');
		$(hide6).css('display','none');
	});
	$(side3).on('click',function(){
		$(side3).addClass('mypactive');
		$(side1).removeClass('mypactive');
		$(side2).removeClass('mypactive');
		$(side4).removeClass('mypactive');
		$(side5).removeClass('mypactive');
		$(side6).removeClass('mypactive');
		$(hide1).css('display','none');
		$(hide2).css('display','none');
		$(hide3).css('display','block');
		$(hide4).css('display','none');
		$(hide5).css('display','none');
		$(hide6).css('display','none');
	});
	$(side4).on('click',function(){
		$(side4).addClass('mypactive');
		$(side1).removeClass('mypactive');
		$(side2).removeClass('mypactive');
		$(side3).removeClass('mypactive');
		$(side5).removeClass('mypactive');
		$(side6).removeClass('mypactive');
		$(hide1).css('display','none');
		$(hide2).css('display','none');
		$(hide4).css('display','block');
		$(hide3).css('display','none');
		$(hide5).css('display','none');
		$(hide6).css('display','none');
	});
	$(side5).on('click',function(){
		$(side5).addClass('mypactive');
		$(side1).removeClass('mypactive');
		$(side2).removeClass('mypactive');
		$(side3).removeClass('mypactive');
		$(side4).removeClass('mypactive');
		$(side6).removeClass('mypactive');
		$(hide1).css('display','none');
		$(hide2).css('display','none');
		$(hide5).css('display','block');
		$(hide3).css('display','none');
		$(hide4).css('display','none');
		$(hide6).css('display','none');
	});
	$(side6).on('click',function(){
		$(side6).addClass('mypactive');
		$(side1).removeClass('mypactive');
		$(side2).removeClass('mypactive');
		$(side3).removeClass('mypactive');
		$(side4).removeClass('mypactive');
		$(side5).removeClass('mypactive');
		$(hide1).css('display','none');
		$(hide2).css('display','none');
		$(hide6).css('display','block');
		$(hide4).css('display','none');
		$(hide5).css('display','none');
		$(hide3).css('display','none');
	});

});

