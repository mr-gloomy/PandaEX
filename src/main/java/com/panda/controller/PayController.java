package com.panda.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.util.concurrent.Service;
import com.panda.domain.GoodsVO;
import com.panda.domain.MemberVO;
import com.panda.paymentvo.KakaoPayApproveRequestVO;
import com.panda.paymentvo.KakaoPayApproveResponseVO;
import com.panda.paymentvo.KakaoPayCancelRequestVO;
import com.panda.paymentvo.KakaoPayCancelResponseVO;
import com.panda.paymentvo.KakaoPayReadyRequestVO;
import com.panda.paymentvo.KakaoPayReadyResponseVO;
import com.panda.paymentvo.PaymentInsertVO;
import com.panda.paymentvo.PaymentSuccessVO;
import com.panda.paymentvo.PurchaseVO;
import com.panda.persistence.MemberDAO;
import com.panda.persistence.PaymentDAO;
import com.panda.service.KakaoPayService;
import com.panda.service.PaymentService;

@Controller
@RequestMapping(value="/payment/*")
public class PayController {

	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Autowired
	private PaymentDAO paymentDao;
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private MemberDAO memberDao;
	
	private static final Logger mylog
	= LoggerFactory.getLogger(PayController.class);

	
	@GetMapping("/kakao")
	public String kakaoPay() {
		return "/payment/paymentReady";
	}
	
	// http://localhost:8080/payment/list
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public void list() throws Exception {
		
	}
	
	@PostMapping("/charge")
	public String pay1Purchase(
				@ModelAttribute PurchaseVO purchaseVO, HttpSession session
			) throws Exception {
		
		String user_id = (String)session.getAttribute("user_id");
		MemberVO mvo = paymentService.getUser(user_id);
		mylog.debug("user_no : " + mvo.getUser_no());
		int user_no = mvo.getUser_no();
		//결제 준비(ready) 요청을 진행
		int paymentNo = (int)((Math.random()+1)*100000000);
		KakaoPayReadyRequestVO requestVO = 
									KakaoPayReadyRequestVO.builder()
												.partner_order_id(String.valueOf(paymentNo))
												.partner_user_id(String.valueOf(user_no)) // user_no
												.item_name("pandaPay")
												.total_amount(purchaseVO.getChargeMoney())
											.build();
		mylog.debug(" requestVO : " + requestVO);
		KakaoPayReadyResponseVO responseVO = kakaoPayService.ready(requestVO);
		//결제성공 페이지에서 승인요청을 보내기 위해 알아야할 데이터 3개를 세션에 임시로 추가한다
		//-> 결제가 성공할지 실패할지 취소될지 모르기 때문에 모든 경우에 추가한 데이터를 지워야 한다
		session.setAttribute("pay", KakaoPayApproveRequestVO.builder()
																.tid(responseVO.getTid())
																.partner_order_id(requestVO.getPartner_order_id())
																.partner_user_id(requestVO.getPartner_user_id())
															.build());
		mylog.debug(" purchaseVO : " + purchaseVO);
		//추가적으로 결제성공 페이지에서 완료정보를 등록하기 위해 알아야 할 상품구매개수 정보를 같이 전달
		session.setAttribute("purchase", purchaseVO);//상품이 1개라면
		//session.setAttribute("purchase", Arrays.asList(purchaseVO));//1.8부터
		
		//결제 번호도 세션으로 전달
		session.setAttribute("paymentNo", paymentNo);
		
		return "redirect:"+responseVO.getNext_redirect_pc_url();
	}
	
	
	
