<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
  label {
    float: left;
    width: 150px;
    margin-left:20px;
  }
     color: tomato;
     display: none;
  }
  
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//주소
function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr; 
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();

            }
        }).open();
    }
    
   
</script>
<script>
	
	var searchType = "${cri.searchType}";
	var keyword = "${cri.keyword}";
	
	
	
	//주소 변수
	  var useraddr ='';
	$(function(){
		
     //정규 표현식 ,빈칸인 경우는 부트 스트랩의 기본 설정으로 이미 설정되어있음 
		$("form").submit(function(e){
			
			
			
			$(this).attr("onsubmit","");
			$(".errorMsg").css("display", "none");
			var username = $("input[name='username']").val();
			var userbirth = $("input[name='userbirth']").val();
			var usertel = $("input[name='usertel']").val();
			var useraddr = $("input[name='useraddr']").val();
			var userauth = $("#userauth").val();
			alert(userauth);
			var userid = $("input[name='userid']").val();
			var userpass = $("input[name='userpass']").val();
	//		var forCheckId = $("#forCheckId").val

	        var postcode = $("input#sample6_postcode").val();
			var address = $("input#sample6_address").val();
			var detailAddress= $("input#sample6_detailAddress").val();
			var extraAddress = $("input#sample6_extraAddress").val();
			
		    useraddr="("+postcode+")"+address+" "+detailAddress+" "+extraAddress;
			//alert(useraddr);
			$("input[name='useraddr']").val(useraddr);
	
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
			
			/* //권한 정규 표현식
			var authReg = /^[A-Z]{1}$/;
			if(authReg.test(userauth) == false){
				$("input[name='userauth']").next().css("display", "inline");
				  return false;
			  } */
			
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
		
		//삭제 버튼을 눌렀을 경우 퇴사고객 처리 - 논리삭제
		$("#btnDel").click(function(){
			//먼저 확인창으로 물어볼 것
			
		    //고객리스트에서 접속한 것인지 퇴사고객 리스트에서 접속한 것인지에 따라 분리 
			if(usersecess == 0){
		    var youSure = confirm("탈퇴 처리 하시겠습니까?");
		    }else{
		     var youSure = confirm("해당 고객의 정보를 완전 삭제 처리 하시겠습니까?");	
		    }
			if(youSure){
				
				location.href="${pageContext.request.contextPath}/manager/userDelete/${usersecess}/"+userno+"?searchType="+searchType+"&keyword="+keyword;
			}
			
		})

     
        //리스트로 버튼 눌렀을 때 리스트로 돌아가기 
		$("#btnReturnToList").click(function(){
			location.href="${pageContext.request.contextPath}/userList/0?searchType="+searchType+"&keyword="+keyword;
		})
		
	})
	
</script>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">고객 등록</h3> 
				</div>
				<form role="form" action="${pageContext.request.contextPath}/userAdd" method="post" id="detaiLForm" autocomplete="off">
					<div class="box-body">
					    <!-- <input type="hidden" value="" id="forSubmit"> -->
					    <%-- <input type="hidden" value="${usersecess }" name="usersecess"> --%>
						<div class="form-group">
							<label>고객 번호</label>
							<input type="text" name="userno" value="${lastNo}" readonly="readonly" style="background:lavender;" >
						</div>
						<div class="form-group">
							<label>고객 이름</label>
							<input type="text" name="username" required="required" placeholder=" 한글 2-5자리" >
							<span class="errorMsg">이름을 한글 2자리에서 5자리로 입력해주세요.</span>
						</div>
						<div class="form-group">
							<label>생년월일</label>
							<input type="text" name="userbirth" required="required"  placeholder=" 2000-02-02" >
							<span class="errorMsg">생년월일 형식에 맞게 넣어주세요. 예시: 2000-02-02</span>
						</div>
						<div class="form-group">
							<label>전화번호</label>
							<input type="text" name="usertel" required="required"  placeholder=" 010-4334-4321" >
							<span class="errorMsg">형식에 맞게 넣어주세요 예시: 010-4334-4321</span>
						</div>
						<div class="form-group">
							<label>주소</label>
							<div style="width:500px;">
							<input type="hidden" name="useraddr"  class="inputAddr" >
						    <input type="text" id="sample6_postcode" placeholder="우편번호" class="inputAddr">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="background:steelblue; border:inherit; color:white;" class="inputAddr">
							<input type="text" id="sample6_address" placeholder="주소" class="inputAddr" style="margin-left:170px; width:270px;" required="required"><br>
							<input type="text" id="sample6_detailAddress" placeholder="상세주소" class="inputAddr" style="margin-left:170px; width:270px;">
							<input type="text" id="sample6_extraAddress" placeholder="참고항목" class="inputAddr" style="margin-left:170px; width:270px;">  
						    </div>
						</div>
						<div class="form-group">
				
					    </div>
						<%-- <c:if test="${Auth.userauth==1}">
							<div class="form-group">
								<label>권한</label>
								<input type="text" name="userauth" required="required"  placeholder=" 일반고객은 0" >
								<span class="errorMsg">0또는 1을 넣어주세요 일반 고객은 0</span>
							</div>
						</c:if>
						<c:if test="${Auth.userauth==0}">
							<div class="form-group">
								<label>권한</label>
								<input type="text" name="userauth" required="required"  placeholder=" 일반고객은 0" readonly="readonly" style="background:lavender;">
								<span class="errorMsg">0또는 1을 넣어주세요 일반 고객은 0</span>
							</div>
						</c:if> --%>
						
						<div class="form-group">
							<label>아이디</label> 
							<input type="text" name="userid"  placeholder=" 영문,숫자 포함 5-12자리">
							<span class="errorMsg">영문, 숫자 포함 5-12자리를 넣어주세요</span>
							<span class="errorMsg">중복되는 아이디 입니다. 다른 아이디를 입력해주세요.</span>
						</div>
						<div class="form-group">
							<label>비밀번호</label>
							<input type="text" name="userpass" placeholder="초기 비밀번호" >
							<span class="errorMsg">4-15자리</span>
						</div>
						<div class="box-footer">
								<button type="submit" class="btn btn-primary">등록</button>
								<br>
								<button type="button" class="btn btn-primary" style="margin-top:10px;" id="btnReturnToList">리스트로 돌아가기</button>
							</div>
						<%-- <c:if test="${Auth.userauth==1}">
							<div class="box-footer">
						    	<button type="button" class="btn btn-primary" style="background:red;" id="btnDel">${usersecess =='0'?'퇴사고객처리':'삭제' }</button> <!-- 관리자일때만 활성화 -->
								<button type="submit" class="btn btn-primary" style="${usersecess== 0?'visibility:visible;':'visibility:hidden;'}">수정</button>
								<br>
								<button type="button" class="btn btn-primary" style="margin-top:10px;" id="btnReturnToList">리스트로 돌아가기</button>
							</div>
						</c:if>
						<c:if test="${Auth.userauth==0}">
							<div class="box-footer">
								<button type="submit" class="btn btn-primary" style="${usersecess== 0?'visibility:visible;':'visibility:hidden;'}">수정</button>
							</div>
						</c:if> --%>
					
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../../include/footer.jsp"%>