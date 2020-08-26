package com.yi.cosmetic;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.manager.BoardVO;
import com.yi.domain.manager.UserVO;
import com.yi.persistence.manager.dao.BoardDAO;
import com.yi.persistence.manager.dao.UserDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class BoardDAOTest {
	
	@Autowired
	private BoardDAO dao;
	
	@Autowired
	private UserDAO userdao;
	
	@Test
	public void testDAO() {
		System.out.println(dao);
	}
	
	@Test
	public void test1insert() throws Exception {
		BoardVO vo = new BoardVO();
		
		
		UserVO user = userdao.readByNoUser(3);
		vo.setBno(2);
		vo.setBtitle("냐냐");
		vo.setBwriter(user.getUsername());
		vo.setBcontent("어쩌구저쩌구");
		
		dao.insertBoard(vo);
		
	}
	
	@Test
	public void test2ReadByNo() throws Exception{
	    dao.readByNoBoard(2);
	}
    
	@Test
	public void test3Update() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setBtitle("루루루");
	    vo.setBcontent("힘들구먼");
	    
	    dao.updateBoard(vo);
	
	}
	@Test
	public void test4delete() throws Exception {
	
	}
	
	@Test
	public void test5ListCriteria() throws Exception{
		
	}
	
	
	
}
