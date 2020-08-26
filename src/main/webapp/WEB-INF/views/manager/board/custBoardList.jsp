<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
	table .table table-bordered th,td,th{
       text-align: center;
    }
    .bList:hover {
    	background-color : lightgrey;
    }
</style>
<!-- <div id="opa">dummy</div> -->
<div class="content">	
	<div class="row">
		<div class="col-sm-12">    
			<div class="box box-primary">      
				<div class="box-header">
					<h2 class="box-title">고객의 소리</h2>
				</div>
				<div class="box-body">

					<select name="searchType" id="searchType" style="width:200px; height: 25px;">
						<option value="N" ${cri.searchType ==null?'selected':''}>----------</option>
						<option value="btitle" ${cri.searchType =='btitle'?'selected':''}>제목</option>
						<option value="bcontent" ${cri.searchType =='bcontent'?'selected':''}>내용</option>
						<option value="bwriter" ${cri.searchType =='bwriter'?'selected':''}>고객아이디</option>
						<option value="banswer" ${cri.searchType =='banswer'?'selected':''}>미답변</option>
					</select>
					<input type="text" name="keyword" id="keywordInput">
					<button id="btnSearch">Search</button>
				</div>
				<div class="box-body">
				<!-- 	<button id="btnRegister">추가 - 테스트용</button> -->
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>번호</th>
							<th>제목</th>   
							<th>작성자</th>
							<th>작성 일자</th>
							<th>답변여부</th>
							<th>추가기능</th>

						</tr>
						<c:forEach var="bList" items="${list}">
						<tr class="bList" data-click="${bList.bno}">
							<td>${bList.bno}</td>
							<td>${bList.btitle}</td>
							<td>${bList.bwriter}</td>
							<td><fmt:formatDate value="${bList.bregdate}" pattern="yyyy-MM-dd "/></td>
							<td>${bList.banswer == 'null'?'미답변':'답변완료' }</td>
						    <td><button data-click="${bList.bno }" class="btnDetail">상세보기</button>
						    <button data-click="${bList.bno }" class="btnDelete" style="background:red;color:white;">삭제</button></td>
						</tr>
						</c:forEach>     
					</table>      
				</div>
				<div class="box-footer">
					<div class='text-center'>
	                   <ul class="pagination">
	                      <c:if test="${pageMaker.prev == true }">
	                          <li><a href="${pageContext.request.contextPath}/boardList?page=${pageMaker.startPage -1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&laquo;</a></li>
	                       </c:if>
	                      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	                         <li class="${pageMaker.cri.page == idx?'active':''}"><a href="${pageContext.request.contextPath}/boardList?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}"> ${idx }</a></li>
	                       </c:forEach>
	                       <!--  언제나 나오는 게 아니니까  -->
	                       <c:if test="${pageMaker.next == true }">
	                          <li><a href="${pageContext.request.contextPath}/boardList?page=${pageMaker.endPage +1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&raquo;</a></li>
	                       </c:if>
	                   </ul>
	               </div>
				</div>
			</div>         
		</div>
	</div>

</div>

<script>
	$("#btnSearch").click(function(){
		var searchType = $("#searchType").val();
		var keyword = $("#keywordInput").val();
		location.href = "${pageContext.request.contextPath}/boardList?searchType="+searchType+"&keyword="+keyword;
		//searchBoardController의 listPage GET 으로 받음 
		
	  })
	
	$("#btnRegister").click(function(){
		location.href = "${pageContext.request.contextPath}/boardRegister";
	  })
	
	//각 리스트를 클릭했을 때 디테일로 넘어가는 부분
	$(".bList").click(function(){
		var bno = $(this).attr("data-click");
		var searchType = "${cri.searchType}";
		var keyword = "${cri.keyword}";
		location.href = "${pageContext.request.contextPath}/boardList?bno="+bno+"&page=${pageMaker.cri.page}&searchType="+searchType+"&keyword="+keyword;
		
	})
</script>

<%@ include file="../../include/footer.jsp"%>