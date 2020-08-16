package com.yi.persistence.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.Criteria;
import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.UserVO;
import com.yi.persistence.manager.dao.UserDAO;

@Service
public class UserService {
	
	@Autowired
	UserDAO dao;
	
	
	public void insertUser(UserVO vo) throws Exception {
		dao.insertUser(vo);

	}

	
	public void updateUser(UserVO vo) throws Exception {
		dao.updateUser(vo);

	}

	
	public UserVO readByNoUser(int userno) throws Exception {
        return dao.readByNoUser(userno);
	}

	
	public void deleteUser(int userno) throws Exception {
		dao.deleteUser(userno);

	}
	
	
	public List<UserVO> listCriteriaUser(Criteria cri,int usersecess) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri",cri);
		map.put("usersecess",usersecess);
		return dao.listCriteriaUser(cri, usersecess);
	}


	
	public int totalCountUser(int usersecess) throws Exception {
        return dao.totalCountUser(usersecess);
	}
	

	
	public List<UserVO> listSearchCriteriaUser(SearchCriteria cri, int usersecess) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri",cri);
		map.put("usersecess",usersecess);
		
		return dao.listSearchCriteriaUser(cri, usersecess);
	}

	
	public int totalSearchCountUser(SearchCriteria cri, int usersecess) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri",cri);
		map.put("usersecess",usersecess);
		return dao.totalSearchCountUser(cri, usersecess);
	}

	//아이디 중복 체크 위함 
	public UserVO readByIdUser(String userid) throws Exception {
		return dao.readByIdUser(userid);
	}
	public UserVO readByIdPwUser(String userid,String userpass) throws Exception {
		return dao.readByIdPwUser(userid,userpass);
	}
	
	

}
