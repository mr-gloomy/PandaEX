package com.panda.service;

import java.util.List;

import com.panda.domain.GoodsVO;
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
	
	// 글정보 수정
	public Integer updateGoods(GoodsVO vo) throws Exception;
	
	// 글정보 삭제
	public void removeGoods(Integer goods_no) throws Exception;
	
//	// 글정보 조회(페이징처리cri)
//	public List<BoardVO> getListPage(Criteria cri) throws Exception;
//		
//	// 글 전체 개수 
//	public int totalCnt() throws Exception;
}
