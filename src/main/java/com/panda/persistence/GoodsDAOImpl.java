package com.panda.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.panda.domain.GoodsVO;
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
	
	// 상품 글수정
	@Override
	public Integer updateGoods(GoodsVO vo) throws Exception {
		mylog.debug(" updateGoods(GoodsVO vo) ");
		
		return sqlSession.update(NAMESPACE + ".updateGoods", vo);
	}
	
	// 상품 글삭제
	@Override
	public void removeGoods(Integer goods_no) throws Exception {
		sqlSession.delete(NAMESPACE + ".removeGoods", goods_no);
	}
	
	
	
	
	
	
	

	
	
	
}
