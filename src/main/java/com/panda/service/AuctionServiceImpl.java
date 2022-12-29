package com.panda.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.panda.domain.AuctionVO;
import com.panda.persistence.AuctionDAO;

@Service
public class AuctionServiceImpl implements AuctionService {
	
	private static final Logger mylog = LoggerFactory.getLogger(AuctionServiceImpl.class);
	
	@Autowired
	private AuctionDAO adao;
	
	// 경매 상품 등록
	@Override
	public void insertAuction(AuctionVO avo) throws Exception {
		mylog.debug("insertAuction(AuctionVO avo) 호출 -> DAO 동작 호출");
		adao.createAuction(avo);
		mylog.debug("경매 상품 등록 완료 -> 컨트롤러 이동");
	}

	// 경매 상품 전체 목록
	@Override
	public List<AuctionVO> getAuctionListAll() throws Exception {
		mylog.debug(".getAuctionListAll() - DAO 호출");
		return adao.getAuctionListAll();
	}

	// 경매 상품 조회수 증가
	@Override
	public void updateViewcnt(Integer auction_no) throws Exception {
		mylog.debug("updateViewcnt(Integer auction_no) - DAO 호출(조회수 1증가)");
		
		adao.updateViewcnt(auction_no);
	}

	// 경매번호 조회
	@Override
	public AuctionVO getAuction(Integer auction_no) throws Exception {
		mylog.debug("getAuction(Integer auction_no) 호출");
		return adao.getAuction(auction_no);
	}
	
	
	
	
	
	
	
}
