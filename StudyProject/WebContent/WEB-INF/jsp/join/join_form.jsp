<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->	
<!-- <link rel="stylesheet" href="http://bootswatch.com/paper/bootstrap.min.css" >
<link rel="stylesheet" href="http://bootswatch.com/paper/bootstrap.css" > -->
    <!-- Google Font -->
    <link href='http://fonts.googleapis.com/css?family=Dosis:300,400,500,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <!-- Preloader -->
	<!-- <link rel="stylesheet" href="css/preloader.css" type="text/css" media="screen, print"/> -->

    <!-- Icon Font-->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.default.css">
    <!-- Animate CSS-->
    <link rel="stylesheet" href="css/animate.css">

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Style -->
    <link href="css/style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <!-- <link href="css/responsive.css" rel="stylesheet"> -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/lte-ie7.js"></script>
	  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
<script type="text/javascript" src="ajax.js"></script>


<script type="text/javascript">

//중복확인을 위한 변수
var idChk = 0;	// 서브밋 할 때 id 검사용 변수
var emailChk = 0;	//  서브밋 할 때 email 검사용 변수
var passChk1 = 0;	// 서브밋 할 때 password 검사용 변수 1
var passChk2 = 0;	// 서브밋 할 때 password 검사용 변수 2	
var birthChk1 = 0;	// 서브밋 할 때 주민번호 검사용 변수 1
var telChk = 0;		// 서브밋 할 때 전화번호 검사용 변수 2	
var nicknameChk = 0;
var telNum1 = 0;
var telNum2 = 0;
var fullTel = "";	// 입력받은 전화번호 3조각을 합쳐서 담기 위한 변수

var idkk = 0;	// ajax 로 아이디 중복 여부 판단하기 위한 변수
var emailkk = 0;	// ajax 로 이메일 중복 여부 판단하기 위한 변수
var telkk = 0;		// ajax 로 전화번호 중복 여부 팓나하기 위한 변수
var idStr = "";		// id 판단 결과 출력용 변수
var nicknamekk = 0;
var nicknameStr = ""	// nickname 판단 결과 출력용 변수
var passStr = "";	// password 판단 결과 출력용 변수
var nameStr = "";	// 이름 판단 결과 출력용 변수
var birthStr = "";  // 주민등록번호 판단 결과 출력용 변수
var emailStr = "";  // 이메일 판단 결과 출력용 변수
var telStr = "";    // 전화번호 판단 결과 출력용 변수
var certiStr = "";  // 인증번호 확인 판단 결과 출력용 변수

//전화번호 인증번호 생성 및 확인
function telsend()
{
	var tel1 = document.getElementById("tel1").value;
	var tel2 = document.getElementById("tel2").value;
	var tel3 = document.getElementById("tel3").value;
	
	if(tel1.length==3 && tel2.length==4 && tel3.length==4)
	{
	   var random = Math.ceil(Math.random() * 100000)	   	   
	   alert(random);
	   document.getElementById("telhidden").value = random;
	}
}


//숫자만 입력하는 함수
function numkeyCheck(e)
{
        var keyValue = event.keyCode;
        if( ((keyValue >= 48) && (keyValue <= 57)) ) 
        	return true;
        else 
        	return false;
      }




