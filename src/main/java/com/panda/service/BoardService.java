package com.panda.service;

import java.util.List;

import com.panda.domain.BoardVO;

public interface BoardService {
	// 글 쓰기
	public void insertBoard(BoardVO vo)throws Exception;
	
	// 글 전체목록 조회
	public List<BoardVO> getBoardAll()throws Exception;
	
	// 조회수 증가
	public void upReadCnt(Integer bno)throws Exception;
	
	// 글 내용 가져오기
	public BoardVO getContent(Integer bno)throws Exception;
	
	// 글 수정하기
	public Integer updateBoard(BoardVO vo)throws Exception;
	
	
}
