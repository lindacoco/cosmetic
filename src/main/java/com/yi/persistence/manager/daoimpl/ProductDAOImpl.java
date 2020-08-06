package com.yi.persistence.manager.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.ProductVO;
import com.yi.persistence.manager.dao.ProductDAO;

@Repository
public class ProductDAOImpl implements ProductDAO {
private static final String namespace ="mappers.ProductMapper.";

@Autowired
private SqlSession sqlSession;

		@Override
		public void insertProduct(ProductVO vo) throws Exception {
			sqlSession.insert(namespace+"insertProduct",vo);
			
		}
		
		@Override
		public ProductVO readByNoProduct(int pno) throws Exception {
			return sqlSession.selectOne(namespace+"readByNoProduct",pno);
		}
		
		@Override
		public void updateProduct(ProductVO vo) throws Exception {
			sqlSession.update(namespace+"updateProduct",vo);
			
		}
		
		@Override
		public void deleteProduct(int pno) throws Exception {
			sqlSession.delete(namespace+"deleteProduct",pno);
			
		}
		
		@Override
		public List<ProductVO> listSearchCriteriaProduct(SearchCriteria cri) throws Exception {
			
			return sqlSession.selectList(namespace+"listSearchCriteriaProduct",cri);
		}
		
		@Override
		public int totalSearchCountProduct(SearchCriteria cri) throws Exception {
			
			return sqlSession.selectOne(namespace+"totalSearchCountProduct",cri);
		}

		@Override
		public List<ProductVO> listByRank(int psale) throws Exception {
			return sqlSession.selectList(namespace+"listByRank",psale);
		}


}
