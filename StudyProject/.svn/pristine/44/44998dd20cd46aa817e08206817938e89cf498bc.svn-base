<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
	request.setCharacterEncoding("utf-8");
	String id[] = request.getParameterValues("group1");
%>
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
	<!-- 뷰 구성 -->
	<div style="float:left; width: 80%; padding: 10px;">
		<!-- 제목 구성 -->
		<dl class="title">
			<dt><a>안녕하세요</a> | <a>투표게시판</a></dt>
			<dd></dd>
		</dl>
		<hr style="margin: 1px;"></hr>
			
		<!-- 아이디 및 글 정보 -->
		<a>jinho528</a> | 조회 : 11 | 추천 : 12 | 2016.05.22 01:55	
		<hr style="margin: 1px;"></hr>
		<br><br>
		<!-- 투표 결과 뿌려주기 -->
				
		<!-- 확인 및 결과보기 -->
		<dl>
			<dd><button type="button">투표하기</button></dd>
			<dd><button type="button">결과보기</button></dd>
		</dl>
	</div>
</body>
</html>