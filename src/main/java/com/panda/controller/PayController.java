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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.panda.domain.MemberVO;
import com.panda.paymentvo.CashingListVO;
import com.panda.paymentvo.CashingPointsVO;
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
		return "payment/paymentReady";
	}
	
	@PostMapping("/charge")
	public String pay1Purchase(
				@ModelAttribute PurchaseVO purchaseVO, HttpSession session
			) throws Exception {
		
		//결제 준비(ready) 요청을 진행
//		int paymentNo = paymentDao.paymentSequence();
		int paymentNo = 1213143333;
		KakaoPayReadyRequestVO requestVO = 
									KakaoPayReadyRequestVO.builder()
//												.partner_order_id(String.valueOf(paymentNo))
//												.partner_user_id(String.valueOf(session.getAttribute("whoLogin")))
//												.item_name("판다페이 충전")
//												.total_amount(purchaseVO.getChargeMoney())
												.partner_order_id(String.valueOf(paymentNo))
												.partner_user_id("7") // user_no
												.item_name("pandaPay")
												.total_amount(purchaseVO.getChargeMoney())
											.build();
		mylog.debug(" requestVO : " + requestVO);
		KakaoPayReadyResponseVO responseVO = kakaoPayService.ready(requestVO);
		//mylog.debug(" responseVO : " + responseVO);
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
		
		int paymentNo = (int) session.getAttribute("paymentNo");
		
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
		
//		return "redirect:/pay/finish";
		return "redirect:finish";
	}
	
	@GetMapping("/finish")
	public String payFinish(HttpSession session, Model model) throws Exception {
		int paymentNo = (int) session.getAttribute("paymentNo");
		session.removeAttribute("paymentNo");
		PaymentSuccessVO pvo = paymentService.successOne(paymentNo);
		mylog.debug("pvo : " + pvo);
		model.addAttribute("success", pvo);
		return "payment/finish";
	}
//	
//	@GetMapping("/cancel")
//	public String payCancel(HttpSession session) {
//		session.removeAttribute("pay");
//		session.removeAttribute("purchase");
//		session.removeAttribute("paymentNo");
//		return "payment/cancel";
//	}
//	
//	@GetMapping("/fail")
//	public String payFail(HttpSession session) {
//		session.removeAttribute("pay");
//		session.removeAttribute("purchase");
//		session.removeAttribute("paymentNo");
//		return "payment/fail";
//	}
//
//	@GetMapping("/refund/{paymentNo}")
//	public String refund(HttpSession session, @PathVariable int paymentNo) throws Exception {
//		int memberNo = (int)session.getAttribute("whoLogin");
//		
//		PaymentInsertVO paymentInsertVO = paymentService.selectOne(paymentNo);
//		
//		//카카오페이에 취소 요청
//		KakaoPayCancelRequestVO requestVO = KakaoPayCancelRequestVO.builder()
//																					.tid(paymentInsertVO.getPaymentTid())
//																					.cancel_amount(paymentInsertVO.getPaymentPrice())
//																					.build();
//		KakaoPayCancelResponseVO responseVO = kakaoPayService.cancel(requestVO);
//		
//		paymentService.refund(paymentNo);
//		
//		return "redirect:/payment/list";
//	}
//
//	@PostMapping("/cashingRequest")
//	public String cashingRequest(HttpSession session,
//			@ModelAttribute CashingPointsVO cashingPointsVO) {
//		int memberNo = (int)session.getAttribute("whoLogin");
//		cashingPointsVO.setMemberNo(memberNo);
//		boolean success = paymentService.cashingRequest(cashingPointsVO);
//		if(success) {
//			return "redirect:cashingSuccess";
//		}else {
//			return "redirect:cashingFail";
//		}
//	}
//	@GetMapping("/cashingSuccess")
//	public String cashingSuccess() {
//		return "payment/cashingSuccess";
//	}
//	@GetMapping("/cashingFail")
//	public String cashingFail() {
//		return "payment/cashingFail";
//	}
//
//	@GetMapping("/paying/{auctionNo}")
//	public String paying(HttpSession session, @PathVariable int auctionNo) {
//		mylog.debug("======1=====");
//		int memberNo = (int)session.getAttribute("whoLogin");
//		boolean enoughPoint = paymentService.enoughPoint(memberNo, auctionNo);
//		mylog.debug("======2=====");
//		if(enoughPoint) {
//			paymentService.pointPaying(memberNo, auctionNo);
//			mylog.debug("======3=====");
//			return "payment/auctionFinish";
//		}else {
//			mylog.debug("======4=====");
//			return"redirect:/payment/paymentReady/"+auctionNo;
//		}
//	}
////	@GetMapping("/paymentReady/{auctionNo}")
//	public String paymentReadyAuction(HttpSession session, Model model ,@PathVariable int auctionNo) {
//		int memberNo = (int)session.getAttribute("whoLogin");
//		model.addAttribute("memberDto", memberDAO.selectOne(memberNo));
//		model.addAttribute("bidDto", paymentService.bidSelect(auctionNo));
//		model.addAttribute("auctionNo", auctionNo);
//		return "payment/paymentReadyAuction";
//	}
//	
//	@GetMapping("/paymentReady")
//	public String pay1Purchase(HttpSession httpSession, Model model) {
//		int memberNo = (int) httpSession.getAttribute("whoLogin");
//		
//		model.addAttribute("memberDto", memberDao.selectOne(memberNo));
//		return "payment/paymentReady";
//	}
//	
//	@GetMapping("/list")
//	public String payList() {
//		return "payment/list";
//	}
//	
//	@ResponseBody
//	@GetMapping("/loadList")
//	public List<PaymentInsertVO> payList(@RequestParam int page,
//											@RequestParam Integer filter,
//											@RequestParam Integer sort,
//											HttpSession session) {
//		int memberNo = (int) session.getAttribute("whoLogin");
//		List<PaymentInsertVO> list = paymentService.allList(memberNo, page, filter, sort);
//		return list;
//	}
//	
//	
//	@GetMapping("/cashing")
//	public String cashing(HttpSession session, Model model) {
//		model.addAttribute("memberDto", MemberVO.selectOne((int)session.getAttribute("whoLogin")));
//		return "payment/cashing";
//	}
//
//	@GetMapping("/cashingList")
//	public String cashingList() {
//		return "/payment/cashingList";
//	}
	
//	@ResponseBody
//	@GetMapping("/loadCashingList")
//	public List<CashingListVO> cashingList(@RequestParam int page,
//												@RequestParam Integer filter,
//												@RequestParam Integer sort,
//												HttpSession session) {
//		int memberNo = (int) session.getAttribute("whoLogin");
//		List<CashingListVO> list = paymentService.cashingList(memberNo, page, filter, sort);
//		return list;
//	}
}	