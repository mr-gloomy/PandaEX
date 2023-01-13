package com.panda.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.panda.domain.BoardVO;
import com.panda.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	// mapper NAMESPACE 정보
	private static final String NAMESPACE
			= "com.panda.mapper.BoardMapper";
	
	
	private static final Logger mylog
		= LoggerFactory.getLogger(BoardDAOImpl.class);

	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		
		sqlSession.insert(NAMESPACE+".createBoard",vo);
	}

	@Override
	public List<BoardVO> getBoardAll(Criteria cri) throws Exception {
		mylog.debug(" DAO : 글 전체목록 실행");
		
//		List<BoardVO> boardList = sqlSession.selectList(NAMESPACE+".listAll");
		
//		mylog.debug(" 글 갯수 : "+boardList.size());
		
		return sqlSession.selectList(NAMESPACE+".listAll",cri);
	}

	@Override
	public void upCnt(Integer bno) throws Exception {
		mylog.debug(" 조회수 증가 실행");
		
		
		sqlSession.update(NAMESPACE+".cnt",bno);
		
	}

	@Override
	public BoardVO getContent(Integer bno) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".content", bno);
	}

	@Override
	public Integer updateBoard(BoardVO vo) throws Exception {
		Integer result = sqlSession.update(NAMESPACE+".modBoard", vo);
		
		return result;
	}

	@Override
	public Integer deleteBoard(int bno) {
		
		Integer result = sqlSession.delete(NAMESPACE+".remBoard", bno);
		
		return result;
	}

	@Override
	public Integer totalCnt() throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".countBoard");
	}

	@Override
	public List<BoardVO> getBoardCate(Map<String, Object> map) {
		
		return sqlSession.selectList(NAMESPACE+".listcate", map);
	}



//	@Override
//	public Map<K, V> getBoardCate(Criteria cri, String category) {
//		
//		return sqlSession.selectMap(NAMESPACE+"", cri, category);
//	}

}
