package com.panda.persistence;

import java.util.List;

import com.panda.domain.GoodsVO;

public interface GoodsDAO {
	
	// 상품 글쓰기
	public void createGoods(GoodsVO vo) throws Exception;
	
	// 상품목록(All)
	public List<GoodsVO> getGoodsListAll() throws Exception;
	
	// 상품 목록 조회수 1증가 
	public void updateViewcnt(Integer goods_no) throws Exception;
	
	// 상품 상세페이지
	public GoodsVO getGoods(Integer goods_no) throws Exception;
	
	// 상품 글 수정
	public Integer updateGoods(GoodsVO vo) throws Exception;

  	// 상품 글 삭제
	public void removeGoods(Integer goods_no) throws Exception;
	
	
	
}
