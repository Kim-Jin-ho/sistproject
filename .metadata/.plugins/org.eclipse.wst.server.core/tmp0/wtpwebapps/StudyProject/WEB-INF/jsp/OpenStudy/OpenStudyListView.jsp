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
	
	<!-- 왼쪽 메뉴 불러오기 -->
	<div style="float:left; width: 120px; padding: 10px;">
		<c:import url="OpenStudyMenu.jsp"></c:import>
	</div>
	
	<!-- 스터디원 목록 -->
	<div style="float: left; width: 80%; padding:10px;">
		<span>스터디원 목록</span>
		<hr>
		
		<dl>
			<dd>
				<table class="bbsList" id="StudyRoomMain">
					<tr>
						<th style="width: 10%; text-align: center;"  class="fir">번호</th>
						<th style="width: 15%; text-align: center;">아이디</th>
						<th style="width: 15%; text-align: center;">이름</th>
						<th style="width: 10%; text-align: center;">나이</th>
						<th style="width: 10%; text-align: center;">등급</th>
						<th style="width: 20%; text-align: center;">가입일</th>
						<th style="width: 20%; text-align: center;">최종방문일</th>
					</tr>
					<tr><td> </td></tr>
					<tr>
						<td style="text-align: center;" class="skNo">1</td>
						<td style="text-align: center;">jinho528</td>
						<td style="text-align: center;">김진호</td>
						<td style="text-align: center;">28</td>
						<td style="text-align: center; color: red;">스터디장</td>
						<td style="text-align: center;">2016-05-01</td>
						<td style="text-align: center;">2016-05-22</td>
					</tr>
					<tr>
						<td style="text-align: center;" class="skNo">2</td>
						<td style="text-align: center;">jinho528</td>
						<td style="text-align: center;">김진호</td>
						<td style="text-align: center;">28</td>
						<td style="text-align: center;">스터디원</td>
						<td style="text-align: center;">2016-05-01</td>
						<td style="text-align: center;">2016-05-22</td>
					</tr>
					<tr>
						<td style="text-align: center;" class="skNo">3</td>
						<td style="text-align: center;">jinho528</td>
						<td style="text-align: center;">김진호</td>
						<td style="text-align: center;">28</td>
						<td style="text-align: center;">스터디원</td>
						<td style="text-align: center;">2016-05-01</td>
						<td style="text-align: center;">2016-05-22</td>
					</tr>
				</table>
			</dd>
		</dl>
		<dl>
			<dd>
				<select id="memberSearchSelect">
					<option id="memberSarchSelect1" value="1">아이디</option>
					<option id="memberSarchSelect2" value="2">이름</option>
				</select>
				<input type="text" name="memberSearch" id="memberSearch">
				<button type="button" id="memberSearchBtn" name="memberSearchBtn">검색</button>
			</dd>
		</dl>
	</div>
	
</body>
</html>