package com.yi.persistence.manager.dao;

import java.util.List;

import com.yi.domain.Criteria;
import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.ProductVO;


public interface ProductDAO {
	public void insertProduct(ProductVO vo) throws Exception;
	public ProductVO readByNoProduct(int pno)throws Exception;
	public void updateProduct(ProductVO vo)throws Exception;
	public void deleteProduct(int pno)throws Exception;
	public List<ProductVO> listSearchCriteriaProduct(SearchCriteria cri)throws Exception;
	public int totalSearchCountProduct(SearchCriteria cri) throws Exception;
	
	
	// 상품 판매 순위
	public List<ProductVO> listByRank(int psale) throws Exception;
	
}
