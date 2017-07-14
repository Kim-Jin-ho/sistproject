<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<link rel="stylesheet" href="http://bootswatch.com/paper/bootstrap.min.css" >
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
<script type="text/javascript" src="../OpenStudy/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#submitBtn").click(function()
		{
			if ($("#id").val() == "" || $("#pw").val() == "")
			{
				alert("빈 항목을 입력해주세요");
				return;			
			}
			$("#loginForm").submit();
			
		});
	});


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

<br><br><br><br><br><br><br>



<div style="margin: 0 auto; width: 400px;" >
<div class="wow fadeInRight animated" >
	<form class="contact-form" action="login.room" id="loginForm">
		<div class="row">
			<div><h2>LOGIN</h2></div>
			<div>
				<input type="text" class="form-control" id="id" name="id" placeholder="ID" style="text-align: left; padding-left: 10px;">
				<input type="password" class="form-control" id="pw" name="pw" placeholder="PASSWORD" style="text-align: left; padding-left: 10px;"> 
				<input type="submit" hidden="">
			</div>
				<button type="button" class="btn btn-default submit-btn form_submit" id="submitBtn">Login</button>                                
		</div>
	</form>
</div>
</div>






<br><br><br><br><br>
<c:import url="/WEB-INF/jsp/import/copyright.jsp"></c:import>
</body>
</html>