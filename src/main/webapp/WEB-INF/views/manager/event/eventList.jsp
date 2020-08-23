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
                       <h3 class="box-title">이벤트관리 </h3>
                    </div>
                    <div class="box-body" id="mainContent">
              <select id="tableSelect" name="searchType">
                 <option value="n" ${cri.searchType ==null?'selected':''}>---------  선택하세요  -----------</option>
                 <option value="etitle" ${cri.searchType =='etitle'?'selected':''}>이벤트명</option>
                 <option value="econtent" ${cri.searchType =='econtent'?'selected':''}>이벤트내용</option>
              </select>
              <input type="text" id="searchInput" >  
              <button id="selectSearchBtn">검색하기</button>
              <button id="selectReset">리셋</button>
              <br>
              <button style="margin-top:10px;" id="twoWayBtn">${btnName }</button>
              <button style="margin-top:10px;" id="eventAddBtn"><i class="far fa-plus-square"></i>  이벤트 등록</button>
              <table id="mainTable">
                 <tr>
                    <th>이벤트번호</th>
                    <th>이벤트명</th>
                    <th>이벤트프리뷰</th>
                    <th>이벤트시작일</th>
                    <th>이벤트종료일</th>
                    <th>추가기능</th>
                 </tr>
                 <c:forEach var="eList" items="${list}">
                    <tr data-click="${eList.eno }">
                       <td>${eList.eno }</td>
                       <td>${eList.etitle }</td>
                       <td><img src="displayFile/event?filename=${eList.epic}" style="width:100%; height: 60px;"></td>
                       <td><fmt:formatDate value='${eList.estartdate }' pattern ='yyyy-MM-dd'/></td>
                       <td><fmt:formatDate value='${eList.eenddate }' pattern='yyyy-MM-dd'/></td>
                       <td><button data-click="${eList.eno }" class="btnDetail">상세보기</button>
                       <button data-click="${eList.eno }" class="btnDelete" style="background:red;color:white;">삭제</button></td>
                    </tr>
                 
                 </c:forEach>
              </table>
               <div class="box-footer">
	             <%--   --%>
	              <!--  부트 스트랩으로 사용  -->
	              <div class='text-center'>
	                   <ul class="pagination">
	                      <c:if test="${pageMaker.prev == true }">
	                          <li><a href="${pageContext.request.contextPath}/eventList?page=${pageMaker.startPage -1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&laquo;</a></li>
	                       </c:if>
	                      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	                         <li class="${pageMaker.cri.page == idx?'active':''}"><a href="${pageContext.request.contextPath}/eventList?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}"> ${idx }</a></li>
	                       </c:forEach>
	                       <!--  언제나 나오는 게 아니니까  -->
	                       <c:if test="${pageMaker.next == true }">
	                          <li><a href="${pageContext.request.contextPath}/eventList?page=${pageMaker.endPage +1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&raquo;</a></li>
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
/* if("${keyword}" !=""){
	$("#searchInput").html() = "${keyword}" ;
} */
//이벤트 추가 버튼을 누르면
$("#eventAddBtn").click(function(){
	location.href="${pageContext.request.contextPath}/eventRegister";
})
$("#selectSearchBtn").click(function(){
	var searchType = $("#tableSelect").val();
	var keyword = $("#searchInput").val();
	
	if("${btnName}"=="종료된 이벤트"){ //재고량이 10개 미만인 상품들 조회 하기 위한 이름  
	  location.href = "${pageContext.request.contextPath}/eventList?searchType="+searchType+"&keyword="+keyword;
	}else{
	  location.href = "${pageContext.request.contextPath}/eventList?searchType="+searchType+"&keyword="+keyword;	
	}
	
})
$("#selectReset").click(function(){
	location.href="${pageContext.request.contextPath}/eventList";
})

$(".btnDetail").click(function(){
	var eno = $(this).attr("data-click");
	var searchType = "${cri.searchType}";
	var keyword = "${cri.keyword}";
	location.href = "${pageContext.request.contextPath}/eventDetail?eno="+eno+"&page=${pageMaker.cri.page}&searchType="+searchType+"&keyword="+keyword;

})

//삭제 버튼 눌렀을 경우 -- 사원이라서 퇴사처리임
$(".btnDelete").click(function(){
	var pno = $(this).attr("data-click");
	var confirmM = confirm("해당 상품을 삭제하시겠습니까?");
    if(confirmM){
    	location.href="${pageContext.request.contextPath}/productDelete?pno="+pno;
    }
})

$("#twoWayBtn").click(function(){
	var searchType = $("#tableSelect").val();
	var keyword = $("#searchInput").val();
	if("${btnName}"=="재고부족 상품"){ //기본리스트에서 검색
		  location.href = "${pageContext.request.contextPath}/productList?searchType="+searchType+"&keyword="+keyword; 
	    }else{
		  location.href = "${pageContext.request.contextPath}/productList?searchType="+searchType+"&keyword="+keyword;	
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