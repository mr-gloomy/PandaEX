package com.panda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.panda.domain.AuctionVO;
import com.panda.domain.Criteria;
import com.panda.domain.SearchVO;

public interface AuctionService {
	
	// 경매 상품 등록
	public void insertAuction(AuctionVO avo) throws Exception;
	
	// 경매 상품 전체 목록 
	public List<AuctionVO> getAuctionListAll(SearchVO vo) throws Exception;
	
	// 경매 상품 조회수 1증가
	public void updateViewcnt(Integer auction_no) throws Exception;
	
	// 경매번호 정보 조회
	public AuctionVO getAuction(Integer auction_no) throws Exception;
	
	// 사용자 정보 조회
	public AuctionVO getUser(Integer user_no) throws Exception;
	
	// 경매번호, 회원번호 정보 조회 
	public Map getAuctions(AuctionVO vo) throws Exception;
	
	// 경매 상품 글 수정
	public Integer updateAuction(AuctionVO avo) throws Exception;
	
	// 경매 상품 글 삭제
	public Integer removeAuction(Integer auction_no) throws Exception;
	
	// 경매 상품 찜 업데이트
	public Integer updateLike(AuctionVO avo) throws Exception;
	
	// 페이징 처리 구현된 리스트 조회
	public List<AuctionVO> getListPage(Criteria cri) throws Exception;
	
	// 글 전체 개수
	public int totalCnt() throws Exception;
	
	
}
