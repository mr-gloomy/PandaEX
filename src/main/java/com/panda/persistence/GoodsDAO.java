package com.panda.persistence;

import com.panda.domain.GoodsVO;

public interface GoodsDAO {
	
	// 시간정보
	public String getTime();
	
	// 상품 글작성
	public void createGoods(GoodsVO gvo) throws Exception;
	
//	// 상품목록(All)
//	public List<GoodsVO> getGoodsListAll() throws Exception;
//	
//	// 상품 목록 조회수 1증가 
//	public void updateViewcount(Integer goods_no) throws Exception;
//	
//	// 상품 상세페이지
//	public GoodsVO getBoard(Integer goods_no) throws Exception;
//	
//	// 상품 글 수정
//  Integer updateGoods(GoodsVO gvo) throws Exception;
//	
//	// 상품 글 삭제
//	public Integer removeGoods(Integer goods_no) throws Exception;

}
