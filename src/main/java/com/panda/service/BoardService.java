package com.panda.service;

import java.util.List;
import java.util.Map;

import com.panda.domain.BoardVO;
import com.panda.domain.Criteria;

public interface BoardService {
	// 글 쓰기
	public void insertBoard(BoardVO vo)throws Exception;
	
	// 글 전체목록 조회
	public List<BoardVO> getBoardAll(Criteria cri)throws Exception;
	
	// 조회수 증가
	public void upReadCnt(Integer bno)throws Exception;
	
	// 글 내용 가져오기
	public BoardVO getContent(Integer bno)throws Exception;
	
	// 글 수정하기
	public Integer updateBoard(BoardVO vo)throws Exception;
	
	// 글 삭제하기
	public Integer deleteBoard(int bno)throws Exception;
	
	// 글 전체갯수 
	public Integer totalCnt()throws Exception;
	
	// 글 목록조회(카테고리)
	public List<BoardVO> getBoardCate(Map<String, Object> map)throws Exception;
	

	
	
}
