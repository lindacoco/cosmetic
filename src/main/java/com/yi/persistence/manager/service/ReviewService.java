package com.yi.persistence.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.ReviewVO;
import com.yi.persistence.manager.dao.ReviewDAO;

@Service
public class ReviewService {
	
	@Autowired
	ReviewDAO dao;
	
	
	public void insertReview(ReviewVO vo) throws Exception {
		dao.insertReview(vo);

	}

	
	public List<ReviewVO> readByNoReview(int pno) throws Exception {
		return dao.readByNoReview(pno);
	}

	
	public void updateReview(ReviewVO vo) throws Exception {
		dao.updateReview(vo);

	}

	
	public void deleteReview(int no) throws Exception {
		dao.deleteReview(no);;

	}

	
	public List<ReviewVO> listSearchCriteriaReview(int pno, SearchCriteria cri) throws Exception {
	   return  dao.listSearchCriteriaReview(pno, cri);
	}

	
	public int totalSearchCountReview(int pno, SearchCriteria cri) throws Exception {
			
		return dao.totalSearchCountReview(pno, cri);
	}

}
