package com.yi.cosmetic;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.ProductVO;
import com.yi.persistence.manager.dao.ProductDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ProductDAOTest {

	@Autowired
	private ProductDAO dao;
	
	@Test
	public void testDAO() {
		System.out.println(dao);
	}
	
	//@Test
	public void test1insert() throws Exception {
		ProductVO vo = new ProductVO();
	    vo.setPno(3);
	    vo.setPname("coconut island handcream");
	    vo.setPcontent("코코넛향 핸드크림");
	    vo.setPprice(10000);
	    vo.setPdiv("A");
	    vo.setPevent(1); //이벤트 상품이다
	    vo.setPstock(20);
	    
	    dao.insertProduct(vo);

	}
	
	@Test
	public void test2ReadByNo() throws Exception{
		dao.readByNoProduct(3);
	}
	
	@Test
	public void test3update() throws Exception{
		ProductVO vo = dao.readByNoProduct(3);
		vo.setPprice(15000);
		vo.setPstock(vo.getPstock()-1);
		
		dao.updateProduct(vo);
		
	}
	
	@Test
	public void test4getList() throws Exception{
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setPerPageNum(2);
	    dao.listSearchCriteriaProduct(cri);
	}
	
	@Test
	public void test5Delete() throws Exception{
		ProductVO vo = new ProductVO();
		vo.setPno(3);
		dao.deleteProduct(vo.getPno());
	}
	

}