$(document).ready(function()
{    	
	
	// 전화번호 인증번호 생성 및 확인
	$("#tel_send").click(function()
	{
		telsend();
	});
	
	
	// 아이디 유효성, 중복 검사	
	$('#id').focusout(function()
	{
		var reg_id = /^[a-z0-9]{6,12}$/; 
		
		if(   (!reg_id.test($("#id").val()))   ||  $('#id').val().length < 6) 
		{			
			idStr = "6 ~ 12자의 소문자, 숫자를 사용해야 합니다.";
			$("#id_check").text(idStr);
			$("#id_check").css("display", "inline");
			$("#id_check").css("color", "red");
		}		
		else
		{	
			ajaxId();
		}
			 
	});	
	
	
	
	// 닉네임 유효성, 중복 검사	
	$('#nickname').focusout(function()
	{
		var reg_nickname = /^[가-힣a-zA-Z0-9]*$/;
		
		if(   (!reg_nickname.test($("#nickname").val()))   ||  $('#nickname').val().length < 2) 
		{			
			nicknameStr = "2 ~ 8 자의 한글, 대문자, 소문자, 숫자를 사용해야 합니다.";
			$("#nickname_check").text(nicknameStr);
			$("#nickname_check").css("display", "inline");
			$("#nickname_check").css("color", "red");
		}			
		else
		{	
			$("#nickname_check").css("display", "none");
			ajaxNickname();
		}
			 
	});	
	
	
	
    //비밀번호유효성검사
    $('#password').keyup(function() 
	    {    	
	    var reg_pw = /^.*(?=.{8,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; 
	    var reg_pw2 = /[^a-zA-Z0-9]/;
	    if(!reg_pw.test($("#password").val()) || !reg_pw2.test($("#password").val())) 
	    {   
	    	passStr = "비밀번호 형식이 잘못되었습니다 (소문자, 숫자, 특수문자를 혼합하여 8~16자 이내)";
	    	$('#password_pw').text(passStr);
	    	$('#password_pw').css("display", "inline");
	    	$("#password_pw").css("color", "red");
	    	passChk1 = 1;
	    }
	    else if ( $("#password").val() == "" )
	    {
	    	$('#password_pw').css("display", "none");
	    }
	    else
	    {
	    	passStr = "안전한 비밀번호 입니다.";
	    	$('#password_pw').text(passStr);
	    	$('#password_pw').css("display", "inline");
	    	$("#password_pw").css("color", "blue");
	    	passChk1 = 0;
	    }
    });
    
    //비밀번호 재확인 
    $('#password_chk').keyup(function() 
    {
	     if ($('#password').val() != $('#password_chk').val()) 
	     {
	    	passStr = "비밀번호가 일치하지 않습니다.";
			$('#pw_check_ok').text(passStr);
			$('#pw_check_ok').css("display", "inline");
			$("#pw_check_ok").css("color", "red");
			passChk2 = 1;
	       
	     }	     
	     else 
	     {            
	        passStr = "비밀번호가 일치 합니다.";
			$('#pw_check_ok').text(passStr);
			$('#pw_check_ok').css("display", "inline");
			$("#pw_check_ok").css("color", "blue");
			passChk2 = 0;
	     }
    }); 
    
    
 	// 주민등록번호(생년월일) 유효성 검사
	$('#date').focusout(function()
	{
		var regExOnlyNum = /^[0-9]*$/;
		if ( !regExOnlyNum.test($('#date').val()) ||  $('#date').val().length < 8  )
		{
			birthStr = "올바른 주민등록번호를 입력하세요.";
			$('#birth_check').text(birthStr);
			$("#birth_check").css("display", "inline");
			$("#birth_check").css("color", "red");
			birthChk1 = 1;
		}		
		else
		{
			$("#birth_check").css("display", "none");
			birthChk1 = 0;
		}
	});
		
       
 
 	// email 유효성, 중복 검사
	$('#email').focusout(function()
	{
		/*
		var reg_id = /^[a-z0-9]{6,12}$/; 
		if(   (!reg_id.test($("#id").val()))  ||  $('#id').val().length < 6 ) 
		{			
			idStr = "6 ~ 12자의 소문자, 숫자만 사용할 수 있습니다.";
			$("#id_check").text(idStr);
			$("#id_check").css("display", "inline");
			$("#id_check").css("color", "red");
		}
		*/
		
		var reg_email =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		if(!reg_email.test($("#email").val()))
		{
			emailStr = "abc@study.com 형식으로 입력해주세요";
			$("#email_check").text(emailStr);
			$("#email_check").css("display", "inline");
			$("#email_check").css("color", "red");
			//emailChk = 1;
		}
		else
		{
			ajaxEmail();		
		}
		
	}); 
 	
 	
 	// 휴대폰 번호 빈 칸 확인
 	// tel3 까지 입력했을때 tel2 tel3의 값이 숫자가 아니거나 length가 4보다 작으면 span 태그 활성화
 	$("#tel3").focusout(function()
 	{
 		var regExOnlyNum = /^[0-9]*$/;
 		if ( $('#tel2').val() == "" || $('#tel3').val() == "" )
 		{
 			telStr = "필수 입력 항목입니다.";
 			$("#tel_check").text(telStr);
			$("#tel_check").css("display", "inline");
			$("#tel_check").css("color", "red");
			telNum = 0;
 		}
 		else if ( $('#tel1').val().length != 3 || $('#tel2').val().length != 4 || $('#tel3').val().length != 4 )
 		{
 			telStr = "올바른 전화번호를 입력하세요.";
 			$("#tel_check").text(telStr);
			$("#tel_check").css("display", "inline");
			$("#tel_check").css("color", "red");
			telNum = 0;
 		}
 		else
 		{
 			ajaxTel();
 		}
 		/* 
 		else if ( !regExOnlyNum.test($("#tel1").val()) ||  !regExOnlyNum.test($("#tel2").val())  || $('#tel2').val().length < 4 || $('#tel3').val().length < 4 )
 		{
 			telStr = "올바른 번호를 입력하세요.";
 			$("#tel_check").text(telStr);
			$("#tel_check").css("display", "inline");
			$("#tel_check").css("color", "red");
			telNum = 1;
 		}
 		else
 		{
 			telStr = ""; 			
			telNum = 0;
 		}
 		 */
 	});
 	
 	
 	
 	
    //휴대폰인증번호 일치 확인
    $('#tel_send_check').click(function() 
	{
	   if ($('#telhidden').val() != $('#certiNum').val()) 
	   {
		   alert("인증번호 불일치");
		   certiStr = "인증번호가 일치하지 않습니다.";
		   $("#tel_chk").text(certiStr);
	       $('#tel_chk').css("display", "inline");
	       $("#tel_chk").css("color", "red");
	       telChk = 0;
	   }
	   else 
	   {      
		   alert("인증번호 일치");
		   certiStr = "인증번호가 일치 합니다.";
		   $("#tel_chk").text(certiStr);
	       $('#tel_chk').css("display", "inline");
	       $("#tel_chk").css("color", "blue");	       
	       telChk = 1;
	   }
    });  
 	
	
 	
 	///////////////////////////////////////////////// submit 전 검사 ///////////////////////////////////////////////////
 	
 	
 	
 	// submit 전 검사
 	$("#chkSubmit").click(function()
 	{
 		// 아이디 확인
 		if ( idChk==1 )
 		{
 			idStr = "중복된 ID 입니다.";
			$("#id_check").text(idStr);
			$("#id_check").css("display", "inline");
			$("#id_check").css("color", "red");
 			$('#id').focus();
 			return false;
 		}
 		else if ( $("#id").val() == "" )
 		{
 			idStr = "필수 입력 항목입니다.";
			$("#id_check").text(idStr);
			$("#id_check").css("display", "inline");
			$("#id_check").css("color", "red");
			$('#id').focus();
 			return false;
 		}
 		else if (idChk==1)
		{
 			idStr = "중복된 ID 입니다.";
			$("#id_check").text(idStr);
			$("#id_check").css("display", "inline");
			$("#id_check").css("color", "red");
			$('#id').focus();
 			return false;
		}
 		
 		
 		// 닉네임 확인
 		if ( nicknameChk == 1 )
 		{
 			idStr = "중복된 ID 입니다.";
			$("#nickname_check").text(nicknameStr);
			$("#nickname_check").css("display", "inline");
			$("#nickname_check").css("color", "red");
 			$('#nickname_check').focus();
 			return false;
 		}
 		else if ( $("#nickname").val() == "" )
 		{
 			idStr = "필수 입력 항목입니다.";
			$("#id_check").text(nicknameStr);
			$("#id_check").css("display", "inline");
			$("#id_check").css("color", "red");
			$('#nickname').focus();
 			return false;
 		}
 		else if (nicknameChk == 1)
		{
 			idStr = "중복된 ID 입니다.";
			$("#nickname_check").text(nicknameStr);
			$("#nickname_check").css("display", "inline");
			$("#nickname_check").css("color", "red");
			$('#nickname_check').focus();
 			return false;
		}
 		
 		
 		
 		
 		// 비밀번호 확인
 		if (  $("#password").val() ==""  )
 		{
 		
 			passStr = "필수 입력 항목입니다.";
	    	$('#password_pw').text(passStr);
	    	$('#password_pw').css("display", "inline");
	    	$("#password_pw").css("color", "red");
	    	$('#password_pw').focus();
	    	return false;
 		}
 		else if (passChk1 == 1)
 		{
 			passStr = "비밀번호 형식이 잘못되었습니다 (소문자, 숫자, 특수문자를 혼합하여 8~16자 이내)";
	    	$('#password_pw').text(passStr);
	    	$('#password_pw').css("display", "inline");
	    	$("#password_pw").css("color", "red");
	    	$('#password_pw').focus();
	    	return false;
 		} 		
 		else if ( $("#password_chk").val() == "")
 		{
 			passStr = "필수 입력 항목입니다.";
			$('#pw_check_ok').text(passStr);
			$('#pw_check_ok').css("display", "inline");
			$("#pw_check_ok").css("color", "red");
			$('#pw_check_ok').focus();
			return false;
 		}
 		else if (passChk2 == 1)
 		{
 			passStr = "비밀번호가 일치하지 않습니다.";
			$('#pw_check_ok').text(passStr);
			$('#pw_check_ok').css("display", "inline");
			$("#pw_check_ok").css("color", "red");
			$('#pw_check_ok').focus();
			return false;
 		}
 		
 		
 		// 이름 확인 		
 		if ( $("#name").val() == "" )
 		{
 			nameStr = "필수 입력 항목입니다."
 			$('#name_check').text(nameStr);
			$('#name_check').css("display", "inline");
			$("#name_check").css("color", "red");
			$('#name_check').focus();
			return false;
 		}
 		
 		else if ( $("#name").val() != "" )
 		{
 			nameStr = ""; 			
 		}
 		
 		/* 
 		// 주민등록번호(생년월일) 확인
 		if ( $("#date").val() == "" )
 		{
 			birthStr = "필수 입력 항목입니다."
 			$('#birth_check').text(birthStr);
			$('#birth_check').css("display", "inline");
			$("#birth_check").css("color", "red");
			$('#date').focus();
			return false;
 		} 		
 		else if ( birthChk1 == 1 )
 		{	
			birthStr = "올바른 주민등록번호를 입력하세요.";
			$('#birth_check').text(birthStr);
			$("#birth_check").css("display", "inline");
			$("#birth_check").css("color", "red");
			$('#date').focus();
			return false;	
 		} 		 		
		else
		{
			$("#birth_check").css("display", "none");
		}
 		 */
 		
 		
 		 		
 		// 인증번호 확인
 		if (telChk != 1)
 		{
 			telStr = "핸드폰 인증을 해주세요";
 			$("#tel_check").text(telStr);
 			$("#tel_check").css("display", "inline");
			$("#tel_check").css("color", "red");
 			return false; 			
 		}
 		
		
 		
 		
 		 
 		
 		// 모달에 표시될 내용		 
 		$("#cfmId").text( $("#id").val() ); 		
 		$("#cfmName").text( $("#name").val() );
 		$("#cfmNickname").text( $("#nickname").val() );
 		$("#cfmBirth").text( $("#date").val() );
 		$("#gender").text( $(":radio[name='optionsRadios']:checked").val() );	 		
 		$("#cfmEmail").text( $("#email").val() );		
 		$("#cfmTel").text( $("#tel1").val() + " - " + $("#tel2").val() + " - " + $("#tel3").val());		
 		
	
 		// 모달 띄우기
 		$(".modal").modal();
 		
 		
 	});// end 서브밋검사
 	
 	
 	
 	$("#submit").click(function()
 	{
 		$("#join").submit();
 	});
 	
 	
});   




///////////////////////////////////////////////// Ajax ///////////////////////////////////////////////////


//아이디 중복체크 Ajax
function ajaxId()
{
	$.post("JoinIdChk.room", { "idid" : $("input[name='id']").val() }, function(args)
	{		
		//$('#id_check').show();
		//$("#id_check").html(args);com
		idkk = args.trim();
		if (idkk == 1)
		{
			idStr = "중복된 ID 입니다.";
			$("#id_check").text(idStr);
			$("#id_check").css("display", "inline");
			$("#id_check").css("color", "red");
			idChk = 1;
		}
		else
		{
			idStr = "사용 가능한 ID 입니다.";
			$("#id_check").text(idStr);
			$("#id_check").css("display", "inline");
			$("#id_check").css("color", "blue");
			idChk = 0;
		}
	});	
}


//닉네임 중복체크 Ajax
function ajaxNickname()
{
	$.post("JoinNicknameChk.room", { "nicnic" : $("input[name='nickname']").val() }, function(args)
	{				
		nicknamekk = args.trim();
		if (nicknamekk == 1)
		{
			nicknameStr = "중복된 닉네임 입니다.";
			$("#nickname_check").text(nicknameStr);
			$("#nickname_check").css("display", "inline");
			$("#nickname_check").css("color", "red");
			nicknameChk = 1;
		}
		else
		{
			nicknameStr = "사용 가능한 닉네임 입니다.";
			$("#nickname_check").text(nicknameStr);
			$("#nickname_check").css("display", "inline");
			$("#nickname_check").css("color", "blue");
			nicknameChk = 0;
		}
	});	
}


// 이메일 중복체크 Ajax
function ajaxEmail()
{
	$.post("JoinEmailChk.room", { "emailemail" : $("input[name=email]").val() }, function(args)
	{
		emailkk = args.trim();
		
		
		if (emailkk == 1)
		{
			emailStr = "중복된 Email 입니다.";
			$('#email_check').text(emailStr);
			$('#email_check').css("display", "inline");
			$("#email_check").css("color", "red");
			$('#email').focus();
			emailChk = 1;			
		}
		else
		{
			emailStr = "사용가능한 Email 입니다.";
			$('#email_check').text(emailStr);
			$('#email_check').css("display", "inline");
			$("#email_check").css("color", "blue");
			emailChk = 0;
		}
	});	
}



// 전화번호 중복체크 Ajax
function ajaxTel()
{
	fullTel = $("#tel1").val()+"-"+$("#tel2").val()+"-"+$("#tel3").val();
	$.post("JoinTelChk.room", { "teltel" : fullTel }, function(args)
	{
		telkk = args.trim();
		
		if (telkk==1)
		{
			telStr = "이미 가입된 전화번호 입니다.";
			$('#tel_check').text(telStr);
			$('#tel_check').css("display", "inline");
			$("#tel_check").css("color", "red");
			telChk = 1;
		}
		else
		{
			telStr = "가입 가능한 전화번호 입니다.";
			$('#tel_check').text(telStr);
			$('#tel_check').css("display", "inline");
			$("#tel_check").css("color", "blue");
			tehlChk = 0;
		}
	});
}




</script>





</head>
<body>

<!-- 비회원 메뉴 import -->
<div class="row">
	<div class="form-group col-xs-12">
	   <div class="">
	      <c:import url="/WEB-INF/jsp/StudyRoom/StudyRoomTop.jsp"></c:import>
	   </div>
	</div>
</div>
<br><br><br><br><br>


<div class="form-group col-lg-3"></div>


<div class="form-group col-lg-6">
<form class="form-horizontal" method="post" id="join" action="MemberInsert.room">
  <fieldset>    
    
    <legend> JOIN</legend> 
    
    <!-- 이름 -->
   	<div class="form-group">
      <label for="inputName" class="col-lg-2 control-label">Name</label>
      <div class="col-lg-10">        
        <input type="text" class="form-control" name="name" id="name" placeholder="Name" maxlength="15">
        <span class="help-block" id="name_check"></span>     
      </div>
    </div>
    
    <!-- 아이디 -->
    <div class="form-group">
      <label for="inputID" class="col-lg-2 control-label">ID</label>
      <div class="col-lg-10">
        <input type="text" class="form-control" name="id" id="id" placeholder="ID" maxlength="12">
        <span class="help-block" id="id_check">※ 최소 6 ~ 12자의 소문자, 숫자만 사용할 수 있습니다.</span>
      </div>
    </div>
    
    <!-- 닉네임 -->
    <div class="form-group">
      <label for="inputNickcname" class="col-lg-2 control-label">Nikcname</label>
      <div class="col-lg-10">
        <input type="text" class="form-control" name="nickname" id="nickname" placeholder="nickname" maxlength="8">
        <span class="help-block" id="nickname_check">※ 최소 2 ~ 8자의 한글, 대문자, 소문자, 숫자만 사용할 수 있습니다.</span>
      </div>
    </div>
    
    <!-- 패스워드 -->
    <div class="form-group">
      <label for="inputPassword" class="col-lg-2 control-label">Password</label>
      <div class="col-lg-10">        
        <input type="password" class="form-control" name="password" id="password" placeholder="Password" maxlength="16">
        <span class="help-block" id="password_pw">※ 소문자, 숫자, 특수문자를 혼합하여 8~16자 이내</span>     
      </div>
    </div>
   
    <!-- 패스워드 확인 -->
   	<div class="form-group">
      <label for="inputPassword" class="col-lg-2 control-label">Password</label>
      <div class="col-lg-10">        
        <input type="password" class="form-control" name="password_chk" id="password_chk" placeholder="Reconfirm " maxlength="16">
        <span class="help-block" id="pw_check_ok">※ 소문자, 숫자, 특수문자를 혼합하여 8~16자 이내</span>     
      </div>
    </div>
   
   
   	
   
 	<!--   
   	생년월일
   	<div class="form-group">
      <label for="inputBirth" class="col-lg-2 control-label">Birth</label>
      <div class="col-lg-10">        
        <input type="text" class="form-control" name="date" id="date" placeholder="ex) 19801205" maxlength="8">
        <span class="help-block" id="birth_check"></span>     
      </div>
    </div>   	   
    
   	성별
    <div class="form-group">
      <label class="col-lg-2 control-label">Gender</label>
      <div class="col-lg-10">
        <div class="radio">
          <label>
            <input type="radio" name="optionsRadios" id="female" value="F" checked="checked">
            여자
          </label>
        </div>
        <div class="radio">
          <label>
            <input type="radio" name="optionsRadios" id="male" value="M">
            남자
          </label>
        </div>
      </div>
    </div>
     -->
    
    
    <!-- E-Mail -->
    <div class="form-group">
      <label for="inputEmail" class="col-lg-2 control-label">Email</label>
      <div class="col-lg-10">
        <input type="email" class="form-control" name="email" id="email" placeholder="Email">
        <span class="help-block" id="email_check"></span>
      </div>   
    </div>
    
    <!-- 전화번호 -->
    <div class="form-group">
      <label for="inputTel" class="col-lg-2 control-label">Tel</label>
      <div class="col-lg-2">
        <input type="text" class="form-control" name="tel1" id="tel1" value="010" placeholder="010" maxlength="3" onKeyPress="return numkeyCheck(event)">
        <span class="help-block" id="tel_check"></span>
      </div>
      
      <div class="col-lg-2">
        <input type="text" class="form-control" name="tel2" id="tel2" maxlength="4" onKeyPress="return numkeyCheck(event)">
        <span class="help-block" id="tel_check"></span>
      </div>
      
      <div class="col-lg-2">
        <input type="text" class="form-control" name="tel3" id="tel3" maxlength="4" onKeyPress="return numkeyCheck(event)">
        <span class="help-block" id="tel_check"></span>
      </div>      
      
      <a class="btn btn-default" id="tel_send">인증번호발송</a>
      <span class="help-block" style="display: inline" id ="tel_check"></span>
	  <input type="text" id="telhidden" hidden="hidden" value="8521">	  
    </div>
    
    <!-- 인증번호확인 -->
    <div class="form-group">
      <label for="inputNum" class="col-lg-2 control-label"></label>
      <div class="col-lg-6">
        <input type="text" class="form-control" id="certiNum" placeholder="인증번호입력" onKeyPress="return numkeyCheck(event)">
        <span class="help-block" id="tel_chk"></span>        
      </div>   
      <a class="btn btn-default" id="tel_send_check">인증번호확인</a><br>
      
    </div>
    
    
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <!-- <button type="reset" class="btn btn-default">Cancel</button> -->
        <button id="chkSubmit" class="btn btn-primary cs-btn" type="button" data-toggle="modal" data-target="#myModal1">OK</button>
      </div>
    </div>
  </fieldset>
</form>
</div>
<!-- 버튼 -->
<!-- 모달 팝업 -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
<div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" style="text-align: center">입력 정보</h4>
      </div>
		<div class="col-sm-2"></div> 
		     <div class="modal-body col-sm-8">
		       <table class="table table-hover">  
			  <tbody>		    
			    <tr style="text-align: center">
			      <td>ID</td>
			      <td><div id="cfmId"></td>
			    </tr>
			    <tr style="text-align: center">
			      <td>Nickname</td>
			      <td><div id="cfmNickname"></td>
			    </tr>
			    <tr style="text-align: center">
			      <td>Name</td>
			      <td><div id="cfmName"></td>
			    </tr>
			   <!-- 
			    <tr style="text-align: center">
			      <td>Birth</td>
			      <td><div id="cfmBirth"></td>
			    </tr>
			    <tr style="text-align: center">
			      <td>Gender</td>
			      <td><div id="gender"></td>
			    </tr>
			    -->
			    <tr style="text-align: center">
			      <td>Email</td>
			      <td><div id="cfmEmail"></td>
			    </tr>
			    <tr style="text-align: center">
			      <td>Tel</td>
			      <td><div id="cfmTel"></td>
			    </tr>		   		   
			  </tbody>
			</table> 
		     </div>
      
      	<div class="col-sm-2"></div> 
      
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default cs-btn" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary cs-btn" id="submit">가입신청</button>
      </div>
    </div>
  </div>
</div>

<div class="form-group col-lg-3"></div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


<c:import url="/WEB-INF/jsp/import/copyright.jsp"></c:import>

<!-- 
<div class="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" style="text-align: center">입력 정보</h4>
      </div>
     
     
		<div class="col-sm-2"></div> 
		     <div class="modal-body col-sm-8">
		       <table class="table table-hover">  
			  <tbody>		    
			    <tr style="text-align: center">
			      <td>ID</td>
			      <td><div id="cfmId"></td>
			    </tr>
			    <tr style="text-align: center">
			      <td>Nickname</td>
			      <td><div id="cfmNickname"></td>
			    </tr>
			    <tr style="text-align: center">
			      <td>Name</td>
			      <td><div id="cfmName"></td>
			    </tr>
			   
			    <tr style="text-align: center">
			      <td>Birth</td>
			      <td><div id="cfmBirth"></td>
			    </tr>
			    <tr style="text-align: center">
			      <td>Gender</td>
			      <td><div id="gender"></td>
			    </tr>
			   
			    <tr style="text-align: center">
			      <td>Email</td>
			      <td><div id="cfmEmail"></td>
			    </tr>
			    <tr style="text-align: center">
			      <td>Tel</td>
			      <td><div id="cfmTel"></td>
			    </tr>		   		   
			  </tbody>
			</table> 
		     </div>
      
      	<div class="col-sm-2"></div> 
      
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default cs-btn" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary cs-btn" id="submit">가입신청</button>
      </div>
    </div>
  </div>
</div> -->


</body>
</html>