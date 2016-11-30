<!--  -->
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
<link href="<%=cp %>/css/hyuncss/bootstrap.min.css" rel="stylesheet">
<link href="<%=cp %>/css/font-awesome.min.css" rel="stylesheet">
<link href="<%=cp %>/css/hyuncss/main.css" rel="stylesheet">
<script src="<%=cp %>/js/mainjs/jquery.js"></script>
<script src="<%=cp %>/js/mainjs/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="<%=cp %>/js/userjs/jquery.countdownTimer.js"></script>
<script type="text/javascript">
var cmpnycheck= false; //사업자중복검사 및 유s효성 확인 변수
var pwcheck= false; //pw유효성 확인 변수
var pwcheck_ok= false; //pw 재확인 변수
var telcheck= false; //핸드폰번호 유효성 확인 변수(중복검사도 추가해야하나?)
var telcheck_ok= false; //핸드폰인증번호 확인 변수

$(document).ready(function()
{	
	if($('#submitbutton').val()==1)
	{
		alert("Your My Sunshine의 기업회원이 되신것을 축하합니다.");
		location.href="<%=cp %>/main/login.jsp";
	}
	
	//① 사업자번호 중복 및 유효성검사=======================================================================================	
    $('#idNum1').keyup(function(){
	    $('#idNum2').keyup(function(){
			$('#idNum3').keyup(function(){	
			
				var regExOnlyNum=/^[0-9]*$/; //사업자번호유효성
				var fullIdNum= $('#idNum1').val() + $('#idNum2').val()+ $('#idNum3').val();
				if(!regExOnlyNum.test(fullIdNum)||!(fullIdNum.length==10)){//유효성이 안되거나 사업자번호가10자리가 되지않을경우
				 	$('#id_check').html("※ 10자리의 사업자 번호를 입력해 주세요.").css("color","black");
					}
				else{ 
					$.post("<%=cp %>/cmpnyinsertcheck.love", {"fullIdNum" : fullIdNum}, function(args){
	 				var idkk = args.trim();
						
	 			 	 if (idkk==1){
	 			 		cmpnycheck= false;
	 				 	$('#id_check').html("※ 이미가입되어 있는 사업자 번호입니다.").css("color","red");
	 				 	return;
	 				 }	
	 				 else{
	 					 cmpnycheck= true;
	 					 $('#id_check').html("※ 사용가능한 사업자 번호 입니다.").css("color","blue");
	 					 return;
	 					 }
	 			 	 
	 				 });
	 				 }	
			 });
		 });
	 });
		  
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
	
	//⑥기업명 공백여부확인
	$('#name').keyup(function(){
	if(!($("#name").val()=="")) //기업명이 공백일 경우엔
		$('#name_check_ok').html("").css("color","red");
	});
	
	//⑦기업카테고리 선택시 공백값 send()시 나오는 경고메세지 삭제 
	$('#cmpny_select').change(function(){
		if(!($("#cmpny_select").val()=="null")) //기업명이 공백일 경우엔
			$('#cmpny_select_check_ok').html("").css("color","red");
	});
});   

//⑧ 우편번호 확인 함수=======================================================================================
function addrfun(){
new daum.Postcode({
    oncomplete: function(data) {
        document.getElementsByName("strZipcode_1")[0].value = data.zonecode;
        document.getElementsByName("strZipcode_2")[0].value = data.roadAddress;
    }
}).open();
}

//⑨ 전화번호 인증번호 생성 및 유효성 확인=======================================================================================
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
//⑩ 인증시간 만료 함수정의=======================================================================================
function timeIsUp()
{
	 alert('인증시간이 만료되었습니다.');
	 randomA = "";
}
	
