<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>공지사항 글내용</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Dosis:300,400,500,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.default.css">
    <link rel="stylesheet" href="css/animate.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Style -->
    <link href="css/style.css" rel="stylesheet">
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript" src="<%=cp %>/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function()
	{
		
		$("#listbtn").click(function()
		{
				$(location).attr("href","Notice.room");
		});
		
		$("#modifybtn").click(function()
		{
			//alert("${content.noticeSeq }");
			$(location).attr("href","NoticeModifyForm.room?noticeSeq="+"${content.noticeSeq }");
			
		});
		
		$("#deletebtn").click(function()
		{
			if (confirm("삭제하시겠습니까?")) 
			{
				//alert("${content.noticeSeq }");
				$(location).attr("href","NoticeDelete.room?noticeSeq="+"${content.noticeSeq }");
			}
		});
	})

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
		<h2>공지사항 상세 <small>NoticeDetail</small></h2>
		<br><br>
			<table class="table">
				<tr>
					<th colspan="6" class="text-center active"><h3>${content.subject }</h3></th>
				</tr>
				<tr>
					<th class="text-center">글번호</th><td class="text-left">${content.noticeSeq }</td>
					<th class="text-center">작성자</th><td class="text-center">${content.writer }</td>
					<th class="text-right">작성일</th><td class="text-center">${content.writeDate }</td>
				</tr>
				<tr>
					<td colspan="6" style=" padding: 20px;">${content.content }</td>
				</tr>
				<tr>
					<td class="text-center">이전글</td>
					<td colspan="5"><a href="NoticeDetail.room?noticeSeq=${preContent.noticeSeq }">${preContent.subject }</a></td>
					
				</tr>
				<tr>
					<td class="text-center">다음글</td>
					<td colspan="5"><a href="NoticeDetail.room?noticeSeq=${nextContent.noticeSeq }">${nextContent.subject }</a></td>
				</tr>
				<tr></tr>
			</table>
			
			<div class="text-right">
			<button type="button" class="btn btn-default cs-btn" id="listbtn">목록으로</button>
			
			<!-- 관리자 세션 확인 후 if로 노출여부 결정 -->
			<c:if test="${admin == 'admin'}">
				<button type="button"  class="btn btn-default submit-btn form_submit" id="modifybtn" style="width: 150px;">수정</button>
				<button type="button" class="btn btn-primary cs-btn" id="deletebtn">삭제</button>
			</c:if>
			
			</div>
		
		<br>
	
	</div>
		<div class="col-lg-2"></div>
	</div>
	<br><br>
	<c:import url="/WEB-INF/jsp/import/copyright.jsp"></c:import>
</body>
</html>