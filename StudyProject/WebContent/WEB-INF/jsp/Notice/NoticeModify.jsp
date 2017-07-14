<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>공지사항 수정</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href="http://bootswatch.com/paper/bootstrap.min.css" >
<link rel="stylesheet" href="http://bootswatch.com/paper/bootstrap.css" > -->
    <!-- Google Font -->
    <link href='http://fonts.googleapis.com/css?family=Dosis:300,400,500,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

     <!-- Preloader -->
<!--     <link rel="stylesheet" href="css/preloader.css" type="text/css" media="screen, print"/> -->

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
<script type="text/javascript" src="<%=cp %>/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

	$(function()
	{
		
		$("#listBtn").click(function()
		{
			$(location).attr("href","Notice.room");	
			
		});
		
	})
	
	
	var oEditors = [];
	$(function()
	{

	     	nhn.husky.EZCreator.createInIFrame({
	         oAppRef: oEditors,
	         elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
	         sSkinURI: "/StudyProject/SE2/SmartEditor2Skin.html",  
	         htParams : {
	             // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	             bUseToolbar : true,             
	
	             // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	             bUseVerticalResizer : true,     
	
	             // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	             bUseModeChanger : true,         
	             fOnBeforeUnload : function(){
	             }
	         }, 
	         fOnAppLoad : function()
	         {
	             //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
	             //oEditors.getById["ir1"].exec("PASTE_HTML", ["내용을 입력하세요. <br>(내용을 지우고 입력하시기 바랍니다.)"]);
	         },
	         fCreator: "createSEditor2"
	     });      
	
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
	
	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<h2>공지사항 수정 <small>Registration</small></h2>
			<hr>
			<br>
			<form action="NoticeModify.room" method="post" id="writeForm" class="form-horizontal">
			<div class="form-group">
	   			<label for="noticeSeq">글번호</label>
	   			<input type="text"  id="noticeSeq" name="noticeSeq" value="${notice.noticeSeq }" readonly="readonly" class="form-control">
    		</div>
			<div class="form-group">
	   			<label for="writer">작성자</label>
	   			<input type="text"  id="writer" placeholder="${admin }" readonly="readonly" class="form-control">
    		</div>
			<div class="form-group">
	   			<label for="subject">제목</label>
	   			<input type="text" id="subject" name="subject" class="form-control" value="${notice.subject }">
    		</div>
			<div class="form-group">
	   			<label for="content">글내용</label>
	   			<dl>
		   			<dd>
			   			<textarea rows="10" cols="30" class="form-control" id="ir1" name="content"
			   			style="width: 1150px; height: 450px;">${notice.content }</textarea>
		   			</dd>	   		
	   			</dl>	
    		</div>
			
			<div class="col-xs-8"></div>
			<div class="text-center col-xs-4">
			<button type="button" class="btn btn-default cs-btn" id="listBtn">  이전으로</button>
			<button type="button" class="btn btn-default submit-btn form_submit" id="submitBtn" style="width: 150px;'">수정하기</button>
			</div>
			
			</form>
		
		</div>
	
		<div class="col-lg-2"></div>
	</div>
	<br><br>

	<c:import url="/WEB-INF/jsp/import/copyright.jsp"></c:import>
		



</body>
</html>