//⑪ 유효성검사 함수정의=======================================================================================
function sendIt()
{
	var regExEmail=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/; //이메일유효성 
	var email = $("#email1").val()+"@"+$("#email2").val(); //이메일 값
	if($("#idNum1").val()==""||$("#idNum2").val()==""||$("#idNum3").val()==""){ //사업자번호가 공백일경우엔
		$('#id_check').html("※ 사업자번호를 입력해주세요.").css("color","red");
		return;
		}
	if($("#password").val()==""){ //비밀번호가 공백일 경우엔
		$('#password_pw').html("※ 비밀번호를 입력해주세요.").css("color","red");
		return;	
		}	
	if($("#password_chk").val()==""){ //비밀번호 재확인이 공백일 경우엔
		$('#pw_check_ok').html("※ 비밀번호를 확인해주세요.").css("color","red");
		return;
		} 	
    if($("#cmpny_select").val()=="null"){  //기업종류가 공백일경우엔
		$('#cmpny_select_check_ok').html("※ 기업종류를 선택해주세요.").css("color","red");
		return;
		}	 	
	if($("#name").val()==""){ //기업명이 공백일 경우엔
		$('#name_check_ok').html("※ 기업명(상호)을 입력해 주세요.").css("color","red");
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
	if($("#strZipcode_1").val()==""||$("#strZipcode_2").val()==""||$("#strZipcode_3").val()==""){ //주소가 공백일 경우엔
		$('#addr_check_confirm').html("※ 주소를 입력해주세요.").css("color","red");
		return;
		}
	if($("#cmpytextrea").val()==""){ //기업소개가 공백일 경우엔
		$('#cmpytextrea_check_confirm').html("※ 기업소개를 입력해 주세요.").css("color","red");
		return;
		}
	if(cmpnycheck==false||pwcheck==false||pwcheck_ok==false||telcheck==false||telcheck_ok==false)
		return;
	else 	
		{
		$("#join_main").submit();
		}
}

</script>
</head>
<body>
	<c:import url="${cp }/main/mainGnb.jsp"/>
	
	<section>
	<form action="<%=cp %>/cmpnyinsert.love" id="join_main"  class="form-horizontal">
		
		<!-- 기업회원가입 입력 폼 -->
		<div class="form-group">
			<!-- 사업자번호 입력 -->
			<div class="form-group">
	    	<label for="cmpnynum" class="col-sm-2 control-label">사업자번호 : </label>
	    		<div class="col-sm-1">
	      			<input type="text" name="idNum1" id="idNum1" maxlength="3" class="form-control">
	    		</div>
	    		<div class="col-sm-1">
	      			<input type="text" name="idNum2" id="idNum2" maxlength="4" class="form-control">
	    		</div>
	    		<div class="col-sm-1">
	      			<input type="text" name="idNum3" id="idNum3" maxlength="3" class="form-control">
	    		</div>
	    	<div>
	    	<label class="control-label"><span id = "id_check" class="check_css"></span></label>
	    	</div>
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
			
		<!-- 기업종류 입력 -->
		<div class="form-group">
	    	<label for="cmpnytext" class="col-sm-2 control-label">업종 명 : </label>
		    <div class="col-sm-2">
		    	<select class="form-control cmpny_select" name="cmpny_select" id="cmpny_select">
				  	<option value="null">선택하세요</option>
					<option value="1">웨딩홀</option>
					<option value="2">스튜디오</option>
					<option value="3">드레스</option>
					<option value="4">헤어메이크업</option>		
					</select>
		    </div>
		    <div>
		    	<label class="control-label"><span id="cmpny_select_check_ok" class="check_css"></span></label>
		    </div>
	  	</div>	
	    
	    
	    <!-- 기업명 입력 -->			
		<div class="form-group">
	    	<label for="cmpnytext" class="col-sm-2 control-label">기업&nbsp;명 : </label>
	    	<div class="col-sm-6">
	      	<input type="text" class="form-control" name="name" id="name" maxlength="10">
	    	</div>
	    	<label class="control-label"><span id="name_check_ok" class="check_css"></span></label>
  		</div>
  		
  		<!-- 휴대폰번호 입력 -->
		<div class="form-group">
	    	<label for="telnum" class="col-sm-2 control-label">휴대폰번호 : </label>
	    	<div class="col-sm-1">
	      		<input type="tel" name="tel1" id="tel1" value="010" maxlength="3" class="form-control">
	    	</div>
	    	<div class="col-sm-1">
	      		<input type="tel" name="tel2" id="tel2" maxlength="4" class="form-control">
	    	</div>
	    	<div class="col-sm-1">
	      		<input type="tel" name="tel3" id="tel3" maxlength="4" class="form-control">
	    	</div>
	    	<div class="col-sm-1">
	    		<button type="button" name="tel_send" id="tel_send" onclick="telsend();" class="btn btn-primary">인증번호전송</button>
	    	</div>
	    	<div>
	    		<label class="control-label"><span id="tel_check_check_check" class="check_css"></span></label>
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
	    		<label class="control-label"><span id="tel_check_check" class="check_css"  style="color: blue;"></span></label>
	    	</div>	
  		</div>		
			
		<!-- 홈페이지주소입력 -->
		
					
		<div class="form-group">
	    	<label for="homp" class="col-sm-2 control-label">홈페이지주소 : </label>
	    	<div class="col-sm-6">
	      	<input type="text" class="form-control" name="homepage" id="homepage">
	    	</div>
	    	<label class="control-label"><span id="name_check_ok" class="check_css"></span></label>
  		</div>	
			
			
		<!-- 이메일 입력 -->			
		<div class="form-group">
	    	<label for="email" class="col-sm-2 control-label">이메일 : </label>
	    	<div class="col-sm-2">
	      	<input type="text" class="form-control" name="email1" id="email1" maxlength="14"> 
	    	</div>
	    	<div class="col-sm-2">
	    		<div class="input-group">
		      	 	<span class="input-group-addon">@</span>
	      				<input type="text" class="form-control" name="email2" id="email2">
	      		</div> 
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
						

		<!-- 우편번호 및 주소 입력 -->		
		<div class="form-group">
	    	<label for="addrNum" class="col-sm-2 control-label">우편번호 : </label>
	    	<div class="col-sm-5">
	      	<input type="text" class="form-control" name="strZipcode_1" id="strZipcode_2" maxlength="50">
	    	</div>
	    	<div class="col-sm-1">
	    	<button type="button" class="button red mr5 btn btn-primary" id="btnAddr" onclick="addrfun();">우편번호검색</button>
	    	</div>
  		</div>
		<div class="form-group">
	    	<label for="addr1" class="col-sm-2 control-label">기본주소 : </label>
	    	<div class="col-sm-6">
	      	<input type="text" class="form-control" name="strZipcode_2" id="strZipcode_1" maxlength="50">
	    	</div>
  		</div>
  		<div class="form-group">
	    	<label for="addr2" class="col-sm-2 control-label">상세주소 : </label>
	    	<div class="col-sm-6">
	      	<input type="text" class="form-control" name="strZipcode_3" id="strZipcode_3" maxlength="50" placeholder="상세주소를 입력해주세요">
	    	</div>
	    	<label class="control-label"><span id="addr_check_confirm" class="check_css"></span></label>
  		</div>		
			
		<!-- 기업내용 입력 -->
		<div class="form-group">
	    	<label for="cmpnyintroduce" class="col-sm-2 control-label">기업 소개 : </label>
			
			<div class="col-sm-6">
			<textarea class="form-control col-sm-5" rows="4" style="overflow-y:scroll" name="cmpytextrea" id="cmpytextrea" placeholder="업체를 소개하는 내용을 적어주세요"></textarea>
			<label class="control-label"><span id="cmpytextrea_check_confirm" class="check_css"></span></label>
			</div>		    	
  		</div>
  				
		
		<!-- 회원가입완료 및 취소 -->
		<div class="form-group">
	    	<label class="col-sm-4 control-label"></label>
	    	<div class="col-sm-1">
	      	<button type="button" onclick="sendIt();" id="submitbutton" value="${CmpnyInsertcheck }" class="btn btn-primary">가입 하기</button>
	    	</div>
	    	<div class="col-sm-1">
	      	<a href="<%=cp %>/main.love"><button type="button" id="resetbutton" class="btn btn-primary" >취소(메인으로)</button></a>
	    	</div>
  		</div>	
					
		<!-- 기업회원가입 폼 종료 -->		
		</div>
	</form>
	</section>
	
	<c:import url="${cp }/main/footer.jsp"/>
</body>
</html>