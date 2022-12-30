package com.panda.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.panda.domain.GoodsVO;

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
	public void createGoods(GoodsVO gvo) throws Exception {
		mylog.debug("createGoods(GoodsVO gvo) -> mapper 동작 호출");
		
		sqlSession.insert(NAMESPACE +".createGoods", gvo);
		
		mylog.debug("글쓰기 완료 -> 서비스");
	}

	// 상품목록(All)
	@Override
	public List<GoodsVO> getGoodsListAll() throws Exception {
		mylog.debug("getGoodsListAll() -> sqlSession mapper 호출 ");
		
		List<GoodsVO> GoodsList = sqlSession.selectList(NAMESPACE +".listAll");

		mylog.debug("게시판 글 개수 : " + GoodsList.size() + "");
		
		return GoodsList;
	}

	// 상품 목록 조회수 1증가 
	@Override
	public void updateViewcnt(Integer goods_no) throws Exception {
		mylog.debug("updateViewcnt(Integer goods_no) - sqlSession 객체");
		
		sqlSession.update(NAMESPACE+".updateViewcnt", goods_no);
		
	}

	// 글번호(goods_no) 정보 조회
	@Override
	public GoodsVO getGoods(Integer goods_no) throws Exception {
		mylog.debug("getBoard(Integer goods_no) 호출");
		
		GoodsVO vo = sqlSession.selectOne(NAMESPACE + ".getGoods", goods_no);
		
		return vo;
	}
	
	
	
	
	

	
	
	
}
