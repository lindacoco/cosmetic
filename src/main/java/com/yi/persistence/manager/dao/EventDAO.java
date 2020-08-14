package com.yi.persistence.manager.dao;

import java.util.List;

import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.EventVO;


public interface EventDAO {
	public void insertEvent(EventVO vo) throws Exception;
	public EventVO readByNoEvent(int eno)throws Exception;
	public void updateEvent(EventVO vo)throws Exception;
	public void deleteEvent(int eno)throws Exception;
	public List<EventVO> listSearchCriteriaEvent(SearchCriteria cri)throws Exception;
	public int totalSearchCountEvent(SearchCriteria cri) throws Exception;
	
	
	
}
