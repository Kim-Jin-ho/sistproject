<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오픈 스터디 내가 쓴글</title>
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
	<!-- 왼쪽 메뉴 불러오는 부분 -->
	<c:import url="OpenStudyMenu.jsp"></c:import>
	
	<!-- 내가 쓴글 불러오기 -->
	<div>
		<div style="width: 50px; position:fixed; ; float: right;">
			<dl>
				<dt>제목</dt>
				<dt>글쓴이</dt>
				<dt>작성일</dt>
				<dt>조회수</dt>
			</dl>
			<dl>
				<dd><input type="checkbox" value="1" /> bd v</dd>
				<dd><input type="checkbox" value="2" /> bd 5</dd>
			</dl>
			<dl style="width: 300px; text-align: center;">
				<dd>
					<a href="#"><img src="../../img/button/btn_first.gif" alt="처음페이지" /></a>
					<a href="#"><img src="../../img/button/btn_prev.gif" alt="이전" /></a>
					
					<span>
						<strong>1</strong>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a> 
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
					</span>				
					<a href="#"><img src="../../img/button/btn_next.gif" alt="다음" /></a>
					<a href="#"><img src="../../img/button/btn_last.gif" alt="마지막페이지" /></a>
				</dd>
			</dl>
			<dl>
				<dt>
					<select class="selecter">
						<option>글제목</option>
						<option>작성자</option>
					</select>
				</dt>
				<dt>
					<input type="text" id="searchOSText">
				</dt>
				<dt>
					<button type="button" id="SearchOSBtn">검색</button>
				</dt>
			</dl>
		</div>
	</div>
</body>
</html>