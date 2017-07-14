<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="<%=cp%>/WEB-INF/jsp/css/FAQ.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=cp%>/WEB-INF/jsp/js/FAQ.js"></script>





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



<link href="<%=cp%>/css/FAQ.css" rel="stylesheet">
<script type="text/javascript" src="http://dev.naver.com/scm/viewvc.php/*checkout*/trunk/sistProject01/WebContent/WEB-INF/jsp/js/FAQ.js?revision=30&root=siststudy01"></script>


</head>
<body>

<c:choose>
    <c:when test="${nickname eq null}">
		<div class="row">
			<div class="form-group col-xs-12">
			   <div class="">
			      <c:import url="/WEB-INF/jsp/StudyRoom/StudyRoomTop.jsp"></c:import>
			   </div>
			</div>
		</div>
    </c:when>
    <c:when test="${nickname ne null}">
	<div class="row">
		<div class="form-group col-xs-12">
		   <div class="">
		      <c:import url="/WEB-INF/jsp/StudyRoom/StudyRoomTop_member.jsp"></c:import>
		   </div>
		</div>
	</div>
	</c:when>
</c:choose>
	<br><br><br>

	<div class="container">
		<c:if test="${cd == null }">
			<form action="FAQInsert.room" method="post" id="inputForm">
		</c:if>
		<c:if test="${cd != null }">
			<form action="FAQUpdate.room" method="post" id="inputForm">
			<input type="hidden" value="${cd }" name="cd">
		</c:if>
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="row">
						<div class="col-sm-12 form-group">
							<label for="title">질문</label>
							<input class="form-control" id="title" name="title"
								placeholder="Title" type="text" value="${dto.faqname }" required>
						</div>
					</div>
					<label for="comment">답변</label>
					<textarea class="form-control" id="comment" name="comment"
						placeholder="Comment" rows="10">${dto.faqdap }</textarea>
					<hr>
					<div class="row">
						<div class="col-md-12 form-group" id="rightButton">
							<c:if test="${cd == null }">
								<button class="btn btn-default" type="button" id="insert">등록</button>
							</c:if>
							<c:if test="${cd != null }">
								<button class="btn btn-default" type="button" id="update">수정</button>
							</c:if>
							<button class="btn btn-default" type="button" onclick="javascript:location.href='http://localhost:8090/StudyProject/FAQ.room'">취소</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>


	<c:import url="/WEB-INF/jsp/import/copyright.jsp"></c:import>








</body>
</html>