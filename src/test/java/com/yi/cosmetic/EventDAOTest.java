package com.yi.cosmetic;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.Criteria;
import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.EventVO;
import com.yi.persistence.manager.dao.EventDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class EventDAOTest {
	
	@Autowired
	private EventDAO dao;
	
	@Test
	public void testDAO() {
		System.out.println(dao);
	}
	
	@Test
	public void test1insert() throws Exception {
		EventVO vo = new EventVO();
		vo.setEno(4);
		vo.setEtitle("신규가입 이벤트");
		vo.setEpic("aa");
		vo.setEstartdate("2020-10-01");
		vo.setEenddate("2022-01-03");

	    dao.insertEvent(vo);
	}
	
	@Test
	public void test2ReadByNo() throws Exception{
		EventVO vo = dao.readByNoEvent(4);
	}
    
	@Test
	public void test3Update() throws Exception {
		EventVO vo = dao.readByNoEvent(4);
		vo.setEtitle("수정하는건");
		
		dao.updateEvent(vo);
	}
	@Test
	public void test4delete() throws Exception {
		dao.deleteEvent(3);
	}
	
	@Test
	public void test5ListCriteria() throws Exception{
		SearchCriteria cri = new SearchCriteria();
		cri.setKeyword("신규");
		cri.setPage(1);
		cri.setPerPageNum(2);
		
		dao.listSearchCriteriaEvent(cri);
	}
	
	
	
}
