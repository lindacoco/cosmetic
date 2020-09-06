package com.yi.persistence.manager.dao;

import java.util.List;

import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.ReviewVO;


public interface ReviewDAO {
	public void insertReview(ReviewVO vo) throws Exception;
	public List<ReviewVO> readByNoReview(int pno)throws Exception;
	public void updateReview(ReviewVO vo)throws Exception;
	public void deleteReview(int rno)throws Exception;
	public List<ReviewVO> listSearchCriteriaReview(int pno, SearchCriteria cri)throws Exception;
	public int totalSearchCountReview(int pno, SearchCriteria cri) throws Exception;
	
	
	
	
}
