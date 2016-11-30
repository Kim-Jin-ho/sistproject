<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	String checknum = (String)session.getAttribute("checknum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserQnaList.jsp</title>
<link href="<%=cp %>/css/hyuncss/bootstrap.css" rel="stylesheet">
<link href="<%=cp %>/css/hyunseokcss/usermain.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="<%=cp %>/js/mainjs/bootstrap.min.js"></script>
</head>
<body>	
		<div class="lnb_wr">
           <ul class="lnb">
		       <li><a href="<%=cp %>/UserReservationList.love">전체 예약 내역</a></li>
		       <li><a href="<%=cp %>/UserAdviceList.love">전체 상담 내역</a></li>
		       <li><a href="<%=cp %>/UserSelectList.love">찜 한 상품</a></li>
		       <li><a href="<%=cp %>/UserCommentList.love">내가 남긴 상품평</a></li>
		       <li><a href="<%=cp %>/UserQnaList.love">Q&A</a></li>
		       <li><a href="<%=cp %>/main/userPwcheck.jsp">정보수정</a></li>
		       <li><a href="<%=cp %>/main/userMemberLeave.jsp">회원 탈퇴</a></li>
		       <li><a href="<%=cp %>/UserWarning.love">경고</a></li>
		       </ul>
		       </div>
          
</body>
</html>