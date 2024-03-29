package com.yi.cosmetic;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.Criteria;
import com.yi.domain.manager.EmployeeVO;
import com.yi.persistence.manager.dao.EmployeeDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class EmployeeDAOTest {
	
	@Autowired
	private EmployeeDAO dao;
	
	@Test
	public void testDAO() {
		System.out.println(dao);
	}
	
	@Test
	public void test1insert() throws Exception {
		EmployeeVO vo = new EmployeeVO();
		vo.setEmpno(4);
		vo.setEmpname("정소윤");
		vo.setEmpbirth("2010-02-13");
		vo.setEmptel("010-4334-4321");
		vo.setEmpaddr("서울어딘가");
		vo.setEmpid("apple");
		vo.setEmppass("apple");
		vo.setEmpauth("C");
		

		dao.insertEmployee(vo);		
	}
	
	@Test
	public void test2ReadByNo() throws Exception{
		EmployeeVO vo = dao.readByNoEmployee(4);
		System.out.println(vo);
	}
    
	@Test
	public void test3Update() throws Exception {
		EmployeeVO vo = dao.readByNoEmployee(4);
		vo.setEmpname("코코넛");	
		dao.updateEmployee(vo);
		System.out.println(vo);
	}
	@Test
	public void test4delete() throws Exception {
		dao.deleteEmployee(9);
	}
	
	@Test
	public void test5ListCriteria() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(3); //다섯개만 
		dao.listCriteriaEmployee(cri,0);
	}
	
	
	
}
