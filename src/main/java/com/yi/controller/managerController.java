package com.yi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.PageMaker;
import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.EmployeeVO;
import com.yi.persistence.manager.service.EmployeeService;

@Controller
public class managerController {
	
	@Autowired
	private EmployeeService employeeService;

	
	@RequestMapping(value ="/employeeList/{empretired}", method = RequestMethod.GET)
	public String employeeList(SearchCriteria cri, Model model, @PathVariable("empretired") int empretired) throws Exception {
		List<EmployeeVO> empList = employeeService.listSearchCriteriaEmployee(cri, empretired);
		System.out.println(empList.get(0));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(employeeService.totalSearchCountEmployee(cri, empretired));
		
		
		model.addAttribute("cri",cri);
		model.addAttribute("list",empList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("empretired", empretired);
        
		// 같은 페이지를 공유하기에 버튼이름 변경을 위한 model값 선언
				if (empretired == 1) {
					model.addAttribute("btnName", "근무사원 리스트");
				} else {
					model.addAttribute("btnName", "퇴사사원 조회");
				}
		return "manager/employee/employeeList";
		
	}
	
	// 사원 리스트 클릭했을 때 자세한 정보 보기로 넘어가기
		@RequestMapping(value = "employeeDetail/{empretired}", method = RequestMethod.GET)
		public String employeeDetail(EmployeeVO vo, SearchCriteria cri, Model model,
				@PathVariable("empretired") int empretired, HttpSession session) throws Exception {
			vo = employeeService.readByNoEmployee(vo.getEmpno());
			model.addAttribute("empVO", vo);
			model.addAttribute("cri", cri);
			model.addAttribute("empretired", empretired);
			return "manager/employee/employeeDetailForm";
		}
	
	
	
	
	
	
	
	
	
	
	
	
}
