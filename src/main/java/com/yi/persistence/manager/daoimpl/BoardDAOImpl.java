package com.yi.persistence.manager.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.BoardVO;
import com.yi.persistence.manager.dao.BoardDAO;


@Repository
public class BoardDAOImpl implements BoardDAO {
    private static final String namespace ="mappers.BoardMapper.";
    
    @Autowired
    private SqlSession sqlSession;
	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		sqlSession.insert(namespace+"insertBoard",vo);

	}

	@Override
	public BoardVO readByNoBoard(int bno) throws Exception {
		return sqlSession.selectOne(namespace+"readByNoBoard",bno);
	}

	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		sqlSession.update(namespace+"updateBoard",vo);

	}

	@Override
	public void deleteBoard(int bno) throws Exception {
		sqlSession.delete(namespace+"deleteBoard",bno);

	}

	@Override
	public List<BoardVO> listSearchCriteriaBoard(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listSearchCriteriaBoard",cri);
	}

	@Override
	public int totalSearchCountBoard(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace+"totalSearchCountBoard",cri);
	}

}
