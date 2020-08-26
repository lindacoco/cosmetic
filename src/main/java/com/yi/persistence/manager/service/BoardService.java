package com.yi.persistence.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.BoardVO;
import com.yi.persistence.manager.dao.BoardDAO;

@Service
public class BoardService {
    @Autowired
	private BoardDAO dao;
	
	public void insertBoard(BoardVO vo) throws Exception {
		dao.insertBoard(vo);

	}

	
	public BoardVO readByNoBoard(int bno) throws Exception {
        return dao.readByNoBoard(bno);
	}

	
	public void updateBoard(BoardVO vo) throws Exception {
		dao.updateBoard(vo);

	}

	
	public void deleteBoard(int bno) throws Exception {
		dao.deleteBoard(bno);

	}

	
	public List<BoardVO> listSearchCriteriaBoard(SearchCriteria cri) throws Exception {
        return dao.listSearchCriteriaBoard(cri);
	}

	
	public int totalSearchCountBoard(SearchCriteria cri) throws Exception {
        return dao.totalSearchCountBoard(cri);
	}

}
