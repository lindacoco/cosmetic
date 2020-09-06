package com.yi.persistence.manager.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.ReviewVO;
import com.yi.persistence.manager.dao.ReviewDAO;
@Repository
public class ReviewDAOImpl implements ReviewDAO {
private static final String namespace ="Mappers.ReviewMapper.";


@Autowired
private SqlSession sqlSession;

	@Override
	public void insertReview(ReviewVO vo) throws Exception {
		sqlSession.insert(namespace+"insertReview",vo);

	}

	@Override
	public List<ReviewVO> readByNoReview(int pno) throws Exception {
		return sqlSession.selectList(namespace+"readByNoReview", pno);
	}

	@Override
	public void updateReview(ReviewVO vo) throws Exception {
		sqlSession.update(namespace+"updateReview",vo);

	}

	@Override
	public void deleteReview(int no) throws Exception {
		sqlSession.delete(namespace+"deleteReview",no);

	}

	@Override
	public List<ReviewVO> listSearchCriteriaReview(int pno, SearchCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno",pno);
		map.put("cri",cri);
				
		return sqlSession.selectList(namespace+"listSearchCriteriaReview",map);
	}

	@Override
	public int totalSearchCountReview(int pno, SearchCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno",pno);
		map.put("cri",cri);
				
		return sqlSession.selectOne(namespace+"totalSearchCountReview",map);
	}

}
