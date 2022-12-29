package com.panda.service;

import java.util.List;

import com.panda.domain.GoodsVO;

public interface GoodsService {
	
	// 상품 글쓰기
	public void insertGoods(GoodsVO gvo) throws Exception;

	// 상품목록(All)
	public List<GoodsVO> getGoodsListAll() throws Exception;
	
	// 글 조회수 1증가
	public void updateViewcnt(Integer goods_no) throws Exception;
	
	// 글번호(goods_no) 정보 조회
	public GoodsVO getGoods(Integer goods_no) throws Exception; 
	
//	// 글정보 수정
//	public Integer updateGoods(GoodsVO gvo) throws Exception;
//	
//	// 글정보 삭제
//	public Integer removeGoods(Integer goods_no) throws Exception;
}
