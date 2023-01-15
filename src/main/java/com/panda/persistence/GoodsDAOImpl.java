package com.panda.persistence;

import java.util.List;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.panda.domain.AuctionVO;
import com.panda.domain.GoodsVO;
import com.panda.domain.MemberVO;
import com.panda.domain.SearchVO;

@Repository
public class GoodsDAOImpl implements GoodsDAO{
	
	// 객체 로거 설정
	private static final Logger mylog = LoggerFactory.getLogger(GoodsDAOImpl.class);
	
	// 디비연결 -> bean 주입
	@Inject
	private SqlSession sqlSession;
	
	// mapper NAMESPACE 
	private static final String NAMESPACE = "com.panda.mapper.GoodsMapper";
	
	// 상품 글쓰기
	@Override
	public void createGoods(GoodsVO vo) throws Exception {
		mylog.debug("createGoods(GoodsVO vo) -> mapper 동작 호출");
		
		sqlSession.insert(NAMESPACE +".createGoods", vo);
		
		mylog.debug("글쓰기 완료 -> 서비스");
	}

	// 상품목록(All)
	@Override
	public List<GoodsVO> getGoodsListAll(SearchVO vo) throws Exception {
		mylog.debug("getGoodsListAll() -> sqlSession mapper 호출 ");
		
		return sqlSession.selectList(NAMESPACE +".listAll",vo);
	}

	// 상품 목록 조회수 1증가 
	@Override
	public void updateViewcnt(Integer goods_no) throws Exception {
		mylog.debug("updateViewcnt(Integer goods_no) - sqlSession 객체");
		
		sqlSession.update(NAMESPACE+".updateViewcnt", goods_no);
		
	}

	// 상품번호(goods_no) 정보 조회
	@Override
	public GoodsVO getGoods(Integer goods_no) throws Exception {
		mylog.debug("getGoods(Integer goods_no) 호출");
		
		GoodsVO vo = sqlSession.selectOne(NAMESPACE + ".getGoods", goods_no);
		
		return vo;
	}
	
	// 사용자 정보 조회
	@Override
	public GoodsVO getUser(Integer user_no) throws Exception {
		mylog.debug("getUser(Integer user_no) 호출");
		
		GoodsVO vo = sqlSession.selectOne(NAMESPACE + ".getUser", user_no); 
		
		return vo; 
	}
	
	// 상품번호, 회원번호 정보 조회 
	@Override
	public Map getGoods2(GoodsVO vo) throws Exception {
		mylog.debug("dao Goods : " + sqlSession.selectList(NAMESPACE+".getGoods2",vo));
		
		return sqlSession.selectOne(NAMESPACE + ".getGoods2",vo);
	}
	
	// 상품 글수정
	@Override
	public Integer updateGoods(GoodsVO vo) throws Exception {
		mylog.debug(" updateGoods(GoodsVO vo) 호출");
		
		return sqlSession.update(NAMESPACE + ".updateGoods", vo);
	}
	
	// 상품 글삭제
	@Override
	public Integer removeGoods(Integer goods_no) throws Exception {
		mylog.debug("removeGoods(Integer goods_no) 호출");
		
		return sqlSession.delete(NAMESPACE+".removeGoods", goods_no);
	}
	
	// 상품 찜 
	@Override
	public Integer updateLike(GoodsVO vo) throws Exception {
		mylog.debug("updateLike(vo) 호출");
		
		return sqlSession.update(NAMESPACE + ".updateLike", vo);
	}

	@Override
	public List<GoodsVO> userGoods(MemberVO memberVO) {

		return sqlSession.selectList(NAMESPACE+".getUserGoods", memberVO);
	}
	// 메인 상품 랜덤 메서드
	@Override
	public List<GoodsVO> g_randList() throws Exception {
		mylog.debug("g_randList() -> sqlSession mapper 호출 ");
		
		List<GoodsVO> GoodsRand = sqlSession.selectList(NAMESPACE +".g_rand");
		
		return GoodsRand;
	}
	
	// 메인 경매상품 랜덤 메서드
	@Override
	public List<AuctionVO> a_randList() throws Exception {
		mylog.debug("a_randList() -> sqlSession mapper 호출 ");
		
		List<AuctionVO> AuctionRand = sqlSession.selectList(NAMESPACE +".a_rand");
		
		return AuctionRand;
	}
	
	
	
	
	
	
	
	
	

	
	
	
}
