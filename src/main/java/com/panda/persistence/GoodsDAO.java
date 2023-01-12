package com.panda.persistence;

import java.util.List;
import java.util.Map;

import com.panda.domain.GoodsVO;
import com.panda.domain.SearchVO;

public interface GoodsDAO {
	
	// 상품 글쓰기
	public void createGoods(GoodsVO vo) throws Exception;
	
	// 상품목록(All)
	public List<GoodsVO> getGoodsListAll(SearchVO vo) throws Exception;
	
	// 상품 목록 조회수 1증가 
	public void updateViewcnt(Integer goods_no) throws Exception;
	
	// 상품번호(goods_no) 정보 조회
	public GoodsVO getGoods(Integer goods_no) throws Exception;
	
	// 사용자 정보 조회
	public GoodsVO getUser(Integer user_no) throws Exception;
	
	// 상품번호, 회원번호 정보 조회 
	public Map getGoods2(GoodsVO vo) throws Exception;
	
	// 상품 글 수정
	public Integer updateGoods(GoodsVO vo) throws Exception;

  	// 상품 글 삭제
	public Integer removeGoods(Integer goods_no) throws Exception;
	
	// 상품 찜
	public Integer updateLike(GoodsVO vo) throws Exception;
	
	
}
