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
import com.yi.domain.manager.EventVO;
import com.yi.domain.manager.ProductVO;
import com.yi.persistence.manager.service.EmployeeService;
import com.yi.persistence.manager.service.EventService;
import com.yi.persistence.manager.service.ProductService;

@Controller
public class managerController {
	
	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private ProductService productService;
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping(value ="/employeeList/{empretired}", method = RequestMethod.GET)
	public String employeeList(SearchCriteria cri, Model model, @PathVariable("empretired") int empretired) throws Exception {
		List<EmployeeVO> empList = employeeService.listSearchCriteriaEmployee(cri, empretired);
		//System.out.println(empList.get(0));
		
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
	
	//사원 등록하기
		@RequestMapping(value = "empAdd", method = RequestMethod.GET)
		public String empAdd(SearchCriteria cri, Model model) throws Exception {
			
			int lastEmpNo = 0;
			
			List<EmployeeVO> list1 =  employeeService.listCriteriaEmployee(cri,0);
			List<EmployeeVO> list2 =  employeeService.listCriteriaEmployee(cri,1);
			
			if(list1.size() == 0) {
				lastEmpNo = 1;
			}
			if(list1.size() != 0) {
			   int lastNo = employeeService.listCriteriaEmployee(cri,0).get(0).getEmpno();
			   lastEmpNo = lastNo +1 ;
			   
			   if(list2.size() !=0) {
					int lastNo2 = employeeService.listCriteriaEmployee(cri,1).get(0).getEmpno();
					
					if(lastNo> lastNo2) {
						lastEmpNo = lastNo +1 ;
					  }else {
						  lastEmpNo = lastNo2 +1;
					  }
					}
		    	}
			;
			model.addAttribute("cri", cri);
			model.addAttribute("lastNo", lastEmpNo);
			return "manager/employee/employeeRegisterForm";
		}
	
	
		@RequestMapping(value = "empAdd", method = RequestMethod.POST)
		public String empAddPost(EmployeeVO vo, SearchCriteria cri, Model model) throws Exception {
			System.out.println(vo);
			employeeService.insertEmployee(vo);
			
			return "redirect:employeeDetail/"+vo.getEmpretired()+"?empno="+vo.getEmpno();
		}
		
		@RequestMapping(value = "employeeUpdate/{empretired}", method = RequestMethod.POST)
		public String employeeUpdate(EmployeeVO vo, SearchCriteria cri, Model model,
				@PathVariable("empretired") int empretired, HttpSession session) throws Exception {
			System.out.println(vo);
			employeeService.updateEmployee(vo);
			model.addAttribute("success", "수정이 완료되었습니다.");
			model.addAttribute("empVO", vo);
			model.addAttribute("cri", cri);
			model.addAttribute("empretired", empretired);
			return "redirect:/employeeDetail/"+vo.getEmpretired()+"?empno="+vo.getEmpno();
		}
	
		@RequestMapping(value = "employeeDelete", method = RequestMethod.GET)
		public String employeeDelete(int empno, SearchCriteria cri, Model model) throws Exception {
			//System.out.println(empno);
			EmployeeVO vo = employeeService.readByNoEmployee(empno);
			vo.setEmpretired(1);
			employeeService.updateEmployee(vo);
			
			return "redirect:employeeList/0";
		}
	
	// 상품
		@RequestMapping(value = "productList",method = RequestMethod.GET)
		public String productList(SearchCriteria cri, Model model) throws Exception{
			List<ProductVO> list = productService.listSearchCriteriaProduct(cri);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(productService.totalSearchCountProduct(cri));
			
			if(cri.getKeyword() !="") {
				model.addAttribute("keyword",cri.getKeyword());
			}
			model.addAttribute("cri",cri);
			model.addAttribute("pageMaker",pageMaker);
			model.addAttribute("list",list);
			
			model.addAttribute("btnName","재고부족 상품");
			
			return "manager/product/productList";
			
		}
	
	// 이벤트 리스트
		@RequestMapping(value = "eventList", method = RequestMethod.GET)
		public String eventList(SearchCriteria cri, Model model) throws Exception{
			List<EventVO> eList = eventService.listSearchCriteriaEvent(cri);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(productService.totalSearchCountProduct(cri));
			
			if(cri.getKeyword() !="") {
				model.addAttribute("keyword",cri.getKeyword());
			}
			model.addAttribute("cri",cri);
			model.addAttribute("pageMaker",pageMaker);
			model.addAttribute("list",eList);
			
			model.addAttribute("btnName","종료된 이벤트");
		   
			
			return "manager/event/eventList";
		}
		
	
	
	
}
