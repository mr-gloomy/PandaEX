package com.panda.service;

import java.util.List;
import java.util.Map;

import com.panda.domain.AuctionVO;
import com.panda.domain.GoodsVO;
import com.panda.domain.MemberVO;
import com.panda.domain.SearchVO;

public interface GoodsService {
	
	// 상품 글쓰기
	public void insertGoods(GoodsVO vo) throws Exception;

	// 상품목록(All)
	public List<GoodsVO> getGoodsListAll(SearchVO vo) throws Exception;
	
	// 글 조회수 1증가
	public void updateViewcnt(Integer goods_no) throws Exception;
	
	// 글번호(goods_no) 정보 조회
	public GoodsVO getGoods(Integer goods_no) throws Exception; 
	
	// 사용자 정보 조회
	public GoodsVO getUser(Integer user_no) throws Exception;
	
	// 상품번호, 회원번호 정보 조회 
	public Map getGoods2(GoodsVO vo) throws Exception;
	
	// 글정보 수정
	public Integer updateGoods(GoodsVO vo) throws Exception;
	
	// 글정보 삭제
	public Integer removeGoods(Integer goods_no) throws Exception;
	
	// 상품 찜
	public Integer updateLike(GoodsVO vo) throws Exception;
	
	// 마이페이지 상품정보 
	public List<GoodsVO> getUserGoods(MemberVO memberVO);

	// 메인 상품 랜덤 메서드
	public List<GoodsVO> g_randList() throws Exception;
	
	// 메인 경매 랜덤 메서드
	public List<AuctionVO> a_randList() throws Exception;
	
}
