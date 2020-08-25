package com.yi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.yi.domain.PageMaker;
import com.yi.domain.SearchCriteria;
import com.yi.domain.manager.EmployeeVO;
import com.yi.domain.manager.EventVO;
import com.yi.domain.manager.ProductVO;
import com.yi.domain.manager.UserVO;
import com.yi.persistence.manager.service.EmployeeService;
import com.yi.persistence.manager.service.EventService;
import com.yi.persistence.manager.service.ProductService;
import com.yi.persistence.manager.service.UserService;
import com.yi.util.UploadFileUtils;

@Controller
public class managerController {
	@Resource(name ="uploadPathEvent")   
	private String uploadPathEvent;
	
	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private ProductService productService;
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private UserService userService;
	
	// c드라이브에 있는 이미지에 대한 데이터를 직접 가져와야한다. ajax용으로 처리됨
	@ResponseBody
	@RequestMapping(value = "displayFile/{whichOne}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String filename,@PathVariable("whichOne") String choice, HttpServletRequest request) {
		ResponseEntity<byte[]> entity = null;
        String path = null;
        
        if(choice.equals("event")) {
        	path = uploadPathEvent;
        }
        
		/*
		 * if(choice.equals("popup")) { path = uploadPathPopup; }
		 * 
		 * if(choice.contentEquals("product") || choice.contentEquals("productSmall")) {
		 * path = uploadPathProduct; }
		 */
        
        if(choice.equals("coscos")) {
        	path= "/cosmetic/resources/images/coscos";
        }
//		System.out.println("displayFile-----------"+ filename);
		InputStream in = null;
		try {
			
	//		System.out.println("path=="+path);
			if(choice.contentEquals("productSmall")) {
				if(filename!="") filename = filename.substring(0, 12) + "s_" + filename.substring(12);
			}
			in = new FileInputStream(path + filename); // 파일개체는 오류처리하라고..
			String format = filename.substring(filename.lastIndexOf(".") + 1); // 파일 확장자 뽑아내기 점 빼고
			MediaType mType = null;

			if (format.equalsIgnoreCase("png")) {
				mType = MediaType.IMAGE_PNG;
			} else if (format.equalsIgnoreCase("jpg") || format.equalsIgnoreCase("jpeg")) {
				mType = MediaType.IMAGE_JPEG;
			} else if (format.equalsIgnoreCase("GIF")) {
				mType = MediaType.IMAGE_GIF;
			}
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(mType);

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);

			in.close();

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	//ckEditor 이미지 업로드용
	@ResponseBody
	@RequestMapping(value = "imageUpload", method = RequestMethod.POST)
	public String imageUpload(HttpServletRequest req, HttpServletResponse resp, 
	    MultipartHttpServletRequest multiFile, Model model,String ckEditorFuncNum) throws Exception {
		JsonObject json = new JsonObject();
	    PrintWriter printWriter = null;
		MultipartFile file = multiFile.getFile("upload");
		if(file !=null && file.getSize() > 0) { 
	      try {
				printWriter = resp.getWriter();
				resp.setContentType("text/html");
				String serverPath =req.getContextPath()+"/manager/displayFile/coscos?filename=";
				//String serverPath ="localhost:8080/tourland/displayFile/practice?filename=";
				String serverPath2 =req.getContextPath()+"/resources/images/coscos";
				String savedName = UploadFileUtils.uploadFile(serverPath2, file.getOriginalFilename().replaceAll(" ", "_"),
				file.getBytes());
				String bigSizePic = savedName.substring(0, 12) + savedName.substring(14);
				
				json.addProperty("uploaded", 1);
	            json.addProperty("fileName", file.getOriginalFilename());
	            json.addProperty("url", serverPath+bigSizePic);
	            printWriter.println(json);
	            
				}catch (Exception e) {
					e.printStackTrace();
				}finally {
				    if(printWriter != null) {
					    printWriter.close();
					 }
				   }
				}
	       return null;
	   }	
	
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
			pageMaker.setTotalCount(eventService.totalSearchCountEvent(cri));
			
			if(cri.getKeyword() !="") {
				model.addAttribute("keyword",cri.getKeyword());
			}
			model.addAttribute("cri",cri);
			model.addAttribute("pageMaker",pageMaker);
			model.addAttribute("list",eList);
			
			model.addAttribute("btnName","종료된 이벤트");
		   
			
			return "manager/event/eventList";
		}
    @RequestMapping(value = "eventRegister", method = RequestMethod.GET)
	public String EventRegister(SearchCriteria cri, Model model) {
		int lastNo = 0;
		try {
			List<EventVO> eventList = eventService.listSearchCriteriaEvent(cri);
			lastNo = eventList.get(0).getEno() + 1;
		} catch (Exception e) {
			lastNo = 1;
		}

		model.addAttribute("autoNo", lastNo); // 가장 나중 번호로 자동세팅

			return "/manager/event/eventRegister";
		}
	@RequestMapping(value = "eventRegister", method = RequestMethod.POST)
	public String EventRegisterPost(EventVO vo, MultipartFile eventPic, Model model) throws Exception {

		String savedName = UploadFileUtils.uploadFile(uploadPathEvent, eventPic.getOriginalFilename().replaceAll(" ", "_"),
				eventPic.getBytes());
		String bigSizePic = savedName.substring(0, 12) + savedName.substring(14);

			vo.setEpic(bigSizePic.replaceAll(" ", "_"));
			eventService.insertEvent(vo);
			return "redirect:eventList";
	}
		
