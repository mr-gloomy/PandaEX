package com.panda.service;

import com.panda.domain.GoodsVO;

public interface GoodsService {
	
	// 게시판 글쓰기
	public void insertGoods(GoodsVO gvo) throws Exception;

//	// 게시판 글목록(ALL)
//	public List<GoodsVO> getBoardListAll() throws Exception;
//	
//	// 글 조회수 1증가
//	public void updateViewcnt(Integer goods_no) throws Exception;
//	
//	// 글번호(goods_no) 정보 조회
//	public GoodsVO getGoods(Integer goods_no) throws Exception; 
//	
//	// 글정보 수정
//	public Integer updateGoods(GoodsVO gvo) throws Exception;
//	
//	// 글정보 삭제
//	public Integer removeGoods(Integer goods_no) throws Exception;
}
