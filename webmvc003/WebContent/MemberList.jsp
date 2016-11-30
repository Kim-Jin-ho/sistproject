<%@page import="class3.com.test.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<link rel="stylesheet" href="css/main.css">
<style type="text/css">

	* { align: center; }
	th { background-color: powderblue; }
	td { background-color: azure; }
	#userId { width: 100px; }
	#userName { width: 100px; }
	.userInfo { width: 200px; }

</style>

</head>
<body>
<div>
	<h2>학생 명단</h2>
	<hr>
</div>

<div>
	<form action="">
		<button type="button" onclick="location.href='memberinsertform'">학생 추가</button>
		
	</form>
	<p>
</div>


<div>
	<form action="scoreinsertform" method="post">
		<table>
			<tr>
				<th id="userId">아이디</th>
				<th id="userName">이름</th>
				<th class="userInfo">전화번호</th>
				<th class="userInfo">이메일</th>
				<th>성적 처리</th>
			</tr>
			<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.id }</td>
				<td>${vo.name }</td>
				<td>${vo.tel }</td>
				<td>${vo.email }</td>
				<td>
					<button type="submit" name="id" value="${vo.id }">성적 입력</button>
				</td>
			</tr>
			</c:forEach>
		</table>
	</form>
</div>
</body>
</html>















