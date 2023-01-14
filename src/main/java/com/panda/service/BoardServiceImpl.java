package com.panda.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.panda.domain.BoardVO;
import com.panda.domain.Criteria;
import com.panda.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO dao;
	
	private static final Logger mylog 
			= LoggerFactory.getLogger(BoardServiceImpl.class);

	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		
		dao.insertBoard(vo);
	}

	@Override
	public List<BoardVO> getBoardAll(Criteria cri) throws Exception {
		
		return dao.getBoardAll(cri);
	}

	@Override
	public void upReadCnt(Integer bno) throws Exception {
		
		dao.upCnt(bno);
	}

	@Override
	public BoardVO getContent(Integer bno) throws Exception {
		
		
		return dao.getContent(bno);
	}

	@Override
	public Integer updateBoard(BoardVO vo) throws Exception {
		
		
		return dao.updateBoard(vo);
	}

	@Override
	public Integer deleteBoard(int bno) throws Exception {
		
		
		return dao.deleteBoard(bno);
	}

	@Override
	public Integer totalCnt() throws Exception {
		
		
		return dao.totalCnt();
	}

	@Override
	public List<BoardVO> getBoardCate(Map<String, Object> map) throws Exception {
		
		return dao.getBoardCate(map);
	}




//	@Override
//	public List<BoardVO> getBoardCate(Criteria cri, String category) {
//		
//		return dao.getBoardCate(cri, category);
//	}

}
