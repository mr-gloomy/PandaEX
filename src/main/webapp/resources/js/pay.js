/* 결제페이지 스크립트 */
$(function(){
	
	/* 주소검색 */
	$('.address-search').on('click',function(){
		new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
               $('.address').attr('value',data.address);
               $('.detail-address').focus();
            }
        }).open();
	});
	/* 주소검색 */
	
	/* 임시 */
	$('.panda-coin').on("keyup blur click focus",function silsigan(){
		var userhavecoin = $('.panda-coin').val();
		if(userhavecoin == ""){
			$('.coinprice').attr('value',"0원");
		}else{
		$('.coinprice').attr('value',userhavecoin+"원");
		}

	})
	/* 임시 */
	
});