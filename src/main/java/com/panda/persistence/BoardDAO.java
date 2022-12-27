package com.panda.persistence;

import java.util.List;

import com.panda.domain.BoardVO;

public interface BoardDAO {
	
	// 글 쓰기
	public void insertBoard(BoardVO vo)throws Exception;
	
	// 글 전체 목록 조회
	public List<BoardVO> getBoardAll()throws Exception;
	
	// 조회수 증가
	public void upCnt(Integer bno)throws Exception;
}
