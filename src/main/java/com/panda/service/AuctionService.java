package com.panda.service;

import java.util.List;

import com.panda.domain.AuctionVO;

public interface AuctionService {
	
	// 경매 상품 등록
	public void insertAuction(AuctionVO avo) throws Exception;
	
	// 경매 상품 전체 목록 
	public List<AuctionVO> getAuctionListAll() throws Exception;
	
	// 경매 상품 조회수 1증가
	public void updateViewcnt(Integer auction_no) throws Exception;
	
	// 경매번호 정보 조회
	public AuctionVO getAuction(Integer auction_no) throws Exception;
	
	// 사용자 정보 조회
	public AuctionVO getUser(Integer user_no) throws Exception;
	
	
}
