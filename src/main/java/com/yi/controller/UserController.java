package com.yi.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.UserVO;
import com.yi.persistence.manager.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "/user/userHome";
	}
	
	//등록
	@RequestMapping(value = "/userAdd", method = RequestMethod.POST)
	public String userAdd(String username1, String username2, String userid, String userpass, Model model, SearchCriteria cri) throws Exception {
		//고객
		List<UserVO> list=userService.listSearchCriteriaUser(cri, 0);
		//탈퇴고객
		List<UserVO> list2=userService.listSearchCriteriaUser(cri, 1); 
		int realLastNo =0;
		
		if(list.size() != 0) {
			
			int LastNo =  list.get(0).getUserno();
			
			if(list2.size() != 0) {
				int LastNo2 = list2.get(0).getUserno();
				if(LastNo > LastNo2) {
					realLastNo = LastNo+1;
				}else {
					realLastNo = LastNo2+1;
				}
			}else {
				realLastNo = LastNo+1;
			}
			
		}else {
			 realLastNo =1;
		}
		
		UserVO userVo = new UserVO();
		userVo.setUserno(realLastNo);
		userVo.setUsername(username1+" "+username2);
		userVo.setUserid(userid);
		userVo.setUserpass(userpass);
		
		try{
			userService.insertUser(userVo);
			model.addAttribute("sucess","sucess");
		}catch (Exception e) {
			System.out.println("등록오류");
		}
		
		
		return "/user/userHome";
	}
	
	
	
}
