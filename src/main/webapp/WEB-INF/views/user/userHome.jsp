<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cosmetics, Beauty Products, Fragrances & Tools |LALACOSME</title>
<link href="${pageContext.request.contextPath }/resources/css/userHome.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<script>
	$(function(){
		
		var visible = "${visible}";
		
		if(visible != ""){
			 $("#loginDiv").css("display","block");
		}
		
		$("form").submit(function(){
			alert("aa");
			var idcheck = $("input[name='id']").val();
			var passcheck = $("input[name='password']").val();
			
			//email 정규 표현식
			var emailReg = /^[a-zA-Z0-9!@.#%^&*]{5-20}$/; // .가능?
			if(emailReg.test(idcheck) == false){
				 return false;
		     }
			
			 var pwdReg = /^[a-zA-Z0-9!@#%^&*]{4,15}/;
			 if(pwdReg.test(passcheck) == false){
				 return false;
		     }
			
		})
		$("#btnRegister").click(function(){
			//$("#click").prop("checked", false);
		    $("#loginDiv").css("display","none");
			$("#registerdiv").css("display","block");
		})
		$("#btnLogin").click(function(){
			$("#registerdiv").css("display","none");
			$("#loginDiv").css("display","block");
		})
	
		$("#btnReg").click(function(){
			$("#signDiv").css("display","none");
			$("#registerdiv").css("display","block");
		})
		$("#xicon").click(function(){
			$("#registerdiv").css("display","none");
		})
		 var regiForm = $("#registerdiv").css("display");
	/*  $("#hi").click(function(){
		 regiForm = "block";
	 }) */	
	 
		
		/* $(document).on("click","#hi",function(){
			$("#registerdiv").css("display","block");
			alert(registerForm);
		}) */
	/*  if(registerForm == "block"){
		 
		 alert($("#hul li").css("hover"));
	 } */
		
	 $("form").submit(function(){
		 alert("제출");
	 })
		
	})
</script>
<style>
  .loginOr button{
    background: #B7F0B1;
    margin-top: 5px;
    width: 40%;
    height: 90%;
  }
  
  header div#loginDiv{
	position: absolute;
 	top:86px;
	left:-320px; 
	width:380px;
	height:400px;
	padding:25px 25px;
	background: white;
	z-index: 1;	
	box-shadow: 1px 1px 3px gray;
    display: none; 
}
header div#loginDiv input{
  width: 95%;
  height: 30px;
  margin-top: 10px;
}
header div#loginDiv #btnSign {
  width:150px;
  background: black;
  color:white;
}
header div#loginDiv #btnReg {
  width:150px;
  height: 30px;
  background: black;
  color:white;
}

</style>
</head>
<body>
<c:if test="${sucess !=null }">
   <script>
      alert("회원가입 성공. 로그인 수행해주세요.");
   </script>
</c:if>
<img id="top" src="${pageContext.request.contextPath }/resources/images/cosme/top.jpg" >
<nav id="fnav">
   <ul> 
      <li><a href="#"><img src="${pageContext.request.contextPath }/resources/images/cosme/menuicon1.png">Reorder</a></li>
      <li><a href="#"><img src="${pageContext.request.contextPath }/resources/images/cosme/menuicon2.png">Track Order</a></li>
      <li><a href="#"><img src="${pageContext.request.contextPath }/resources/images/cosme/menuicon3.png">Find a Store</a></li>
      <li><a href="#"><img src="${pageContext.request.contextPath }/resources/images/cosme/menuicon4.png">Book a Reservation</a></li>
      <li id="eng"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/cosme/menuicon5.png">English</a>
          <ul id="subul">
         <li><a href="#"><img src="${pageContext.request.contextPath }/resources/images/cosme/menuicon5.png">Francais</a></li>        
          </ul>
      </li>
    
   </ul>
