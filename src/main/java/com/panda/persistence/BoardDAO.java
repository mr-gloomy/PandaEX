package com.panda.persistence;

import com.panda.domain.BoardVO;

public interface BoardDAO {
	
	// 글 쓰기
	public void insertBoard(BoardVO vo)throws Exception;
}
