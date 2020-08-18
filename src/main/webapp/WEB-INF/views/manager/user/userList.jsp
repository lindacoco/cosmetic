<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../include/header.jsp"  %>
<!DOCTYPE html>
<html>
<style>
  #mainContent{
     width:100%;
     height: 700px;
   }
   #tableSelect{
     width:200px;
     height: 26px;
   }
   #mainTable{
     width:100%;
     margin-top:20px;
           
     }
   #mainTable th{
    width: 14.28%;
     background: mistyrose;
     text-align: center;
   }
   #mainTable td{
     text-align: center;
   }
   #mainTable td,th{
     border:1px solid black;
   }
   
   ul.pagenation a{
     background: mistyrose;
   }
  
</style>

<div class="content">

         <div class="row">
             <div class="col-sm-12">
                 <div class="box box-primary">
                    <div class="box-header">
                       <h3 class="box-title">고객관리 </h3>
                    </div>
                    <div class="box-body" id="mainContent">
              <select id="tableSelect" name="searchType">
                 <option value="n" ${cri.searchType ==null?'selected':''}>---------  선택하세요  -----------</option>
                 <option value="userName" ${cri.searchType =='userName'?'selected':''}>고객명</option>
                 <option value="userNo" ${cri.searchType =='userNo'?'selected':''}>고객번호</option>
              </select>
              <input type="text" id="searchInput">
              <button id="selectSearchBtn">검색하기</button>
              <button id="selectReset">리셋</button>
              <br>
              <button style="margin-top:10px;" id="twoWayBtn">${btnName }</button>
              <button style="margin-top:10px;" id="userAddBtn"><i class="far fa-plus-square"></i>테스트용 등록</button>
              <table id="mainTable">
                 <tr>
                    <th>고객번호</th>
                    <th>고객명</th>
                    <th>생년월일</th>
                    <th>전화번호</th>
                    <th>아이디</th>
                    <th>추가기능</th>
                 </tr>
                 <c:forEach var="userList" items="${list}">
                    <tr data-click="${userList.userno }">
                       <td>${userList.userno }</td>
                       <td>${userList.username }</td>
                       <td><fmt:formatDate value="${userList.userbirth }" pattern="yyyy-MM-dd"/></td>
                       <td>${userList.usertel }</td>
                       <td>${userList.userid }</td>
                       <td><button data-click="${userList.userno }" class="btnDetail">상세보기</button>
                       <button data-click="${userList.userno }" class="btnDelete" ${btnName=='탈퇴회원'?'style="visibility:visible; background:red; color:white;"':'style="display:none;"' }>삭제</button></td>
                    </tr>
                 
                 </c:forEach>
              </table>
               <div class="box-footer">
	             <%--   --%>
	              <!--  부트 스트랩으로 사용  -->
	              <div class='text-center'>
	                   <ul class="pagination">
	                      <c:if test="${pageMaker.prev == true }">
	                          <li><a href="${pageContext.request.contextPath}/userList/${userretired }?page=${pageMaker.startPage -1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&laquo;</a></li>
	                       </c:if>
	                      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	                         <li class="${pageMaker.cri.page == idx?'active':''}"><a href="${pageContext.request.contextPath}/userList/${userretired }?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}"> ${idx }</a></li>
	                       </c:forEach>
	                       <!--  언제나 나오는 게 아니니까  -->
	                       <c:if test="${pageMaker.next == true }">
	                          <li><a href="${pageContext.request.contextPath}/userList/${userretired }?page=${pageMaker.endPage +1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&raquo;</a></li>
	                       </c:if>
	                   </ul>
	                   <!-- 테스트용 
	                   <img src="${pageContext.request.contextPath}/resources/images/banner.jpg"> -->
	               </div>
	           </div>





                    </div>
                 </div>
             </div>
         </div>
</div>
<script>

//직원 추가 버튼을 누르면

$("#userAddBtn").click(function(){
	location.href="${pageContext.request.contextPath}/userAdd";
})
$("#selectSearchBtn").click(function(){
	var searchType = $("#tableSelect").val();
	var keyword = $("#searchInput").val();
	
	if("${btnName}"=="고객조회"){ //탈퇴회원 리스트에서 검색한 경우
	  location.href = "${pageContext.request.contextPath}/userList/1?searchType="+searchType+"&keyword="+keyword;
	}else{
	  location.href = "${pageContext.request.contextPath}/userList/0?searchType="+searchType+"&keyword="+keyword;	
	}
	
})
$("#selectReset").click(function(){
	location.href="${pageContext.request.contextPath}/userList/0";
})

$(".btnDetail").click(function(){
	var userno = $(this).attr("data-click");
	var searchType = "${cri.searchType}";
	var keyword = "${cri.keyword}";
	location.href = "${pageContext.request.contextPath}/userDetail/${usersecess}?userno="+userno+"&page=${pageMaker.cri.page}&searchType="+searchType+"&keyword="+keyword;

})

//삭제 버튼 눌렀을 경우 -- 사원이라서 퇴사처리임
$(".btnDelete").click(function(){
	var userno = $(this).attr("data-click");
	var confirmM = confirm("해당 정보를 삭제하시겠습니까?");
    if(confirmM){
    	location.href="${pageContext.request.contextPath}/userloyeeDelete?userno="+userno;
    }
})

$("#twoWayBtn").click(function(){
	var searchType = $("#tableSelect").val();
	var keyword = $("#searchInput").val();
	if("${btnName}"=="퇴사사원 조회"){ //근무사원 리스트에서 검색한 경우
		  location.href = "${pageContext.request.contextPath}/userloyeeList/1?searchType="+searchType+"&keyword="+keyword; 
	    }else{
		  location.href = "${pageContext.request.contextPath}/userloyeeList/0?searchType="+searchType+"&keyword="+keyword;	
		}
})
    	/* var selectOption = $("#tableSelect").val();
    	$("#selectSearchBtn").click(function(){
    		if(selectOption == "n"){
    			alert("옵션을 선택해주세요.")
    		}else{
    		 if(searchInput == ""){
    			alert("검색 값을 입력하세요");
    			return false;
    		  }
    		}
    	}) */

</script>
<%@ include file="../../include/footer.jsp" %>