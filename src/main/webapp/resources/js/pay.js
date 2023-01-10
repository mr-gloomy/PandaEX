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
	/* 배송 요청사항 */
	$('.message-option').on('click',function(){
		var message = $('.post-message')
		
		$('.massage-option-sel').css('visibility','visible');
		$('.post-message').css('border-radius','5px 5px 0px 5px');

		// 선택시 밸류값 전송
		$('.sel-1').on("click",function(){
			$('.massage-option-sel').css('visibility','hidden');
			$('.post-message').css('border-radius','5px');
			$(message).attr('value',"직접입력");
		});
		$('.sel-2').on("click",function(){
			$('.massage-option-sel').css('visibility','hidden');
			$('.post-message').css('border-radius','5px');
			$(message).attr('value',"빠른 배송 부탁드립니다.");
		});
		$('.sel-3').on("click",function(){
			$('.massage-option-sel').css('visibility','hidden');
			$('.post-message').css('border-radius','5px');
			$(message).attr('value',"배송 전, 연락주세요");
		});
		$('.sel-4').on("click",function(){
			$('.massage-option-sel').css('visibility','hidden');
			$('.post-message').css('border-radius','5px');
			$(message).attr('value',"부재 시, 휴대폰으로 연락주세요.");
		});
		$('.sel-5').on("click",function(){
			$('.massage-option-sel').css('visibility','hidden');
			$('.post-message').css('border-radius','5px');
			$(message).attr('value',"부재 시, 경비실에 맡겨주세요.");
		});
		$('.sel-6').on("click",function(){
			$('.massage-option-sel').css('visibility','hidden');
			$('.post-message').css('border-radius','5px');
			$(message).attr('value',"선택 안함");
		});
	});
	
	
	
	
	/* 배송 요청사항 */
	

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