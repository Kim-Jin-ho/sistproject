<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=cp %>/css/hyuncss/bootstrap.css" rel="stylesheet">
<link href="<%=cp %>/css/hyuncss/main.css" rel="stylesheet">
<link href="<%=cp %>/css/font-awesome.min.css" rel="stylesheet">
<script src="<%=cp %>/js/mainjs/jquery.js"></script>
<script src="<%=cp %>/js/mainjs/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function()
{		
	$('#userloginaction').css("display","block");//일반회원 디스플레이block
	$('#cmpnyloginaction').css("display","none");//기업회원 디스플레이none
	$('#adminloginaction').css("display","none");//관리자 디스플레이none
	
	$('#search_id').click(function(){//아이디찾기를 눌렀을경우 팝업창 생성 
		window.open('<%=cp %>/main/idSearch.jsp', 'idsearch','resizable=yes scrollbars=yes width=1000 height=370');
	});
	
	$('#search_userpw').click(function(){ //비밀번호 찾기를 눌렀을경우 팝업창 생성
		window.open("<%=cp %>/main/pwSearch.jsp", 'userpwsearch','resizable=yes scrollbars=yes width=1000 height=370');
	});	
	$('#login').click(function(){ //로그인버튼을 눌렀을때
		if($('#id').val()=="")
			{
			 alert("아이디를 입력하세요");
			 return;
			}
		if($('#password').val()=="")
			{
			 alert("비밀번호를 입력하세요");
			 return;
			}
		$.post("<%=cp %>/userlogin.love", { "id":$('#id').val(),"password":$('#password').val() }, function(args){		
	 	var name=args.trim(); //반환된 AJAX값을 name변수에 담아서 (지금은 이름만받았지만 회원코드(1,2,3 중한가지),세션 같이 넘겨야할듯!!)
		if(name==null||name==""){
			alert("회원정보가 올바르지않습니다. 확인후 다시 로그인 해 주세요");
		return;
		}	
		else//정상적으로 로그인이되었을경우 메인페이지에 name값을 가지고 돌아간다.
			location.href="<%=cp %>/main.love"; 
		});	
	});
	
//===============================================================================================
	//일반회원탭을 눌렀을 경우
	$('#userselect_login').click(function(){
	$('#userloginaction').css("display","block");//일반회원 디스플레이block
	$('#cmpnyloginaction').css("display","none");//기업회원 디스플레이none
	$('#adminloginaction').css("display","none");//관리자 디스플레이none
	});
//===============================================================================================
	//기업회원탭을 눌렀을 경우
	$('#cmptyselect_login').click(function(){
		$('#cmpnyloginaction').css("display","block");//기업회원 디스플레이block
		$('#userloginaction').css("display","none");//일반회원 디스플레이none
		$('#adminloginaction').css("display","none");//관리자 디스플레이none
				
		$('#search_cmpnypw').click(function(){ //비밀번호 찾기를 눌렀을경우 팝업창 생성
			window.open("<%=cp %>/main/cmpnyPwSearch.jsp", 'cmpnypwsearch','resizable=yes scrollbars=yes width=1000 height=370');
		});	
		
		$('#cmpnylogin').click(function(){ //로그인버튼을 눌렀을때
			 if($('#cmpnyid').val()==""){
			 alert("사업자번호를 입력하세요");
			 return;
			 }
			 if($('#cmpnypassword').val()==""){
			 alert("비밀번호를 입력하세요");
			 return;
			 }
			 $.post("<%=cp %>/cmpnylogin.love", { "cmpnyid":$('#cmpnyid').val(),"cmpnypassword":$('#cmpnypassword').val() }, function(args){		
		 	 var usrname=args.trim(); //반환된 AJAX값을 name변수에 담아서 (지금은 이름만받았지만 회원코드(1,2,3 중한가지),세션 같이 넘겨야할듯!!)
			 if(usrname==null||usrname==""){
				alert("회원정보가 올바르지않습니다. 확인후 다시 로그인 해 주세요");
				return;
			 }	
			 else//정상적으로 로그인이되었을경우 (임시)메인페이지에 name값을 가지고 돌아간다.
				 location.href="<%=cp %>/company/CompanyMain.love";  
			 });	
		}); 
	});
//===============================================================================================
	//관리자탭을 눌렀을 경우
	$('#admin').click(function(){
		$('#adminloginaction').css("display","block");//관리자 디스플레이block
		$('#userloginaction').css("display","none");//기업회원 디스플레이none
		$('#cmpnyloginaction').css("display","none");//관리자 디스플레이none		
	});	
	$('#adminlogin').click(function(){ //로그인버튼을 눌렀을때
		if($('#adminid').val()=="")
			{
			 alert("아이디를 입력하세요");
			 return;
			}
		if($('#adminpassword').val()=="")
			{
			 alert("비밀번호를 입력하세요");
			 return;
			}
		$.post("<%=cp %>/adminlogin.love", { "adminid":$('#adminid').val(),"adminpassword":$('#adminpassword').val() }, function(args){		
	 	var name=args.trim(); //반환된 AJAX값을 name변수에 담아서 (지금은 이름만받았지만 회원코드(1,2,3 중한가지),세션 같이 넘겨야할듯!!)
		if(name==null||name==""){
			alert("회원정보가 올바르지않습니다. 확인후 다시 로그인 해 주세요");
		return;
		}	
		else//정상적으로 로그인이되었을경우 메인페이지에 name값을 가지고 돌아간다.
			location.href="<%=cp %>/AdminCoMemberList.love";  //관리자페이지로 바꿔야함!!!!★★★★★★
		});	
	});
	

});

