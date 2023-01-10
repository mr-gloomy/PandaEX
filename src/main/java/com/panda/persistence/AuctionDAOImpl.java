package com.panda.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.panda.domain.AuctionVO;
import com.panda.domain.Criteria;
import com.panda.domain.GoodsVO;
import com.panda.domain.SearchVO;

@Repository
public class AuctionDAOImpl implements AuctionDAO{
	
	private static final Logger mylog = LoggerFactory.getLogger(AuctionDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	// mapper NAMESPACE 
	private static final String NAMESPACE = "com.panda.mapper.AuctionMapper";
	
	// 경매 상품 등록
	@Override
	public void createAuction(AuctionVO avo) throws Exception {
		mylog.debug("createAuction(AuctionVO avo) -> mapper 동작 호출");
		
		sqlSession.insert(NAMESPACE+".createAuction", avo);
		
		mylog.debug("경매 상품 등록 완료 -> 서비스");
	}

	// 경매 상품 전체 목록
	@Override
	public List<AuctionVO> getAuctionListAll(SearchVO vo) throws Exception {
		mylog.debug("getAuctionListAll() -> sqlSession-mapper 호출");
		
		List<AuctionVO> auctionList = sqlSession.selectList(NAMESPACE+".alistAll",vo);
		
		mylog.debug("경매 상품 전체 개수 : " + auctionList.size() + "");
		
		return auctionList;
	}

	// 경매 상품 조회수 1증가
	@Override
	public void updateViewcnt(Integer auction_no) throws Exception {
		mylog.debug("updateViewcnt(Integer auction_no) - sqlSession 객체");
		
		sqlSession.update(NAMESPACE+".updateViewcnt", auction_no);
	}

	// 경매번호 사용한 정보 조회
	 @Override 
	 public AuctionVO getAuction(Integer auction_no) throws Exception {
		 mylog.debug("getAuction(Integer auction_no) 호출");
	
		 AuctionVO avo = sqlSession.selectOne(NAMESPACE + ".getAuction", auction_no);
	 
		 return avo; 
	 }
	

	// 사용자 정보 조회
	@Override 
	public AuctionVO getUser(Integer user_no) throws Exception {
		mylog.debug("getUser(Integer user_no) 호출"); 
		AuctionVO avo1 = sqlSession.selectOne(NAMESPACE + ".getUser", user_no); 
		return avo1; 
	}

	
	// 경매번호, 회원번호 정보 조회 
	@Override
	public Map getAuctions(AuctionVO vo) throws Exception {
		mylog.debug("dao auctions : "+sqlSession.selectList(NAMESPACE+".getAuctions",vo));
		return sqlSession.selectOne(NAMESPACE+".getAuctions",vo);
	}
	

	// 경매 상품 글 수정
	@Override
	public Integer updateAuction(AuctionVO avo) throws Exception {
		mylog.debug("updateAuction(AuctionVO avo) 호출");
		return sqlSession.update(NAMESPACE+".updateAuction", avo);
	}

	
	// 경매 상품 글 삭제
	@Override
	public Integer removeAuction(AuctionVO avo) throws Exception {
		mylog.debug("removeAuction(AuctionVO avo) 호출");
		return sqlSession.delete(NAMESPACE+".removeAuction", avo);
	}

	
	// 경매 상품 찜 업데이트
	@Override
	public Integer updateLike(AuctionVO avo) throws Exception {
		mylog.debug("updateLike(avo)");
		return sqlSession.update(NAMESPACE+".updateLike", avo);
	}

	
	// 페이징 처리 구현된 리스트 조회
	@Override
	public List<AuctionVO> getListPage(Integer page) throws Exception {
		//페이지 정보 계산
		if(page<0) {
			page=1;
		}
		page = (page-1)*10;
		return sqlSession.selectList(NAMESPACE+".listPage", page);
	}

	@Override
	public List<AuctionVO> getListPage(Criteria cri) throws Exception {
		mylog.debug("getListPage(Criteria cri) 페이징 처리");
		return sqlSession.selectList(NAMESPACE+".listPage2", cri);
	}

	
	// 전체 게시판 글 개수
	@Override
	public int totalCnt() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countAuction");
	}

	
	// 입찰하기
	@Override
	public Integer updateBid(AuctionVO avo) throws Exception {
		mylog.debug("updateBid(AuctionVO avo) 호출");
		return sqlSession.update(NAMESPACE+".updateBid", avo);
	}

	
	
}
