<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	// 확인
	//System.out.println(cp);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" ></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#1").css('color','gray')
		$("#1").css('text-decoration','underline')
	});
</script>
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
	<div style="float:left; ; width: 20%; padding: 10px;">
		<c:import url="OpenStudyMenu.jsp"></c:import>
	</div>
	
	<div style="float: left; width: 80%; padding:10px;">
		<table class="bbsList" id="StudyRoomMain">
			<tr>
				<th style="width: 10%; text-align: center;"  class="fir">글번호</th>
				<th style="width: 55%; text-align: center;">제목</th>
				<th style="width: 15%; text-align: center;">작성자(아이디)</th>
				<th style="width: 15%; text-align: center;">작성일</th>
				<th style="width: 10%; text-align: center;">조회수</th>
			</tr>
			<tr><td> </td></tr>
			<tr>
				<td style="text-align: center;" id="no">1</td>
				<td style="text-align: left ;" class="reName"><a href="#">으아아아아악</a></td>
				<td style="text-align: center;" ><a href="" style="color: black;">김진호(jinho528)</a></td>
				<td style="text-align: center;" >2016-05-11</td>
				<td style="text-align: center;">0</td>
			</tr>
			<tr>
				<td style="text-align: center;" class="skNo">1</td>
				<td style="text-align: left;" class="reName"><a href="">ㅇ 어라ㅓ댬ㄴㅇㄹ</a></td>
				<td style="text-align: center;" ><a href="" style="color: black;">이재학(Lee)</a></td>
				<td style="text-align: center;" >2016-05-11</td>
				<td style="text-align: center;">0</td>
			</tr>
			<tr>
				<td style="text-align: center;" class="skNo">1</td>
				<td style="text-align: left;" class="reName"><a href="">우에에엑</a></td>
				<td style="text-align: center;" ><a href="" style="color: black;">정성찬(chan)</a></td>
				<td style="text-align: center;" >2016-05-11</td>
				<td style="text-align: center;">0</td>
			</tr>
		</table>
		<br></br>
		<div>
			<button type="button" onclick="location.href='OpenStudyFreeCreate.jsp'">글쓰기</button>
		</div>
		<div class="paging" style="text-align:center; float: left; width: 100%; padding:10px;">
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
	
		</div>
	</div>
</body>
</html>