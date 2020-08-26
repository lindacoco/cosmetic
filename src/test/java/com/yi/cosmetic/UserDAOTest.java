package com.yi.cosmetic;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.UserVO;
import com.yi.persistence.manager.dao.UserDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class UserDAOTest {
	
	@Autowired
	private UserDAO dao;
	
	@Test
	public void testDAO() {
		System.out.println(dao);
	}
	
	@Test
	public void test1insert() throws Exception {
		UserVO vo = new UserVO();
		vo.setUserno(3);
		vo.setUsername("조조");
		vo.setUserbirth("2000-01-01");
		vo.setUsertel("010-000-0111");
		vo.setUseraddr("어쩌구저쩌구중랑구");
		vo.setUserid("cherry");
		vo.setUserpass("cherry");
		

		dao.insertUser(vo);		
	}
	
	//@Test
	public void test2ReadByNo() throws Exception{
		dao.readByNoUser(1);
	}
    
	//@Test
	public void test3Update() throws Exception {
		UserVO vo = dao.readByNoUser(3);
		vo.setUsername("냐냐");
		vo.setUserid("dododo");
		vo.setUserpass("dododo");
		dao.updateUser(vo);
	}
	//@Test
	public void test4delete() throws Exception {
		dao.deleteUser(3);
		
	}
	
	//@Test
	public void test5ListCriteria() throws Exception{
		SearchCriteria cri = new SearchCriteria();
		cri.setKeyword("do");
		cri.setPage(1);
		cri.setPerPageNum(2);
		dao.listSearchCriteriaUser(cri, 0);
	}
	
	
	
}
