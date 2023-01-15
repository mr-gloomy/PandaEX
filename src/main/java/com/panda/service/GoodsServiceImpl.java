package com.panda.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.panda.domain.AuctionVO;
import com.panda.domain.GoodsVO;
import com.panda.domain.MemberVO;
import com.panda.domain.SearchVO;
import com.panda.persistence.GoodsDAO;

@Service
public class GoodsServiceImpl  implements GoodsService {

	// 객체 로거 정보
	private static final Logger mylog = LoggerFactory.getLogger(GoodsServiceImpl.class);
	
	@Autowired
	private GoodsDAO dao;
	
	// 상품 글쓰기
	@Override
	public void insertGoods(GoodsVO vo) throws Exception {
		mylog.debug("insertGoods(GoodsVO vo) 호출 ->  DAO 동작 호출");
		
		dao.createGoods(vo);
		
		mylog.debug(" 글쓰기 완료 -> 컨트롤러 이동 ");
	}

	// 상품목록(All)
	@Override
	public List<GoodsVO> getGoodsListAll(SearchVO vo) throws Exception {
		mylog.debug(" getGoodsListAll() - DAO 호출(결과 리턴받기)");
		
		return dao.getGoodsListAll(vo);
	}

	// 상품 목록 조회수 1증가 
	@Override
	public void updateViewcnt(Integer goods_no) throws Exception {
		mylog.debug(" updateViewcnt(Integer goods_no) - DAO 호출( 조회수 1증가 ) ");
		
		dao.updateViewcnt(goods_no);
	}
	
	// 글번호(goods_no) 정보 조회
	@Override
	public GoodsVO getGoods(Integer goods_no) throws Exception {
		mylog.debug("getGoods(Integer goods_no) 호출");
		
		return dao.getGoods(goods_no);
	}
	
	// 사용자 정보 조회
	@Override
	public GoodsVO getUser(Integer user_no) throws Exception {
		mylog.debug("getUser(Integer user_no) 호출");
		
		return dao.getUser(user_no);
	}
	
	// 상품번호, 회원번호 정보 조회 
	@Override
	public Map getGoods2(GoodsVO vo) throws Exception {
		mylog.debug("getGoods2 : " + vo);
		
		return dao.getGoods2(vo);
	}
	
	// 상품 수정
	@Override
	public Integer updateGoods(GoodsVO vo) throws Exception {
		mylog.debug(" updateGoods(GoodsVO vo) ");
		
		return dao.updateGoods(vo);
	}

	// 상품 삭제
	@Override
	public Integer removeGoods(Integer goods_no) throws Exception {
		mylog.debug(" removeGoods(Integer goods_no) 호출");
		
		return dao.removeGoods(goods_no);
	}
	
	// 상품 찜
	@Override
	public Integer updateLike(GoodsVO vo) throws Exception {

		return dao.updateLike(vo);
	}
	
	// 마이페이지 상품정보 
	@Override
	public List<GoodsVO> getUserGoods(MemberVO memberVO) {
		
		return dao.userGoods(memberVO);
	}
	
	
	// 메인 상품 랜덤 메서드
	@Override
	public List<GoodsVO> g_randList() throws Exception {
		mylog.debug(" g_randList() - DAO 호출(결과 리턴받기)");
		
		return dao.g_randList();
	}

	// 메인 경매 랜덤 메서드
	@Override
	public List<AuctionVO> a_randList() throws Exception {
		mylog.debug(" g_randList() - DAO 호출(결과 리턴받기)");
		
		return dao.a_randList();
	}
	
	
	
	
	
	
}
