package com.yi.persistence.manager.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.EventVO;
import com.yi.persistence.manager.dao.EventDAO;
@Repository
public class EventDAOImple implements EventDAO {
private static final String namespace ="mappers.EventMapper.";


@Autowired
private SqlSession sqlSession;

	@Override
	public void insertEvent(EventVO vo) throws Exception {
		sqlSession.insert(namespace+"insertEvent",vo);
	}

	@Override
	public EventVO readByNoEvent(int eno) throws Exception {
		return sqlSession.selectOne(namespace+"readByNoEvent",eno);
	}

	@Override
	public void updateEvent(EventVO vo) throws Exception {
		sqlSession.update(namespace+"updateEvent",vo);

	}

	@Override
	public void deleteEvent(int eno) throws Exception {
		sqlSession.delete(namespace+"deleteEvent",eno);

	}

	@Override
	public List<EventVO> listSearchCriteriaEvent(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listSearchCriteriaEvent",cri);
	}

	@Override
	public int totalSearchCountEvent(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace+"totalSearchCountEvent",cri);
	}

}
