package com.yi.persistence.manager.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.Criteria;
import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.UserVO;
import com.yi.persistence.manager.dao.UserDAO;
@Repository
public class UserDAOImpl implements UserDAO {
    private static final String namespace = "mappers.UserMapper.";
    
    @Autowired
    private SqlSession sqlSesson;
    
	@Override
	public void insertUser(UserVO vo) throws Exception {
	    sqlSesson.insert(namespace+"insertUser",vo);

	}

	@Override
	public UserVO readByNoUser(int userno) throws Exception {
		return sqlSesson.selectOne(namespace+"readByNoUser",userno);
	}

	@Override
	public void updateUser(UserVO vo) throws Exception {
		sqlSesson.update(namespace+"updateUser",vo);
	}

	@Override
	public void deleteUser(int userno) throws Exception {
        sqlSesson.delete(namespace+"deleteUser",userno);
		
	}

	@Override
	public List<UserVO> listCriteriaUser(Criteria cri, int usersecess) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri",cri);
		map.put("usersecess",usersecess);
		return sqlSesson.selectList(namespace+"listCriteriaUser",map);
	}

	@Override
	public int totalCountUser(int usersecess) throws Exception {
		return sqlSesson.selectOne(namespace+"totalCountUser",usersecess);
	}

	@Override
	public List<UserVO> listSearchCriteriaUser(SearchCriteria cri, int usersecess) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri",cri);
		map.put("usersecess",usersecess);
        return sqlSesson.selectList(namespace+"listSearchCriteriaUser",map);
	}

	@Override
	public int totalSearchCountUser(SearchCriteria cri, int usersecess) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri",cri);
		map.put("usersecess",usersecess);
		return sqlSesson.selectOne(namespace+"totalSearchCountUser",map);
	}

	@Override
	public UserVO readByIdUser(String userid) throws Exception {
		return sqlSesson.selectOne(namespace+"readByIdUser",userid);
	}

	@Override
	public UserVO readByIdPwUser(String userid, String userpass) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid",userid);
		map.put("userpass",userpass);
       return sqlSesson.selectOne(namespace+"readByIdPwUser",map);
	}

}