</nav>
<div id="container">

    <header> 
       <input type="text" placeholder="         Search">
       <div>
       <img src="${pageContext.request.contextPath }/resources/images/cosme/logo.png" id="logo">
           
       </div>
       
       <div id="hdiv">
           <div>
	           <input type="checkbox" id="click">
	           <div>
			       <label id="register" for="click"><img src="${pageContext.request.contextPath }/resources/images/cosme/nextlogo.png" id="hi"></label>
			       <ul id="hul">
			                                  <li class="loginOr"><a href="#"><button id="btnLogin">Login</button></a><a href="#"><button id="btnRegister">register</button></a></li>
									          <li><a href="#">Profile</a></li>
									          <li><a href="#">Beauty Insider</a></li>
									          <li><a href="#">Lists</a></li>
									          <li><a href="#">Account</a></li>
									          <li><a href="#">Orders</a></li> 
									          <li><a href="#">Reservations</a></li> 
									          <li><a href="#">Reward Bazaar</a></li> 
									          </ul>
		      </div>
		      <div>
		        <form action="${pageContext.request.contextPath }/loginForm">
		        <div id="loginDiv">
		          <div>
		             <h4>sign in to LALACOSME</h4>
		              <input type="text" name="id" required="required" placeholder="*Email address" value="${Employee.empid }" id="inputid">
			          <input type="text" name="password" required="required" placeholder="*password" value="${Employee.emppass }" id="inputpass">
		            <%--    
		             <c:choose>
		               <c:when test="${User != null }">
			               <input type="text" name="id" required="required" placeholder="*Email address" value="${User.userid }" id="inputid">
			               <input type="text" name="password" required="required" placeholder="*password" value="${User.userpass }" id="inputpass">
		               </c:when>
		               <c:when test="${Employee != null }">
			               <input type="text" name="id" required="required" placeholder="*Email address" value="${Employee.empid }" id="inputid">
			               <input type="text" name="password" required="required" placeholder="*password" value="${Employee.emppass }" id="inputpass">
		               </c:when>
		             </c:choose> --%>
		            <input type="submit" value="sign in" id="btnSign">
		          </div>
		          <br>
		          <div>
		             <h4>NEW to LALACOSME?</h4>
		             <button id="btnReg">Register</button>
		          </div>
		        </div>
		        </form>
		      </div>
		       <div id="oo">		
		           <form action="${pageContext.request.contextPath}/userAdd" method="post" id="registerForm" autocomplete="off">	 
				   <div id="registerdiv">
					             <div>
				                     <h4>Register with LALACOSME</h4> 
				                     <div>         
				                     <label for="icon"><img src="${pageContext.request.contextPath }/resources/images/cosme/xicon.jpg" id="xicon"></label>       
									</div>                
				             </div>     
			                <p>*Required Information</p>
				                <div id="firstinput">
				                    <input type="text" required placeholder="   First name*" autofocus="autofocus"  name="username1">
				                    <input type="text" placeholder="   Last name*" required name="username2">
				                </div>
				                <div id="secondinput">
					                <input type="email" placeholder="   Email address*" name = "userid"><br>
					                <input type="text" placeholder="   Password (6 to 12 characters)*" name="userpass">
				                </div>
				                <div id="read">
				                   <h1>Beauty INSIDER</h1>
				                     <input type="checkbox" name="yseorno">
				                     <div>
				                        <p><b>Yes, Join LALACOSME's free 
				                           rewards program and earn points on every purchase.</b><br>
				                        </p>
				                        <p id="smallblue">By joining you agree to our <font color="blue">Terms & Conditions.</font></p>               
				                     </div>
				                     <div id="input3">
				                      <h4>Enter your birthday to receive a free gift every year.</h4>                   
				                      <input type="number"  min="1" max="12" placeholder="     Month">
				                      <input type="number"  min="1" max="30" placeholder="     Day">
				                      <input type="number"  min="2005" max="1920" placeholder="     Year">
				                      </div>                
				                </div> 
			                <div id="subscribe">
			                <input type="checkbox">
				                     <div>
				                        <p><b>Subscribe to LALACOSME emails</b><br>
				                     </div> 
			                 </div>   
			                 <div id="submit">
			                    <input type="text" placeholder="     ZIP Code (to about store events near you)">
			                    <input type="submit" value="RESISTER">   
			                 </div>   
			                 <p class="lastp">LALACOSME uses Google ReCaptcha and users are subject to Google's <span>Privacy policy</span> & <span>terms</span></p>
			           
		           </div>
		          </form> 
           </div>
		       
		
		 </div>
