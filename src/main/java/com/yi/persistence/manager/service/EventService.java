package com.yi.persistence.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.EventVO;
import com.yi.persistence.manager.dao.EventDAO;

@Service
public class EventService {
    @Autowired
	EventDAO dao;
	
	
	public void insertEvent(EventVO vo) throws Exception {
		dao.insertEvent(vo);
	}

	
	public EventVO readByNoEvent(int eno) throws Exception {
		return dao.readByNoEvent(eno);
	}

	
	public void updateEvent(EventVO vo) throws Exception {
		dao.updateEvent(vo);

	}

	
	public void deleteEvent(int eno) throws Exception {
		dao.deleteEvent(eno);

	}

	
	public List<EventVO> listSearchCriteriaEvent(SearchCriteria cri) throws Exception {
	    return dao.listSearchCriteriaEvent(cri);	
	
	}

	
	public int totalSearchCountEvent(SearchCriteria cri) throws Exception {
        return dao.totalSearchCountEvent(cri);
	
	}

}
