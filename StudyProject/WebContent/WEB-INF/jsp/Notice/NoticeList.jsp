<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 
	String cp = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>공지사항</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="http://bootswatch.com/paper/bootstrap.min.css" >
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
<script type="text/javascript" src="ajax.js"></script>
	
<script type="text/javascript">
$(function()
{
	$("#writebtn").click(function()
	{
		//writefrom으로 이동
		$(location).attr("href","NoticeWriteForm.room");
		
	});
	
})

</script>
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
	
	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<h2>공지사항 <small>Notice</small></h2>
			
			<table class="table table-hover table-responsive">
				<tr>
					<th class="text-center">글번호</th>
					<th>제목</th>
					<th class="text-center">작성자</th>
					<th class="text-center">작성일</th>
					<th class="text-center">조회수</th>
				</tr>
				<c:forEach var="list" items="${lists }">
					<tr>
						<td class="text-center">${list.rnum }</td>
						<td><a href="NoticeDetail.room?noticeSeq=${list.noticeSeq }">${list.subject }</a></td>
						<td class="text-center">${list.writer }</td>
						<td class="text-center">${fn:substring(list.writeDate,0,10)}</td>
						<td class="text-center">${list.hitCount }</td>
					</tr>
				</c:forEach>
			</table>
				<div class="text-center">
					<c:if test="${listCount != 0 }">
						<ul  class="pagination pagination-sm">
							${pageIndexList }
						</ul>
					</c:if>
				</div>
			
			<!-- 관리자 세션 확인 후 if로 노출여부 결정 -->
			<c:if test="${admin == 'admin'}">
				<div class="text-right">
				<button type="button" class="btn btn-primary cs-btn" id="writebtn" >글쓰기</button>
				</div>
			</c:if>
			
		</div>


		<div class="col-lg-2"></div>
	</div>
	<br><br>

	<c:import url="/WEB-INF/jsp/import/copyright.jsp"></c:import>

</body>
</html>