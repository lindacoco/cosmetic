package com.yi.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.manager.EmployeeVO;
import com.yi.domain.manager.UserVO;
import com.yi.persistence.manager.service.EmployeeService;
import com.yi.persistence.manager.service.UserService;


@Controller
/* @RequestMapping("/user/*") */
public class LoginController {
	
	@Autowired
	EmployeeService empService;
	
	@Autowired
	UserService userService;
	
	//로그인 view 화면
	@RequestMapping(value="loginForm",method = RequestMethod.GET)
	public String loginGet(String visible, String errorMsg, Model model){
		//로그인 실패했을 경우 div창이 보이도록 설정
		model.addAttribute("visible",visible);
		
		return "/";
	}
	
	//로그인 post 화면
	@RequestMapping(value="loginForm",method=RequestMethod.POST)
	public String loginPost(String id, String password, UserVO userVO, EmployeeVO empVO, Model model, HttpSession session) throws Exception {
		//사원테이블과 고객테이블이 나눠져 있으므로 동일 아이디가 있는지 비교 필요
		userVO.setUserid(id);
		userVO.setUserpass(password);
		empVO.setEmpid(id);
		empVO.setEmppass(password);

		//일치하는 값 찾기
		UserVO dbUserId = userService.readByIdUser(userVO.getUserid());
		UserVO dbUserIdPw = userService.readByIdPwUser(userVO.getUserid(),userVO.getUserpass());
		EmployeeVO dbEmpId = empService.readByIdEmployee(empVO.getEmpid());
		EmployeeVO dbEmpIdPw = empService.readByIdPwEmployee(empVO.getEmpid(),empVO.getEmppass());
		
		//직원아이디가 있는 경우
		if(dbEmpId!=null) {
			//퇴사한 직원인 경우
			if(dbEmpId.getEmpretired()==1) {
				model.addAttribute("error", "로그인 권한이 없습니다.");
				model.addAttribute("Employee", empVO);
				return "redirect:/"; //메인으로 돌려보내기
			}
			//비밀번호가 맞지않는 경우
			/* if(dbEmp.getEmppass().equals(empVO.getEmppass())==false) { */ //원래라면 이렇게 비교하지만 password로 쌓여져있으니까
			if(dbEmpIdPw==null) {
				model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
				model.addAttribute("Employee", empVO); 
				return "redirect:/LoginForm";
			}
			//전부 다 맞는 경우(직원)
			Map<String, Object> map = new HashMap<>();
			map.put("name", dbEmpIdPw.getEmpname());
			map.put("right", dbEmpIdPw.getEmpauth());
			session.setAttribute("Manager",map);
			session.setAttribute("Auth", dbEmpIdPw);//정보 다 가지고 있는거
			session.setAttribute("login", "manager");
			session.setAttribute("pass", password);
			session.setAttribute("mypage","mypageemp");
			return "redirect:/";
			
		//회원아이디가 있는 경우
		}else if(dbUserId!=null) {	
			//탈퇴한 회원인 경우
			if(dbUserId.getUsersecess() == 1) {
				model.addAttribute("error", "로그인 권한이 없습니다.");
				model.addAttribute("User", userVO);
				return "redirect:/LoginForm";
			}
			
			//회원 비밀번호가 맞지 않는 경우. 아이디 비밀번호를 같이 쓴건 비밀번호가 중복되는 회원이 있을까봐
			else if(dbUserIdPw==null){
				model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
				model.addAttribute("User", userVO); //비밀번호를 틀린경우에도 아이디 비밀번호를 남기기위해
				return "redirect:/LoginForm";
			}

			//전부 다 맞는 경우(회원)
			model.addAttribute("User", userVO);
			session.setAttribute("User",dbUserId.getUsername());
			session.setAttribute("login", "user");
			session.setAttribute("Auth", dbUserIdPw); //정보 다 가지고 있는거
			session.setAttribute("pass", password);
			session.setAttribute("mypage","mypageuser");
			/* return "redirect:/customer/tourlandMain"; */
			return "redirect:/";
			
		//아이디가 없는 경우	(직원,회원)
		}else{
			model.addAttribute("error", "아이디가 존재하지 않습니다.");
			model.addAttribute("User", userVO);
			model.addAttribute("Employee", empVO);
			return "/redirect:/LoginForm";
		}
	}

	//로그아웃
	@RequestMapping(value="logout",method = RequestMethod.GET)
	public String logoutGet(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
}