</script>
</head>


<body>
	<!-- 첫번째 헤더영역 -->
	<c:import url="${cp }/main/mainGnb.jsp"/>
	<section>
	<section></section>
		<hr>
		<!-- 탭 로그인창 -->	
		<div class="container" id="section">	
			<ul id="myTab" class="nav nav-tabs">
		 	 	<li class="active"><a href="#userselect_login" data-toggle="tab" id="userselect_login">개인회원</a></li>
		  		<li class=""><a href="#cmptyselect_login" data-toggle="tab" id="cmptyselect_login">기업회원</a></li>
		  		<li class=""><a href="#admin" data-toggle="tab" id="admin">관리자</a></li>
			</ul>
		
				
			<!-- 회원로그인구간 -->
			<form action="<%=cp %>/login.love" id="userloginaction" class="form-horizontal">
				<div class="row">
					<div class="col-md-2">
						<ul>
			                  <li><br>
			                  	   <div class="control-label"><label for="id">아이디 입력 : </label></div>
			                  </li>
			                  <li><br>
			                  	    <div class="control-label"><label for="password">패스워드 입력 : </label></div>
			                  </li>
			            </ul>
					</div>
					<div class="col-md-6">
						<ul>
			                  <li><br>
			                  	   <input type="text" class="form-control" name="id" id="id" maxlength="16" placeholder="아이디를 입력해주세요">
			                  </li>
			                  <li><br>
			                  	   <input type="password" class="form-control" name="password" id="password" maxlength="16" placeholder="패스워드를 입력해주세요">
			                  </li>
			            </ul>
					</div>
					<div class="col-md-2"><br>		
					<!-- 로그인 DB확인후 이동-->
					<button type="button" id="login" class="btn btn-primary col-sm-8" style="height:85px;">로그인</button>
					</div>
				</div>
				<hr><br><br>
				<!-- 일반회원 아이디/비밀번호 찾기 입력구간 -->
				<div class="row">
					<div class="col-md-3 col-md-offset-1">
						<ul>
							<li>
								<div class="loginimage"><img src="<%=cp %>/images/main/pwd.png" alt="아이디찾기"></div>
							</li>
							<li>
							<p class="center">
							아이디를 잊어버리셨나요?<br>고객님의 아이디를 찾아드립니다.</p>
							</li>
							<li>
							<button type="button" id="search_id" class="btn btn-primary col-md-offset-3">아이디찾기</button>
							</li>
						</ul>
					</div>
					
				
					<div class="col-md-3">
						<ul>
							<li>
								<div class="loginimage"><img src="<%=cp %>/images/main/pwd.png" alt="비밀번호찾기"></div>
							</li>
							<li>
							<p class="center">
							비밀번호를 잊어버리셨나요?<br>고객님의 비밀번호를 찾아드립니다.</p>
							</li>
							<li>
							<button type="button" id="search_userpw" class="btn btn-primary col-md-offset-3">비밀번호찾기</button>
							</li>
						</ul>
					</div>
					
					
					<div class="col-md-3">
						<ul>
							<li>
								<div class="loginimage"><img src="<%=cp %>/images/main/sea.png" alt="회원가입"></div>
							</li>
							<li>
							<p class="center">
							아직 회원이 아니신가요?<br>회원가입후 많은 혜택을 누려보세요.</p>
							</li>
							<li>
							<a href="<%=cp %>/signupcmpnycontroller.love?num=1"><button type="button" id="search_id" class="btn btn-primary col-md-offset-3">회원가입</button></a>
							</li>
						</ul>
					</div>
				</div>
			</form>
			
				
			    	
			
			<!-- 기업회원 로그인구간 -->
			<form action="#" id="cmpnyloginaction" class="form-horizontal">
				<div class="row">
					<div class="col-md-2">
						<ul>
			                  <li><br>
			                  	   <div class="control-label"><label for="id">사업자번호 입력 : </label></div>
			                  </li>
			                  <li><br>
			                  	    <div class="control-label"><label for="password">패스워드 입력 : </label></div>
			                  </li>
			            </ul>
					</div>
					<div class="col-md-6">
						<ul>
			                  <li><br>
			                  	   <input type="text" class="form-control" name="cmpnyid" id="cmpnyid" maxlength="10"  placeholder="사업자번호(-제외 10자리)를 입력해주세요">
			                  </li>
			                  <li><br>
			                  	   <input type="password" class="form-control" name="cmpnypassword" id="cmpnypassword" maxlength="16" placeholder="패스워드를 입력해주세요">
			                  </li>
			            </ul>
					</div>
					<div class="col-md-2"><br>		
					<!-- 로그인 DB확인후 이동-->
					<button type="button" id="cmpnylogin" class="btn btn-primary col-sm-8" style="height:85px;">로그인</button>
					</div>
				</div>
				<hr><br><br>
				<!-- 기업회원 비밀번호찾기 및 로그인 회원가입 -->
				<div class="row">
					<div class="col-md-3 col-md-offset-2">
						<ul>
							<li>
								<div class="loginimage"><img src="<%=cp %>/images/main/pwd.png" alt="비밀번호찾기"></div>
							</li>
							<li>
							<p class="center">
							비밀번호를 잊어버리셨나요?<br>고객님의 비밀번호를 찾아드립니다.</p>
							</li>
							<li>
							<button type="button" id="search_cmpnypw" class="btn btn-primary col-md-offset-3">비밀번호찾기</button>
							</li>
						</ul>
					</div>
					
					
					<div class="col-md-3">
						<ul>
							<li>
								<div class="loginimage"><img src="<%=cp %>/images/main/sea.png" alt="회원가입"></div>
							</li>
							<li>
							<p class="center">
							아직 회원이 아니신가요?<br>회원가입후 기업 혜택을 누려보세요.</p>
							</li>
							<li>
							<a href="<%=cp %>/signupcmpnycontroller.love?num=2"><button type="button" id="search_id" class="btn btn-primary col-md-offset-3">회원가입</button></a>
							</li>
						</ul>
					</div>
				</div>
			</form>
			
			
			
			
			
			<!-- 관리자로그인구간 -->
			<form action="#" id="adminloginaction" class="form-horizontal">
				<div class="row">
					<div class="col-md-2">
						<ul>
			                  <li><br>
			                  	   <div class="control-label"><label for="id">아이디 입력 : </label></div>
			                  </li>
			                  <li><br>
			                  	    <div class="control-label"><label for="password">패스워드 입력 : </label></div>
			                  </li>
			            </ul>
					</div>
					<div class="col-md-6">
						<ul>
			                  <li><br>
			                  	   <input type="text" class="form-control" name="adminid" id="adminid" maxlength="16" placeholder="아이디를 입력해주세요">
			                  </li>
			                  <li><br>
			                  	   <input type="password" class="form-control" name="adminpassword" id="adminpassword" maxlength="16" placeholder="패스워드를 입력해주세요">
			                  </li>
			            </ul>
					</div>
					<div class="col-md-2"><br>		
					<!-- 로그인 DB확인후 이동-->
					<button type="button" id="adminlogin" class="btn btn-primary col-sm-8" style="height:85px;">로그인</button>
					</div>
				</div>
				<hr><br><br>
				<section style="padding-bottom:150px;"></section>
			</form><!-- 관리자폼의종료 -->
		</div><!-- 전체 컨테이너영역의 종료 -->	
		
	</section><!-- 전체 섹션영역의 종료 -->
	<section></section>
	
	<c:import url="${cp }/main/footer.jsp"/>
	
</body>
</html>