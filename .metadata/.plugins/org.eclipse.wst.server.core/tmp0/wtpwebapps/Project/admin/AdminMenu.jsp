<!-- 소메뉴 펼치기 접기 -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<title>AdminMenu.jsp</title>
<link href="<%=cp %>/css/hyuncss/bootstrap.css" rel="stylesheet">
<link href="<%=cp %>/css/hyunseokcss/usermain.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="<%=cp %>/js/mainjs/bootstrap.min.js"></script>
</head>
<body>
	<div class="lnb_wr">
			<ul class="lnb">
	            <li><a href="<%=cp %>/AdminCoMemberList.love">기업회원</a></li>
	            <li><a href="<%=cp %>/AdminPriMemberList.love">개인회원</a></li>
			    <li><a href="<%=cp %>/AdminProductManagement.love">상품관리</a></li>
			    <li><a href="<%=cp %>/NoticeList.love">공지사항</a></li>
	            <li><a href="<%=cp %>/CmpnyQnaList2.love">기업회원QNA</a></li>
	            <li><a href="<%=cp %>/AdminPriQnaList.love">개인회원QNA</a></li>
	        </ul>
	</div>
	

	

</body>
</html>