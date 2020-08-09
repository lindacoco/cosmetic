package com.yi.persistence.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.ProductVO;
import com.yi.persistence.manager.dao.ProductDAO;

@Service
public class ProductService {
   @Autowired
	ProductDAO dao; 
   
   
	public void insertProduct(ProductVO vo) throws Exception {
		dao.insertProduct(vo);
		
	}
	
	
	public ProductVO readByNoProduct(int pno) throws Exception {
		return dao.readByNoProduct(pno);
	}
	
	
	public void updateProduct(ProductVO vo) throws Exception {
		dao.updateProduct(vo);
		
	}
	
	
	public void deleteProduct(int pno) throws Exception {
		dao.deleteProduct(pno);
		
	}
	
	
	public List<ProductVO> listSearchCriteriaProduct(SearchCriteria cri) throws Exception {
		return dao.listSearchCriteriaProduct(cri);
	}
	
	
	public int totalSearchCountProduct(SearchCriteria cri) throws Exception {
        return dao.totalSearchCountProduct(cri);
	}


	public List<ProductVO> listByRank(int psale) throws Exception {
		return dao.listByRank(psale);
	}

   
}