</div>   
		       <div id="himg">
           <img src="${pageContext.request.contextPath }/resources/images/cosme/iconht.png" class="upup">
	       <img src="${pageContext.request.contextPath }/resources/images/cosme/iconbag.png" class="upup">
	     </div>
	       	    
       
           
    </header>
    
    
    <section>
    <nav id="nav2">
          <ul>
                  <li id="li1"><a href="#"><b>SHOP</b></a>
                      <ul id="li1sub">
                           <li><a href="#">MAKEUP</a></li>
		                   <li><a href="#">SKINCARE</a></li>
		                   <li><a href="#">HAIR</a></li>
		                   <li><a href="#">TOOLS & BRUSHES</a></li> 
		                   <li><a href="#">FRAGRANCE</a></li> 
		                   <li><a href="#">BATH & BODY</a></li> 
		                   <li><a href="#">GIFTS</a></li> 
		                   <li><a href="#">SALE</a></li> 
		                   <li><a href="#">MEN</a></li> 
		                   <li><a href="#">MINI SIZE</a></li> 
                           <li><a href="#">LALACOSME COLLECTION</a></li> 
                           <li><a href="#">BEAUTY OFFERS</a></li> 
                      </ul>                  
                   </li>
		          <li id="li2"><a href="#">NEW</a>
		              <div id="second">
		              	<ul id="li2sub">
		              	   <li><a href="#"><b>Just Arrived</b></a></li>
		                   <li><a href="#">Makeup</a></li>
		                   <li><a href="#">Skincare</a></li> 
		                   <li><a href="#">FRAGRANCE</a></li> 
		                   <li><a href="#">BATH & BODY</a></li> 
		                   <li><a href="#">GIFTS</a></li> 
		                   <li><a href="#">SALE</a></li> 
		                   <li><a href="#">MEN</a></li>
		                   <li><a href="#">View All</a></li> 
		                   <li><a href="#"><b>Bestsellers</b></a></li> 
		                   <li><a href="#"><b>Quizzes & Buying Guides</b></a></li>
		                   <li><a href="#"><b>The Next Big Thing</b></a></li> 
		                   <li><a href="#"><b>Best of Allure 2019</b></a></li> 		                  
		              	</ul>
		              	<div id="fsecondbox">
		              	 <img src="${pageContext.request.contextPath }/resources/images/cosme/second.jpg">
		              	 <img src="${pageContext.request.contextPath }/resources/images/cosme/second2.jpg">
		              	 </div>
		              	 <div id="secondbox">
		              	    <img src="${pageContext.request.contextPath }/resources/images/cosme/second3.jpg">
		              	    <img src="${pageContext.request.contextPath }/resources/images/cosme/second4.jpg" id="li2img">
		              	 </div>
		              </div>
		          </li>
		          <li id="li3"><a href="#">BRANDS</a>
		              <div id="third">
		              	<ul id="li3sub">
		              	   <li class="sizeup"><a href="#"><b>Brands A-Z</b></a></li>
		                   <li class="sizeup"><a href="#"><b>LALACOSME Collection</b></a></li>
		                   <li class="sizeup"><a href="#"><b>New Brands</b></a></li> 
		                   <li><a href="#">Tower 28</a></li> 
		                   <li><a href="#">Sulwhasoo</a></li> 
		                   <li><a href="#">Valentino</a></li> 
		                   <li><a href="#">Together Beauty</a></li> 
		                   <li class="sizeup"><a href="#"><b>Featured Brands</b></a></li> 
		                   <li><a href="#">Charlotte Tilbury</a></li> 
		                   <li><a href="#">La Mer</a></li>
		                   <li><a href="#">YSL</a></li> 
		                   <li><a href="#">Dyson</a></li> 
		                   <li><a href="#">Huda Beauty</a></li>  
		                 </ul>
		                   <div id="thirdimg1">
		                     <img src="${pageContext.request.contextPath }/resources/images/cosme/brand.jpg">
		                   </div>
		                   <div>
		                      <img src="${pageContext.request.contextPath }/resources/images/cosme/brand2.jpg">
		                      <img src="${pageContext.request.contextPath }/resources/images/cosme/brand3.jpg">		                   
		                   </div>
		                   <div>
		                       <img src="${pageContext.request.contextPath }/resources/images/cosme/brand4.jpg">
		                       <img src="${pageContext.request.contextPath }/resources/images/cosme/brand5.jpg">		                   
		                   </div>
		                </div>
		          </li>
		          <li id="li4"><a href="#">GIFT</a></li>
		          <li><a href="#">SALE</a></li> 
		          <li id="li6"><a href="#">COMMUNITY</a>
		             <div id="commu">
		               <div>
		               <img src="${pageContext.request.contextPath }/resources/images/cosme/commu1.jpg">
		               </div>
		               <div id="undercommu">
		               <img src="${pageContext.request.contextPath }/resources/images/cosme/commu2_1.jpg">
		               <img src="${pageContext.request.contextPath }/resources/images/cosme/commu2.jpg">
		               </div>
		               <div>	            
		               <img src="${pageContext.request.contextPath }/resources/images/cosme/commu3.jpg">
		               </div>	
		               <div>
		               <img src="${pageContext.request.contextPath }/resources/images/cosme/commu4.jpg">
		               </div>
		             </div>		          
		          </li> 
		          <li id="li7"><a href="#">HAPPENING IN STORE</a>
		              <div id="underli7">
		                 <div>
		                  <img src="${pageContext.request.contextPath }/resources/images/cosme/happening1.jpg">
		                 </div>
		                 <div>
		                  <img src="${pageContext.request.contextPath }/resources/images/cosme/happening2_1.jpg">
		                  <img src="${pageContext.request.contextPath }/resources/images/cosme/happening2_2.jpg">
		                 </div>
		                 <div>
		                  <img src="${pageContext.request.contextPath }/resources/images/cosme/happening3.jpg">
		                 </div>
		                 <div>
		                  <img src="${pageContext.request.contextPath }/resources/images/cosme/happening4.jpg">
		                 </div>
		              </div>
		          
		          </li> 
           </ul>   
    </nav>
              
    </section>