		// 디테일 조회
		@RequestMapping(value = "eventDetailForm", method = RequestMethod.GET)
		public String EventDetailForm(int eno, SearchCriteria cri, Model model) throws Exception {
			EventVO vo = eventService.readByNoEvent(eno);

			model.addAttribute("eventVO", vo);
			model.addAttribute("cri", cri);

			return "/manager/event/eventDetailForm";
		}
		
		// 수정
		@RequestMapping(value = "eventUpdate", method = RequestMethod.POST)
		public String EventUpdate(EventVO vo, MultipartFile eventPic, Model model) throws Exception {
		
			if (eventPic.getBytes().length != 0) { // 새로 첨부한 파일이 있다면
				// 원래 vo가 가진 pic의 네임으로 폴더에 저장된 사진들 지우기

				File EventFile = new File(uploadPathEvent + vo.getEpic());
				EventFile.delete();

				String smallSizePic = vo.getEpic().substring(0, 12) + "s_" + vo.getEpic().substring(12); // 썸네일용 사진도
				// System.out.println(smallSizePic);
				File EventFile2 = new File(uploadPathEvent + smallSizePic);
				EventFile2.delete();

				// 수정 된 파일로 교체
				String savedName = UploadFileUtils.uploadFile(uploadPathEvent, eventPic.getOriginalFilename(),
						eventPic.getBytes());
				String bigSizePic = savedName.substring(0, 12) + savedName.substring(14);
				
				vo.setEpic(bigSizePic);
			}
			eventService.updateEvent(vo);

			return "redirect:/manager/EventDetailForm?eno=" + vo.getEno();

		}	
		
		@RequestMapping(value ="eventDelete", method= RequestMethod.GET)
		public String eventDelete(int eno) throws Exception{
			eventService.deleteEvent(eno);
			return "redirect:/eventList";
		}
	
	// 고객
		@RequestMapping(value ="userList/{usersecess}", method = RequestMethod.GET)
		public String userList(SearchCriteria cri, Model model, @PathVariable("usersecess") int usersecess) throws Exception {
			List<UserVO> userList = userService.listSearchCriteriaUser(cri, usersecess);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(userService.totalSearchCountUser(cri, usersecess));
			
			
			model.addAttribute("cri",cri);
			model.addAttribute("list",userList);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("empretired", usersecess);
	        
			// 같은 페이지를 공유하기에 버튼이름 변경을 위한 model값 선언
					if (usersecess == 1) { //비활성화면
						model.addAttribute("btnName", "고객조회");
					} else {
						model.addAttribute("btnName", "탈퇴회원");
					}
			return "manager/user/userList";
			
		}
	
}
