<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 소메뉴 불러오기 -->
	<div class="smallMenu" style="margin: 10px;">
		<c:import url="SmallMenu.jsp"></c:import>
	</div>
	<br>
	
	<!-- 대메뉴 불러오기 -->
	<div class="mainMenu" style="margin: 10px;">
		<c:import url="MainMenu.jsp"></c:import>
	</div>
	<br>
	<!-- 왼쪽 메뉴 -->
	<div style="float:left; ; width: 20%; padding: 10px;" >
		<c:import url="OpenStudyMenu.jsp"></c:import>
	</div>
	<!-- 가운데 메뉴 구성 -->
	<div class="mainstudysosic" style="float:left; ; width: 80%;">
		<table>
			<tr>
				<th>게시판번호</th>
				<th>내용</th>
				<th>날짜</th>
			</tr>
			<tr>
				<td>1</td>
				<td>안녕하세요</td>
				<td>2016.05.22</td>
			</tr>
		</table>
	</div>
</body>
</html>