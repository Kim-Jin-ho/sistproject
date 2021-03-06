<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	String checkid = (String)session.getAttribute("checkid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=cp %>/js/mainjs/jquery.js"></script>
<script type="text/javascript" src="<%=cp %>/js/userjs/jquery.countdownTimer.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

var pwcheck= false; //pw유효성 확인 변수
var pwcheck_ok= false; //pw 재확인 변수
var telcheck= false; //핸드폰번호 유효성 확인 변수(중복검사도 추가해야하나?)
var telcheck_ok= false; //핸드폰인증번호 확인 변수

$(document).ready(function()
{	
	  if($('#submitbutton').val()==1)
	  {
		 alert("정보가 정상적으로 수정되었습니다..");
		 location.href="<%=cp %>/main/userPwcheck.jsp";
	  }	
	 
	  //①받아온값에 따라 자동으로 선택되도록 한다.(이메일)
	  var cmpny_email = "${user.email }";
	  var array_cmpny_email = cmpny_email.split("@")
	  $('#email1').val(array_cmpny_email[0]);
	  $('#email2').val(array_cmpny_email[1]);
	
	  //② 비밀번호유효성검사=======================================================================================
		 $('#password').keyup(function() 
		 {
			var reg_pw = /^.*(?=.{8,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;  
			if(!reg_pw.test($("#password").val())){
				pwcheck=false;
				$('#password_pw').html("※ 비밀번호 형식이 잘못되었습니다 (영문,숫자를 혼합하여 8~16자 이내)").css("color","red");	
			}
			else{
				pwcheck=true;
				$('#password_pw').html("※ 안전한 비밀번호 입니다.").css("color","blue");
			}	
		 });
		 
		 //③ 비밀번호 확인======================================================================================= 
		 $('#password_chk').keyup(function() 
		 {
	      if ($('#password').val() != $('#password_chk').val()){
	      	   $('#pw_check_ok').html("※ 비밀번호가 일치하지 않습니다.").css("color","red"); // 레이어에 HTML 출력
	       	   pwcheck_ok = false;
	          }
	      else{
	    	  pwcheck_ok=true;
	          $('#pw_check_ok').text("※ 비밀번호가 일치 합니다.").css("color","blue"); // 레이어에 텍스트 출력
	      	  }
		 });  
		 
		 //④ 이메일 셀렉트값 선택시 값이 들어오도록 선택하는 쿼리=====================================================
		 $('#email_select').click(function() 
		 {
			$('#email2').val($('#email_select').val());		 
		 });
				 
		//⑤ 휴대폰인증번호 일치 확인=======================================================================================
		$('#tel_send_check').click(function(){
	    if ($('#telhidden').val() != $('#tel_check').val()){
	    	telcheck_ok=false;
	        $('#tel_check_check').html("※ 인증번호가 일치하지 않습니다.").css("color","red"); // 레이어에 HTML 출력
	    	}
	    else{
	    	telcheck_ok=true;
	        $('#tel_check_check').text("※ 인증이완료되었습니다.").css("color","blue"); // 레이어에 텍스트 출력
	    	}
		});
		
		//⑥이름 공백여부확인
		$('#name').keyup(function(){
		if(!($("#name").val()=="")) //이름입력이 공백이 아닐 경우엔
			$('#name_check_ok').html("").css("color","red");
		});
	});   

	//⑦ 우편번호 확인 함수=======================================================================================
	function addrfun(){
	new daum.Postcode({
	    oncomplete: function(data) {
	        document.getElementsByName("strZipcode_1")[0].value = data.zonecode;
	        document.getElementsByName("strZipcode_2")[0].value = data.roadAddress;
	    }
	}).open();
	}

	//⑧ 전화번호 인증번호 생성 및 유효성 확인=======================================================================================
	function telsend()
	{
		var tel1 = document.getElementById("tel1").value;
		var tel2 = document.getElementById("tel2").value;
		var tel3 = document.getElementById("tel3").value;
		var regExOnlyNum=/^[0-9]*$/;
			
		if(tel1.length==3 && tel2.length==4 && tel3.length==4 && regExOnlyNum.test(tel1) && regExOnlyNum.test(tel2) && regExOnlyNum.test(tel3))
			{
				$('#tel_check_check_check').html("").css("color","red");
				telcheck=true;
				/* 인증번호 난수발생 */
				randomA = ((Math.random()+0.1)*1000000);
				randomA = Math.trunc(randomA);
				alert(randomA); //test	
				document.getElementById("telhidden").value = randomA;
				
				$("#tel_check_check").countdowntimer({
					minutes : 3,
					size : "lg",
			        timeUp : timeIsUp
				}); 
			}
		else{
			telcheck=false;
		    $('#tel_check_check_check').html("※ 잘못된 전화번호 입니다.").css("color","red");
		}
	}
	//⑨ 인증시간 만료 함수정의=======================================================================================
	function timeIsUp()
	{
		 alert('인증시간이 만료되었습니다.');
		 randomA = "";
	}

//⑩ 전화번호 인증번호 생성 및 유효성 확인=======================================================================================
function telsend()
{
	var tel1 = document.getElementById("tel1").value;
	var tel2 = document.getElementById("tel2").value;
	var tel3 = document.getElementById("tel3").value;
	var regExOnlyNum=/^[0-9]*$/;
		
	if(tel1.length==3 && tel2.length==4 && tel3.length==4 && regExOnlyNum.test(tel1) && regExOnlyNum.test(tel2) && regExOnlyNum.test(tel3))
		{
			telcheck=true;
			/* 인증번호 난수발생 */
			randomA = ((Math.random()+0.1)*1000000);
			randomA = Math.trunc(randomA);
			alert(randomA); //test	
			document.getElementById("telhidden").value = randomA;
			
			$("#tel_check_check").countdowntimer({
				minutes : 3,
				size : "lg",
		        timeUp : timeIsUp
			}); 
		}
	else{
		telcheck=false;
	    $('#tel_check_check_check').html("※ 잘못된 전화번호 입니다.").css("color","red");
	}
}
	
//⑪ 유효성검사 함수정의=======================================================================================

function sendIt()
{
	var regExEmail=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/; //이메일유효성 
	var email = $("#email1").val()+"@"+$("#email2").val(); //이메일 값
	if($("#password").val()==""){ //비밀번호가 공백일 경우엔
		$('#password_pw').html("※ 비밀번호를 입력해주세요.").css("color","red");
		return;	
		}	
	if($("#password_chk").val()==""){ //비밀번호 재확인이 공백일 경우엔
		$('#pw_check_ok').html("※ 비밀번호를 확인해주세요.").css("color","red");
		return;
		}
	if($("#name").val()==""){ //이름입력이 공백일 경우엔
		$('#name_check_ok').html("※ 이름을 입력해 주세요.").css("color","red");
		return;
		} 
	if($("#date").val()==""){ //생년월일이 공백일 경우엔
		$('#date_check_ok').html("※ 생년월일을 입력해 주세요.").css("color","red");
		return;
		} 
	if($("#tel1").val()==""||$("#tel2").val()==""||$("#tel3").val()==""){ //휴대폰번호가 공백일 경우엔
		$('#tel_check_check_check').html("※ 휴대폰번호를 입력해 주세요.").css("color","red");
		return;
		}
	if($("#email1").val()==""||$("#email2").val()==""){ //이메일주소가 공백일 경우에
		$('#email_check_confirm').html("※ 이메일주소를 입력해 주세요.").css("color","red");
		return;
		}
	if(!regExEmail.test(email)){ //이메일유효성확인
		$('#email_check_confirm').html("※ 잘못된 이메일 형식 입니다.").css("color","red");
		return;
		}
	if(regExEmail.test(email)) //이메일유효성확인
		$('#email_check_confirm').html("※ 이메일 입력이 완료되었습니다.").css("color","blue");
	if(pwcheck==false||pwcheck_ok==false||telcheck==false||telcheck_ok==false)
		return;
	if($("#strZipcode_1").val()==""||$("#strZipcode_2").val()==""||$("#strZipcode_3").val()==""){ //주소가 공백일 경우엔
		$('#addr_check_confirm').html("※ 주소를 입력해주세요.").css("color","red");
		return;
		}
	else 	
		$("#user_main").submit();
}

</script>
</head>
<body>
	<!-- GNB 영역 -->
	<c:import url="${cp }/main/mainGnb.jsp"/>
	
	<!-- 메인 메뉴영역 -->
    <c:import url="${cp }/main/mainMenu.jsp"/>
	
	<hr style="border: solid 1px red">
	
	<div class="containersection">
	
	<div class="container">
		<c:import url="${cp }/user/UserMenu.jsp"/>
	
		<h5>정보 수정</h5>
		
	<!-- ↑ 여기까지 공통으로 가져가야할 내용 -->	
	<form action="<%=cp %>/userupdate.love" id="user_main"  class="form-horizontal">
		
		<!-- 아이디 입력 -->
		<div class="form-group">
	    	<label for="id" class="col-sm-2 control-label">ID 입력 : </label>
	    	<div class="col-sm-4">
	      	<input type="text" class="form-control" name="id" id="id" maxlength="16"  value="<%=checkid %>" readonly="readonly">
	    	</div>
	    	<label class="control-label"><span id="id_check" class="check_css">※ 최소 8자 이상~16자 이하의 영문, 숫자, _만 사용할 수 있습니다.</span></label>
  		</div>
			
		<!-- PW 입력 -->	
		<div class="form-group">
	    	<label for="password" class="col-sm-2 control-label">PW 입력 : </label>
	    	<div class="col-sm-6">
	      	<input type="password" class="form-control" name="password" id="password" maxlength="16">
	    	</div>
	    	<label class="control-label"><span id = "password_pw" class="check_css">※ 최소 8자 이상 ~ 16자 이하로 등록해 주세요.</span></label>
  		</div>
  					

		<!-- PW 확인 -->
		<div class="form-group">
	    	<label for="passwordcheck" class="col-sm-2 control-label">PW 확인: </label>
	    	<div class="col-sm-6">
	      	<input type="password" class="form-control" name="password_chk" id="password_chk" maxlength="16">
	    	</div>
	    	<label class="control-label"><span id="pw_check_ok" class="check_css">※ 비밀번호를 다시 한번 입력해 주세요.</span></label>
  		</div>
  		
  		
			
		<!-- 이름 입력 -->			
		<div class="form-group">
	    	<label for="name" class="col-sm-2 control-label">이름 입력 : </label>
	    	<div class="col-sm-6">
	      	<input type="text" class="form-control" name="name" id="name" maxlength="10" value="${user.name }">
	    	</div>
	    	<label class="control-label"><span id="name_check_ok" class="check_css"></span></label>
  		</div>
  		
  					
		<!-- 생년월일 입력 -->			
		<div class="form-group">
	    	<label for="date" class="col-sm-2 control-label">생년월일 : </label>
	    	<div class="col-sm-6">
	      	<input type="date" class="form-control" name="date" id="date" value="${user.birth }">
	    	</div>
	    	<label class="control-label"><span id="date_check_ok" class="check_css"></span></label>
  		</div>
  		
		
		<!-- 휴대폰번호 입력 -->
		<div class="form-group">
	    	<label for="telnum" class="col-sm-2 control-label">휴대폰번호 : </label>
	    	<div class="col-sm-2">
	      	<input type="tel" name="tel1" id="tel1" value="010" maxlength="3" class="form-control">
	    	</div>
	    	<div class="col-sm-2">
	      	<input type="tel" name="tel2" id="tel2" maxlength="4" class="form-control">
	    	</div>
	    	<div class="col-sm-2">
	      	<input type="tel" name="tel3" id="tel3" maxlength="4" class="form-control">
	    	</div>
	    	<div class="col-sm-1">
	    	<button type="button" name="tel_send" id="tel_send" onclick="telsend();" class="btn btn-primary">인증번호전송</button>
	    	</div>
	    	<div>
	    	<label class="control-label"><span id="tel_check_check_check" class="check_css" style="margin-left: 60px"></span></label>
	    	</div>
	    	<input type="text" id="telhidden" hidden="hidden" value="8521">
  		</div>	
		
			 
		<!-- 인증번호 입력 -->			
		<div class="form-group">
	    	<label for="telnumcheck" class="col-sm-2 control-label">인증번호 : </label>
	    	<div class="col-sm-2">
	      	<input type="text" name="tel_check" id="tel_check" placeholder="인증번호 입력" class="form-control">
	    	</div>
	    	<div class="col-sm-1">
	    	<button type="button" name="tel_send_check" id="tel_send_check" class="btn btn-primary">인증번호확인</button>
	    	</div>
	    	<div>
	    	<label class="control-label"><span id="tel_check_check" style="margin-left: 60px"></span></label>
	    	</div>	
  		</div>		
		
			
			
		<!-- 이메일 입력 -->			
		<div class="form-group">
	    	<label for="email" class="col-sm-2 control-label">이메일 : </label>
	    	<div class="col-sm-2">
	      	<input type="text" class="form-control" name="email1" id="email1" maxlength="14"> 
	    	</div>
	    	<div class="col-sm-2">
	      	<input type="text" class="form-control" name="email2" id="email2"> 
	    	</div>
	    	<div class="col-sm-2">
	    	<select class="form-control email_select" name="email_select" id="email_select">
			  	<option value="">선택하세요</option>
			  	<option value="hanmail.net">hanmail.net</option>
			  	<option value="nate.com">nate.com</option>
			  	<option value="empal.com">empal.com</option>
				<option value="hotmail.com">hotmail.com</option>
				<option value="naver.com">naver.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="">(직접입력)</option>		
				</select>
	    	</div>
	    	<div>
	    	<label class="control-label"><span id="email_check_confirm" class="check_css"></span></label>
	    	</div>
  		</div>	
					
			
		<!-- 성별 체크 -->			
		<div class="form-group">	
			<label for="gender" class="col-sm-2 control-label">성&nbsp;별 : </label>
			<div class="col-sm-6">
			<label class="radio-inline">
				<input type="radio" name="gender" id="gendergirl" value="1"> 여성	</label>
			<label class="radio-inline">
				<input type="radio" name="gender" id="genderman" value="2"> 남성	</label>
			</div>	
		</div>		
			

		<!-- 우편번호 및 주소 입력 -->		
		<div class="form-group">
	    	<label for="addrNum" class="col-sm-2 control-label">우편번호 : </label>
	    	<div class="col-sm-5">
	      	<input type="text" class="form-control" name="strZipcode_1" id="strZipcode_2" maxlength="50"  value="${user.addr_No }">
	    	</div>
	    	<div class="col-sm-1">
	    	<button type="button" class="button red mr5 btn btn-primary" id="btnAddr" onclick="addrfun();">우편번호검색</button>
	    	</div>
  		</div>
		<div class="form-group">
	    	<label for="addr1" class="col-sm-2 control-label">기본주소 : </label>
	    	<div class="col-sm-6">
	      	<input type="text" class="form-control" name="strZipcode_2" id="strZipcode_1" maxlength="50"  value="${user.addr1 }">
	    	</div>
  		</div>
  		<div class="form-group">
	    	<label for="addr2" class="col-sm-2 control-label">상세주소 : </label>
	    	<div class="col-sm-6">
	      	<input type="text" class="form-control" name="strZipcode_3" id="strZipcode_3" maxlength="50" placeholder="상세주소를 입력해주세요"  value="${user.addr2 }">
	    	</div>
	    	<label class="control-label"><span id="addr_check_confirm" class="check_css"></span></label>
  		</div>	
			
		<!-- 회원가입완료 및 취소 -->
		<div class="form-group">
	    	<label class="col-sm-3 control-label"></label>
	    	<div class="col-sm-1">
	      	<button type="button" onclick="sendIt();" id="submitbutton" class="btn btn-primary" value="${check }">정보수정</button>
	    	</div>
	    	<label class="col-sm-1 control-label"></label>
	    	<div class="col-sm-1">
	      	<a href="<%=cp %>/main.love"><button type="button" id="resetbutton" class="btn btn-primary">취소(메인이동)</button></a>
	    	<!--  회원페이지 메인화면으로  -->
	    	</div>
  		</div>			
					
		<!-- 기업회원가입 폼 종료 -->		
	</form>
	</div>
</div>
	<c:import url="${cp }/main/footer.jsp"/>
</body>
</html>