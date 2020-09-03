<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
  label {
    float: left;
    width: 150px;
    margin-left:20px;
  }
  span.errorMsg{
     color: tomato;
     display: none;
  }
  
</style>
<script>
	var userno = ${userVO.userno };
	var searchType = "${cri.searchType}";
	var keyword = "${cri.keyword}";
	
	var usersecess = ${usersecess};
	 
	$(function(){
		//고객 정보인지 탈퇴 고객 정보인지에 따라 폼 스타일 다르게 하기 
		if(usersecess==1){
			$("#detaiLForm input").css("background","lavender");
			$("input").attr("readonly","readonly");
		}
		
     //정규 표현식 ,빈칸인 경우는 부트 스트랩의 기본 설정으로 이미 설정되어있음 
		$("form").submit(function(e){
			$(this).attr("onsubmit","");
			$(".errorMsg").css("display", "none");
			var username = $("input[name='username']").val();
			var userbirth = $("input[name='userbirth']").val();
			var usertel = $("input[name='usertel']").val();
			var useraddr = $("input[name='useraddr']").val();
			var userauth = $("#userauth option:selected").val();
		//	alert(userauth);
			var userid = $("input[name='userid']").val();
			var userpass = $("input[name='userpass']").val();
	//		var forCheckId = $("#forCheckId").val

			//이름 정규표현식
			var nameReg = /^[가-힣]{2,5}$/; //네임은 2-5 한글
			if (nameReg.test(username) == false) {
				$("input[name='username']").next().css("display", "inline");
				  return false;
			  }
			//생년월일정규표현식
			var birthReg = /^(1|2)[0-9]{3}-(01|02|03|04|05|06|07|08|09|10|11|12)-(01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31)$/; 
			if (birthReg.test(userbirth) == false) {
				$("input[name='userbirth']").next().css("display", "inline");
				  return false;
			  }
			//전화번호 정규 표현식
			var phoneReg = /^(010|011|019|018|017)-[0-9]{3,4}-[0-9]{4}$/; 
			if (phoneReg.test(usertel) == false) {
				$("input[name='usertel']").next().css("display", "inline");
				  return false;
			  }
	
			
		    //고객 아이디 정규 표현식, 회원 아이디 규칙과 동일
		    var idReg = /^[a-z0-9]{5,12}$/i; //영어, 숫자 6-15
		    if (idReg.test(userid) == false) {
				$("input[name='userid']").next().css("display", "inline");
				  return false;
			  }
		   
		    //고객 비밀번호 정규 표현식, 회원 비밀번호 규칙과 동일함
		    var pwdReg = /^[a-zA-Z0-9!@#%^&*]{4,15}/;
			 if(pwdReg.test(userpass) == false){
				 $("input[name='userpass']").next().css("display","inline");
				 return false;
		     }
			 
/* 			 if(forCheckId =="exist"){
				 return false;
			 } */
			 
			

		})
		
		$("#btnCheck").click(function(){
			var userid = $("input[name='userid']").val();
			 //아이디 중복 ajax로 처리하기
			 $.ajax({
				url:"userIdCheck/"+userid,
				type:"get",
				dataType:"text",
				success:function(res){
					console.log(res);
					if(res=="exist"){
						$("input[name='userid']").next().next().next().css("display", "inline");
		//				$("form").attr("onsubmit","return false;");
					}
				}
				 
		    })
			
		})

     
        //리스트로 버튼 눌렀을 때 리스트로 돌아가기 
		$("#btnReturnToList").click(function(){
			location.href="${pageContext.request.contextPath}/userList/${usersecess}/?searchType="+searchType+"&keyword="+keyword;
		})
		
		
	})
	
</script>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">고객 정보 조회</h3> 
				</div>
				<form role="form" action="${pageContext.request.contextPath}/userUpdate/${userVO.usersecess}" method="post" id="detaiLForm" autocomplete="off">
					<div class="box-body">
					    <!-- <input type="hidden" value="" id="forSubmit"> -->
					    <%-- <input type="hidden" value="${usersecess }" name="usersecess"> --%>
						<div class="form-group">
							<label>고객 번호</label>
							<input type="text" name="userno" value="${userVO.userno }" readonly="readonly" style="background:lavender;" >
						</div>
						<div class="form-group">
							<label>고객 이름</label>
							<input type="text" name="username" required="required" placeholder=" 한글 2-5자리" value="${userVO.username}">
							<span class="errorMsg">이름을 한글 2자리에서 5자리로 입력해주세요.</span>
						</div>
						<div class="form-group">
							<label>생년월일</label>
							<input type="text" name="userbirth" required="required"  placeholder=" 2000-02-02" value="<fmt:formatDate value='${userVO.userbirth}' pattern="yyyy-MM-dd"/>">
							<span class="errorMsg">생년월일 형식에 맞게 넣어주세요. 예시: 2000-02-02</span>
						</div>
						<div class="form-group">
							<label>전화번호</label>
							<input type="text" name="usertel" required="required"  placeholder=" 010-4334-4321" value="${userVO.usertel}">
							<span class="errorMsg">형식에 맞게 넣어주세요 예시: 010-4334-4321</span>
						</div>
						<div class="form-group">
							<label>주소</label>
							<input type="text" name="useraddr" required="required" value="${userVO.useraddr}" style="width:300px;">
						</div>
						<%-- <div class="form-group">
								<label>권한</label>
								<select name="userauth" required="required" style="width:159px;" id="userauth" >
								  <option value="C" ${userVO.userauth=='C'?'selected':'' }>고객</option>
								  <option value="B" ${userVO.userauth=='B'?'selected':'' }>director</option>
								  <option value="A" ${userVO.userauth=='A'?'selected':'' }>manager</option>
								</select>
					    </div> 고객 등급을 부여할지 생각 중 --%>
						<div class="form-group">
							<label>아이디</label> 
							<input type="text" name="userid" readonly="readonly"  placeholder=" 영문,숫자 포함 5-12자리" value="${userVO.userid}" style="background:lavender;">
					
							<span class="errorMsg">영문, 숫자 포함 5-12자리를 넣어주세요</span>
							<span class="errorMsg">중복되는 아이디 입니다. 다른 아이디를 입력해주세요.</span>
						</div>
						<div class="form-group">
							<!-- <label>비밀번호</label>
							<input type="text" name="userpass" placeholder="기존 비밀번호 입력 필요" >
							<span class="errorMsg">비밀번호가 일치하지 않습니다.</span> 관리자일 경우 프리패스로 만들 것  -->
						</div>
						<div class="box-footer">
								<button type="submit" class="btn btn-primary">수정</button>
								<br>
								<button type="button" class="btn btn-primary" style="margin-top:10px;" id="btnReturnToList">리스트로 돌아가기</button>
						</div>
					 <c:if test="${success!=null }">
						<script>
							alert("${success}");
						</script>
					</c:if>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../../include/footer.jsp"%>