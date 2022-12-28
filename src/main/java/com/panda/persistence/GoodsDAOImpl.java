package com.panda.persistence;

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
	
	@Override
	public String getTime() {
		return sqlSession.selectOne(NAMESPACE+".getTime");
	}

	@Override
	public void createGoods(GoodsVO gvo) throws Exception {
		mylog.debug("createGoods(GoodsVO gvo) -> mapper 동작 호출");
		
		sqlSession.insert(NAMESPACE +".createGoods", gvo);
		
		mylog.debug("글쓰기 완료 -> 서비스");
	}

	
	
	
}
