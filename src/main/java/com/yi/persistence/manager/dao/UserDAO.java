package com.yi.persistence.manager.dao;

import java.util.List;

import com.yi.domain.Criteria;
import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.UserVO;


public interface UserDAO {
	public void insertUser(UserVO vo) throws Exception;
	public UserVO readByNoUser(int userno)throws Exception;
	public void updateUser(UserVO vo)throws Exception;
	public void deleteUser(int userno)throws Exception;
	public List<UserVO> listCriteriaUser(Criteria cri, int usersecess)throws Exception;
    public int totalCountUser(int usersecess) throws Exception;
	public List<UserVO> listSearchCriteriaUser(SearchCriteria cri, int usersecess)throws Exception;
	public int totalSearchCountUser(SearchCriteria cri, int usersecess) throws Exception;
	
	//아이디 체크를 위해 생성
	public UserVO readByIdUser(String userid)throws Exception;
	public UserVO readByIdPwUser(String userid,String userpass)throws Exception;
	// 리플 기능 필요한 곳에서
	// public void updateReplyCnt(int amount, int bno)throws Exception;
	
}
