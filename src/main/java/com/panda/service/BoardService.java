package com.panda.service;

import com.panda.domain.BoardVO;

public interface BoardService {
	// 글 쓰기
	public void insertBoard(BoardVO vo)throws Exception;
}
