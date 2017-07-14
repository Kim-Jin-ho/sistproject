<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>공지사항 작성</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
 	<link href='http://fonts.googleapis.com/css?family=Dosis:300,400,500,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

     <!-- Preloader -->
    <link rel="stylesheet" href="css/preloader.css" type="text/css" media="screen, print"/>

    <!-- Icon Font-->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.default.css">
    <!-- Animate CSS-->
    <link rel="stylesheet" href="css/animate.css">

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">

	$(function()
	{
		
		$("#listBtn").click(function()
		{
			$(location).attr("href","Notice.room");	
			
		});
		
	})
	
	
	
	
	     //등록버튼 클릭시 form 전송
	     $("#submitBtn").click(function()
	     {
	    	 if ($("#subject").val()=="") 
			{
				
				alert("제목을 입력하십시오");
				return;
			}
			
			
			if (confirm("등록하시겠습니까?")) 
			{
				 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		         $("#writeForm").submit();
			}
	    	 
	        
	     });  
	


</script>
	
</head>
<body>
	<div class="row">
		<div class="form-group col-xs-12">
			<div class="">
				<c:import url="/WEB-INF/jsp/StudyRoom/StudyRoomTop.jsp"></c:import>
			</div>
		</div>
	</div>
	<br><br>
	
	<div class="row ">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<h2>공지사항작성 <small>Registration</small></h2>
			<hr>
			<br>
			<form action="NoticeWrite.room" method="post" id="writeForm" class="form-horizontal">
			
			<div class="form-group">
	   			<label for="writer">작성자</label>
	   			<input type="text"  id="writer" placeholder="${admin }" readonly="readonly" class="form-control">
    		</div>
			<div class="form-group">
	   			<label for="subject">제목</label>
	   			<input type="text" id="subject" name="subject" class="form-control">
    		</div>
			<div class="form-group">
	   			<label for="content">글내용</label>
	   			<textarea rows="10" cols="30" class="form-control" id="ir1" name="content"
	   			style="width: 1150px; height: 450px;"></textarea> 
    		</div>
			
			<Br>
			<div class="text-center">
			<button type="button" class="btn btn-default cs-btn" id="listBtn">  이전으로</button>
			&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-default submit-btn form_submit" id="submitBtn" style="width: 150px;">등록하기</button>
			</div>
			
			</form>
		
		</div>
	
		<div class="col-lg-2"></div>
	</div>
	<br><br>

	<c:import url="/WEB-INF/jsp/import/copyright.jsp"></c:import>
		
</body>
</html>