</div>
<div id="mainimg">
    <img src="${pageContext.request.contextPath }/resources/images/cosme/main2.jpg" id="main">
</div>
   <div id="container2">
       <h1>Just Arrived</h1>
       
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product1.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">exclusive</p>
          <p class="bold">HUDA BEAUTY</p>
          <p>Nude Obsessions
             Eyeshadow Palette</p>
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product2.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">limited edition</p>
          <p class="bold">LALACOSME COLLECTION</p>
          <p>Frosted Party Multi- Sensorial Face mask Set</p>
         
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product3.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">exclusive</p>
          <p class="bold">HUDA BEAUTY</p>
          <p>Mercury Retrograde Eyeshadow Palette</p>
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product4.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">limited edition</p>
          <p class="bold">LANEIGE</p>
          <p>Kiss Me All Day</p>
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product5.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">limited edition</p>
          <p class="bold">CHARLOTTE TILBURY</p>
          <p>Starry Eyes to Hypnotize Eyeshadow Palette</p>
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product6.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">limited edition</p>
          <p class="bold">LALACOSME COLLECTION</p>
          <p>Frosted Party Freezing & Peeling Mask Duo</p>
       </div>
       
   </div>
    <div id="container3">
      <img src="${pageContext.request.contextPath }/resources/images/cosme/con3_1.jpg">
      <img src="${pageContext.request.contextPath }/resources/images/cosme/con3_2.jpg">
    
    </div>
    <div id="container4">
       <h1>Editor's Picks</h1>
       
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product7.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">limited edition</p>
          <p class="bold">SUMMER FRIDAYS</p>
          <p>Merry & Brighter</p>
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product8.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">limited edition</p>
          <p class="bold">CHRISTOPHE ROBIN</p>
          <p>Perfect Hair Duo</p>
         
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product9.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">limited edition</p>
          <p class="bold">NUDESTICK</p>
          <p>Nude + Red Hot Lips 3-Piece Mini Set</p>
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product10.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">limited edition</p>
          <p class="bold">BELIF</p>
          <p>Moisture Miracle Set</p>
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product11.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">limited edition</p>
          <p class="bold">MARC JACOBS BEAUTY</p>
          <p>The Glow Show: Skincare & Makeup Set</p>
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product12.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small"></p>
          <p class="bold">VERB</p>
          <p>Leave-In Mist</p>
       </div>
       
   </div>
   <div id="container5">
       <h1>Luxury Gifts</h1>
       
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product13.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">limited edition</p>
          <p class="bold">TATCHA</p>
          <p>Skincare for Makeup Lovers: Dewy Glow Set</p>
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product14.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">limited edition</p>
          <p class="bold">ALGENIST</p>
          <p>Secrets of Algae Kit</p>
         
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product15.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">limited edition</p>
          <p class="bold">BIOSSANCE</p>
          <p>Glow On, Gorgeous- JVN's Biossance Favorites</p>
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product16.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">exclusive</p>
          <p class="bold">PAT MACGRATH LABS</p>
          <p>LUST:Mini Matte Trance™ Lipstic Trio</p>
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product17.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">limited edition</p>
          <p class="bold">CHRISTOPHE ROBIN</p>
          <p>Purifying Detox Holiday Set</p>
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product18.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">exclusive</p>
          <p class="bold">MELT COSMETICS</p>
          <p>Smoke Sessions Eyeshadow Palette</p>
       </div>
       
   </div>
      <div id="container6">
       <h1>Recommended For You</h1>
       
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product19.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">limited edition</p>
          <p class="bold">TATCHA</p>
          <p>Skincare for Makeup Lovers: Dewy Glow Set</p>
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product20.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">limited edition</p>
          <p class="bold">ALGENIST</p>
          <p>Secrets of Algae Kit</p>
         
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product9.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">limited edition</p>
          <p class="bold">NUDESTICK</p>
          <p>Nude + Red Hot Lips 3-Piece Mini Set</p>
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product16.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">exclusive</p>
          <p class="bold">PAT MACGRATH LABS</p>
          <p>LUST:Mini Matte Trance™ Lipstic Trio</p>
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product4.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">limited edition</p>
          <p class="bold">LANEIGE</p>
          <p>Kiss Me All Day</p>
       </div>
       <div>
          <img src="${pageContext.request.contextPath }/resources/images/cosme/product18.jpg">
          <p class="new">NEW</p>
          <p class="quick">QUICK LOOK</p>
          <p class="small">exclusive</p>
          <p class="bold">MELT COSMETICS</p>
          <p>Smoke Sessions Eyeshadow Palette</p>
       </div>
       
   </div>
   <div id="rb">
      <img src="${pageContext.request.contextPath }/resources/images/cosme/bann.jpg">
   </div>
   <div id="pic4">
      <img src="${pageContext.request.contextPath }/resources/images/cosme/bann1.jpg">
      <img src="${pageContext.request.contextPath }/resources/images/cosme/bann2.jpg">
      <img src="${pageContext.request.contextPath }/resources/images/cosme/bann3.jpg">
      <img src="${pageContext.request.contextPath }/resources/images/cosme/bann4.jpg">
   </div>
   
   <footer>
       <div id="last">
         <div>
	       <p>About LALACOSME</p>
	       <ul id="footerul1"> 
			  <li><a href="#">About LALACOSME</a></li>
			  <li><a href="#">Careers</a></li>
			  <li><a href="#">LALACOSME Stands Social Impact</a></li> 
			  <li><a href="#">Affiliates</a></li> 
			  <li><a href="#">Supply Chain Transparency</a></li> 
			  <li><a href="#">Sitemap</a></li> 
			  <li><a href="#">LALACOSME Global Sites</a></li> 
			</ul>  
		  </div>
		  <div>  
	       <p>My LALACOSME</p>
	       <ul id="footerul2"> 
			  <li><a href="#">My Account</a></li>
			  <li><a href="#">Order Status</a></li>
			  <li><a href="#">Beauty Insider</a></li> 
			  <li><a href="#">Rewards Bazaar</a></li> 
			  <li><a href="#">Loves</a></li> 
			  <li><a href="#">Download the App</a></li> 
	       </ul>
       </div>
       <div>
       <p>Help & FAQs</p>
	       <ul id="footerul2"> 
			  <li><a href="#">Online Ordering</a></li>
			  <li><a href="#">Shipping</a></li>
			  <li><a href="#">Billing</a></li> 
			  <li><a href="#">Returns & Exchanges</a></li> 
			  <li><a href="#">International Shipments</a></li> 
			  <li><a href="#">Customer Service</a></li> 
			  <li><a href="#">Contact Us</a></li>
			  <li><a href="#">Accessibility</a></li> 
	       </ul>
       </div>
       <div>
	       <p>Ways to Shop</p>
	       <ul id="footerul2"> 
			  <li><a href="#">Just Arrived</a></li>
			  <li><a href="#">Bestsellers</a></li>
			  <li><a href="#">Beauty Offers</a></li> 
			  <li><a href="#">Gift Cards</a></li> 
			  <li><a href="#">Store Locations</a></li> 
			  <li><a href="#">Book a Reservation</a></li> 
			  <li><a href="#">LALACOSME + Google Home</a></li> 
	       </ul>
       </div> 
      </div>
      <div id="reallast">
      <p>Sign up for LALACOSME Emails</p>
      <input type="email" placeholder="   Email address">
       <p class="midp">Choose Region:</p>
      <div id="region"> 
          <ul>
	          <li id="lastsub"><a href="#">Canada (English)</a>
	             <ul>
			          <li><a href="#">United States</a></li>
			          <li><a href="#">Canada (Francais)</a></li>
		          </ul>
	          </li>
	      </ul>
      </div>
      <img src="${pageContext.request.contextPath }/resources/images/cosme/footericon.jpg.png">
      </div>
      <div id="right">
        <p>LALACOSME Beauty Canada, Inc. (600 de Maisonneuve Boulevard West, Suite 2400, Montreal Quebec, H3A 3J2, LALACOSME.ca) is 
           requesting consent on its own behalf and on behalf of LALACOSME USA, Inc.</p>
           
           <p>(525 Market Stree, Floor 32, San Francisco, CA 94105, LALACOSME.com). You may withdraw your consect at any time.</p>
           <p>Copyright 2019 LALACOSME USA, Inc. All rights reserved. Terms of Use | Privacy Policy</p>
           <p> 1 877 LALACOSME(1 877 737 4672)|TTY (1 888 866 9845)</p>
      </div>
   </footer>
</body>
</html>