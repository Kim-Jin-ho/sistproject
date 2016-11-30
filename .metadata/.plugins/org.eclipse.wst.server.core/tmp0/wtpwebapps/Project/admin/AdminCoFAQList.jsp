<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_기업회원FAQ리스트(AdminCoFAQList.jsp)</title>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>

</head>
<body>

<div id="wrap"> <%-- 전체 틀 --%>

	<div id="header"> 
		<c:import url="AdminTitle.jsp"></c:import> <%-- 타이틀, gnb --%>
		<c:import url="AdminMenu.jsp"></c:import> <%-- 매뉴 --%>
	</div>
	
	<div id="container"> <%-- 내용 --%>
	
	<div> <!-- 테이블 -->

	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
		</tr>
		<tr>
			<td>3</td>
			<td>결제방법을…</td>
		</tr>
		<tr>
			<td>2</td>
			<td>탈퇴방법…</td>
		</tr>
		<tr>
			<td>1</td>
			<td>회원가입 시…</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td><button type="button" onclick="location.href='AdminCoFAQInsertForm.jsp'">글쓰기</button></td>
		</tr>
	</table>
	
	
	
	
	
	
	</div>
	
	
	
	
	
	</div>
	
	

	<div id="header"> 
		<c:import url="AdminFooter.jsp"></c:import>
	</div>
	

</div>

</body>
</html>