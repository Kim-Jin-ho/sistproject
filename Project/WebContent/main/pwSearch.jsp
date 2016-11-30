<!-- PW 찾기 페이지 일반회원 + 기업회원 어느회원이냐에 따라 동적으로 구성 -->
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
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" >
<link href="<%=cp %>/css/hyuncss/main.css" rel="stylesheet">
<script src="<%=cp %>/js/mainjs/jquery.js"></script>
<script src="<%=cp %>/js/mainjs/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/userjs/jquery.countdownTimer.js"></script>
<script type="text/javascript">

var valcheck=false; //아이디유효성확인및 중복 확인
var telcheck=false; //전화번호유효성확인
$(document).ready(function()
{	
	$('#submitbutton').click(function() //인증받기 버튼을 누를경우
	{	
		if($('#search_id').val()=="") //아이디가 비어있다면
		{
			$('#id_check').html("※ 아이디를 입력해주세요.").css("color","red");
			return;
		}
		if($('#search_name').val()=="") //이름이 비어있다면
		{
			$('#search_name_check').html("※ 이름을 입력해주세요.").css("color","red");
			return;
		}
		if($('#tel1').val()==""||$('#tel3').val()==""||$('#tel3').val()=="") //전화번호가 비어있다면
		{
			$('#tel_check_check_check').html("※ 전화번호를 입력해주세요.").css("color","red");
			return;
		}
		if(valcheck==false||telcheck==false)
			return;
		//else //모든조건을 충족하면
		//	$("#pwsearchcheck").submit();
		else {
			$.post("<%=cp %>/usersearchpw.love", { "search_id" : $('#search_id').val(),"search_name": $('#search_name').val(), "tel1" : $('#tel1').val(),
												 "tel2" : $('#tel2').val(),"tel3" : $('#tel3').val()}, function(args){		
				 var getuserpw = args.trim();			
			 	 if (getuserpw==null|| getuserpw==""){
					$('#check_check').html("존재하지 않는 회원정보입니다.").css("color","red");
				 }
			 	 else{
			 		 location.href="<%=cp %>/searchpwok.love?getuserpw="+getuserpw;
			 	 }
				 });	
			}			
	});
	
//아이디 확인================================================================================================	
	$('#search_id').keyup(function(){ //아이디에 키업이벤트가 발생하고
			var reg_id = /^[aA-zZ0-9_-]{8,16}$/; 
			
			if(!reg_id.test($("#search_id").val())){
				 $('#id_check').html("※ 아이디는 8-16자 이여야 하며 \n" 
						 + "영문,마침표, '-', '_'를 제외한 문자는 사용하실수 없습니다.").css("color","black");
		    } 
			else{
			 	 $.post("<%=cp %>/userinsertcheck.love", { "idcheck" : $('#search_id').val() }, function(args){		
				 
			 	 var idkk = args.trim();
								
			 	 if (idkk==1){
				 	$('#id_check').html("").css("color","red");
				 	valcheck=true;
				 }	
				 else{
					 valcheck = false;
					$('#id_check').html("존재하지 않는 아이디 입니다.").css("color","blue");
				 }	
				 });	
			 }
	});
	
//전화인증번호 확인 ==============================================================================================	
	
	$('#tel_send_check').click(function(){
    if ($('#telhidden').val() != $('#tel_check').val()){
    	telcheck=false;
        $('#tel_check_check').html("※ 인증번호가 일치하지 않습니다.").css("color","red");; // 레이어에 HTML 출력
    }
    else{	
    	telcheck=true;
        $('#tel_check_check').text("※ 인증이완료되었습니다.").css("color","blue"); // 레이어에 텍스트 출력
    }
	});
});
	//전화번호 인증번호 생성 및 확인
	function telsend()
	{
		var tel1 = document.getElementById("tel1").value;
		var tel2 = document.getElementById("tel2").value;
		var tel3 = document.getElementById("tel3").value;
		var regExOnlyNum=/^[0-9]*$/;
			
		if(tel1.length==3 && tel2.length==4 && tel3.length==4 && regExOnlyNum.test(tel1) && regExOnlyNum.test(tel2) && regExOnlyNum.test(tel3))
			{
				/* 인증번호 난수발생 */
				randomA = ((Math.random()+0.1)*100);
				randomA = Math.trunc(randomA);
				alert(randomA); //test	
				document.getElementById("telhidden").value = randomA;
				
				$("#tel_check_check").countdowntimer({
					minutes : 3,
			        /* seconds : 60 */
					size : "lg",
			        timeUp : timeIsUp
				}); 
			}
		else
		   $('#tel_check_check_check').html("※ 잘못된 전화번호 입니다.").css("color","red");
	}
	
	//인증시간 만료 함수정의
	function timeIsUp()
	{
		 alert('인증시간이 만료되었습니다.');
		 randomA = "";
	}
	
</script>
</head>
<body>
	<div class="container" id="searchpadding">
		<form  id="pwsearchcheck" class="form-horizontal">
			<div  style="table-layout:fixed">
				<div class="form-group">	
					<label for="name" class="col-sm-2 control-label"><i class="fa fa-phone"></i> 휴대전화로 인증 </label>
					<label for="name" class="control-label"><input type="radio" name="confirm" value="confirm" checked="checked"></label>	
				</div>
		
			
				<div class="form-group">
			    	<label for="name" class="col-sm-2 control-label">아이디 입력 : </label>
			    	<div class="col-sm-6">
			      	<input type="text" class="form-control" name="search_id" id="search_id" maxlength="16">
			    	</div>
			    	<label class="control-label"><span id="id_check" class="check_css"></span></label>
		  		</div>
		
		
				<div class="form-group">
			    	<label for="name" class="col-sm-2 control-label">이름 입력 : </label>
			    	<div class="col-sm-6">
			      	<input type="text" class="form-control" name="search_name" id="search_name" maxlength="10">
			    	</div>
			    	<label class="control-label"><span id="name_check_check" class="check_css"></span></label>
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
			    	<label class="control-label"><span id="tel_check_check_check" class="check_css" style="margin-left: 60px;"></span></label>
			    	</div>
			    	<input type="text" id="telhidden" hidden="hidden" value="8521">
		  		</div>	
				
				
				<!-- 인증번호 입력 -->			
				<div class="form-group">
			    	<label for="telnumcheck" class="col-sm-2 control-label">인증번호 : </label>
			    	<div class="col-md-6">
			      	<input type="text" name="tel_check" id="tel_check" placeholder="인증번호 입력" class="form-control">
			    	</div>
			    	<div class="col-md-1">
			    	<button type="button" name="tel_send_check" id="tel_send_check" class="btn btn-primary">인증번호확인</button>
			    	</div>
			    	<div>
			    	<label class="control-label"><span id="tel_check_check" class="check_css" style="margin-left: 60px;"></span></label>
			    	</div>	
		  		</div>
		
				<div class="form-group">
					<div class="col-md-3 col-md-offset-4">
					<input type="button" id="submitbutton" class="btn btn-primary" value="인증받기">
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>