package com.yi.persistence.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.Criteria;
import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.EmployeeVO;
import com.yi.persistence.manager.dao.EmployeeDAO;

@Service
public class EmployeeService {
	
	@Autowired
	EmployeeDAO dao;
	
	
	public void insertEmployee(EmployeeVO vo) throws Exception {
		dao.insertEmployee(vo);

	}

	
	public void updateEmployee(EmployeeVO vo) throws Exception {
		dao.updateEmployee(vo);

	}

	
	public EmployeeVO readByNoEmployee(int empno) throws Exception {
        return dao.readByNoEmployee(empno);
	}

	
	public void deleteEmployee(int empno) throws Exception {
		dao.deleteEmployee(empno);

	}
	
	
	public List<EmployeeVO> listCriteriaEmployee(Criteria cri,int empretired) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri",cri);
		map.put("empretired",empretired);
		return dao.listCriteriaEmployee(cri, empretired);
	}


	
	public int totalCountEmployee(int empretired) throws Exception {
        return dao.totalCountEmployee(empretired);
	}
	

	
	public List<EmployeeVO> listSearchCriteriaEmployee(SearchCriteria cri, int empretired) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri",cri);
		map.put("empretired",empretired);
		
		return dao.listSearchCriteriaEmployee(cri, empretired);
	}

	
	public int totalSearchCountEmployee(SearchCriteria cri, int empretired) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri",cri);
		map.put("empretired",empretired);
		return dao.totalSearchCountEmployee(cri, empretired);
	}

	//아이디 중복 체크 위함 
	public EmployeeVO readByIdEmployee(String empid) throws Exception {
		return dao.readByIdEmployee(empid);
	}
	public EmployeeVO readByIdPwEmployee(String empid,String emppass) throws Exception {
		return dao.readByIdPwEmployee(empid,emppass);
	}
	
	

}
