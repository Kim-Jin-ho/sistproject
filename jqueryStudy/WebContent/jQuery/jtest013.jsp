<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jtest013.jsp</title>
<style type="text/css">
	div.page
	{
		border: 1px solid red;
		padding: 3px;
		margin: 5px;
		position: absolute;
		right: 100px;
		top: 100px;
	}
	
	button
	{
		width: 200px;
		font-weight: bold;
		background-color:white;
		color: hotpink;
		border-radius : 4px;
	}
</style>
<script type="text/javascript" src="<%=cp %>/data/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("button").click(function()
		{
			$(this).next().toggle("slow");
			// 『toggle()』 의 매개변수로는 『slow』, 『fast』 등을 입력할 수 있으며,
			// 상수 형태의 밀리초 단위를 입력할 수도 있다.
			// 또한, 매개변수의 갯수를 확장시켜 해당 초 이후의 기능적용도
			// 가능하다.
			/* $(".page").toggle(3000,function()
			{
				alert("토글 기능 테스트 완료!!");
			}); */
		});
	});
</script>
</head>
<body>

	<button type="button">Toggle Button(토글 버튼)</button>
	<div class="page">
		<h1>jQuery Toggle</h1>
		<p>
		show() / hide() / toggle ()<br>
		slideDown() / slidUp() / slideToggle()<br>
		fadeIn() / fadeOut() / fadeToggle<br>
		</p>
	</div>
	<br>
	<button type="button">Toggle Button(토글 버튼)</button>
	<div class="page">
		<h1>jQuery Toggle</h1>
		<p>
		show() / hide() / toggle ()<br>
		slideDown() / slidUp() / slideToggle()<br>
		fadeIn() / fadeOut() / fadeToggle<br>
		</p>
	</div>
	<br>
	
	<button type="button">Toggle Button(토글 버튼)</button>
	<div class="page">
		<h1>jQuery Toggle</h1>
		<p>
		show() / hide() / toggle ()<br>
		slideDown() / slidUp() / slideToggle()<br>
		fadeIn() / fadeOut() / fadeToggle<br>
		</p>
	</div>
	<br>
	
	<button type="button">Toggle Button(토글 버튼)</button>
	<div class="page">
		<h1>jQuery Toggle</h1>
		<p>
		show() / hide() / toggle ()<br>
		slideDown() / slidUp() / slideToggle()<br>
		fadeIn() / fadeOut() / fadeToggle<br>
		</p>
	</div>
	<br>
	
	<button type="button">Toggle Button(토글 버튼)</button>
	<div class="page">
		<h1>jQuery Toggle</h1>
		<p>
		show() / hide() / toggle ()<br>
		slideDown() / slidUp() / slideToggle()<br>
		fadeIn() / fadeOut() / fadeToggle<br>
		</p>
	</div>
	<br>
</body>
</html>