package com.yi.persistence.manager.dao;

import java.util.List;

import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.BoardVO;

public interface BoardDAO {
	public void insertBoard(BoardVO vo) throws Exception;
	public BoardVO readByNoBoard(int bno)throws Exception;
	public void updateBoard(BoardVO vo)throws Exception;
	public void deleteBoard(int bno)throws Exception;
	public List<BoardVO> listSearchCriteriaBoard(SearchCriteria cri)throws Exception;
	public int totalSearchCountBoard(SearchCriteria cri) throws Exception;
	
}