	//승인/취소/실패 : 카카오 API에 신청한 URL로 처리
	@GetMapping("/approve")
	public String paySuccess(@RequestParam String pg_token, HttpSession session) throws Exception {
		//세션에 추가된 정보를 받고 세션에서 삭제한다(tid, partner_order_id, partner_user_id)
		// -> 취소 , 실패 , 성공 모두다 삭제하도록 처리
		KakaoPayApproveRequestVO requestVO = 
									(KakaoPayApproveRequestVO) session.getAttribute("pay");
		session.removeAttribute("pay");
		
		PurchaseVO purchaseVO = (PurchaseVO) session.getAttribute("purchase");
		
		int paymentNo = (int)session.getAttribute("paymentNo");
		
		//주어진 정보를 토대로 승인(approve) 요청을 보낸다
		requestVO.setPg_token(pg_token);
		KakaoPayApproveResponseVO responseVO = kakaoPayService.approve(requestVO);
		mylog.debug(" requestVO: " + requestVO);
		mylog.debug(" responseVO: " + responseVO);
		PaymentInsertVO vo = new PaymentInsertVO();
		vo.setPaymentNo(paymentNo);
		vo.setMemberNo(Integer.parseInt(responseVO.getPartner_user_id()));
		vo.setPaymentTid(responseVO.getTid());
		vo.setPaymentPrice(purchaseVO.getChargeMoney());
		paymentService.insert(vo);
		mylog.debug( "vo :  " + vo);
//		return "redirect:/pay/finish";
		return "redirect:finish";
	}
	
	@GetMapping("/finish")
	public String payFinish(HttpSession session, Model model) throws Exception {
		int paymentNo = (int) session.getAttribute("paymentNo");
		session.removeAttribute("paymentNo");
		PaymentSuccessVO pvo = paymentService.successOne(paymentNo);
		
		String user_id = (String)session.getAttribute("user_id");
		MemberVO mvo = paymentService.getUser(user_id);
		
		mylog.debug("pvo : " + pvo);
		model.addAttribute("success", pvo);
		model.addAttribute("mvo", mvo);
		mylog.debug("pvo 를 success란 이름으로 가지고 payment/finish.jsp로 이동");
		return "/payment/finish";
	}
	
	@GetMapping("/cancel")
	public String payCancel(HttpSession session) {
		session.removeAttribute("pay");
		session.removeAttribute("purchase");
		session.removeAttribute("paymentNo");
		return "payment/cancel";
	}
	
	@GetMapping("/fail")
	public String payFail(HttpSession session) {
		session.removeAttribute("pay");
		session.removeAttribute("purchase");
		session.removeAttribute("paymentNo");
		return "payment/fail";
	}
	
	@RequestMapping(value = "/pay_page",method = RequestMethod.GET)
	public void pay_page(GoodsVO gvo,HttpSession session,Model model) throws Exception{
		mylog.debug("/payment/pay_page(GET) 호출 -> 페이지 이동 ");
		mylog.debug("goods_no : " + gvo.getGoods_no());
		gvo = paymentService.getGoods(gvo.getGoods_no());
		
		mylog.debug("goods_price : " + gvo.getGoods_price());
		String user_id = (String)session.getAttribute("user_id");
		MemberVO mvo = paymentService.getUser(user_id);
		model.addAttribute("mvo", mvo);
		model.addAttribute("gvo", gvo);
		
		// /payment/pay_page.jsp 페이지 이동
	}
	
	@GetMapping("/buying")
	public String buying(HttpSession session,@RequestParam int goods_price, 
			@RequestParam int goods_no ,MemberVO mvo)  throws Exception {
		mylog.debug("/payment/buying(GET) 호출 -> Service 실행 ");
		String user_id = (String)session.getAttribute("user_id");
		int user_no = mvo.getUser_no();
		mylog.debug("user_no : " + user_no);
		mylog.debug("goods_no : " + goods_no);
		mylog.debug("goods_price : " + goods_price);
		mylog.debug("user_id : " + user_id);
		paymentService.buyer(user_no, goods_no);
		paymentService.seller(goods_no);
		
		return "redirect:/main/index";
		
	}

	@GetMapping("/refund/{paymentNo}")
	public String refund(HttpSession session, @PathVariable int paymentNo) throws Exception {
		int memberNo = (int)session.getAttribute("whoLogin");
		
		PaymentInsertVO paymentInsertVO = paymentService.selectOne(paymentNo);
		
		//카카오페이에 취소 요청
		KakaoPayCancelRequestVO requestVO = KakaoPayCancelRequestVO.builder()
																					.tid(paymentInsertVO.getPaymentTid())
																					.cancel_amount(paymentInsertVO.getPaymentPrice())
																					.build();
		KakaoPayCancelResponseVO responseVO = kakaoPayService.cancel(requestVO);
		
		
		return "redirect:/payment/list";
	}
}	