package com.panda.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.panda.domain.GoodsVO;
import com.panda.persistence.GoodsDAO;

@Service
public class GoodsServiceImpl  implements GoodsService {

	// 객체 로거 정보
	private static final Logger mylog = LoggerFactory.getLogger(GoodsServiceImpl.class);
	
	@Autowired
	private GoodsDAO Gdao;

	@Override
	public void insertGoods(GoodsVO gvo) throws Exception {
		mylog.debug("insertGoods(GoodsVO gvo) 호출 ->  DAO 동작 호출");
		
		Gdao.createGoods(gvo);
		
		mylog.debug(" 글쓰기 완료 -> 컨트롤러 이동 ");
	}

	
	
	
}
