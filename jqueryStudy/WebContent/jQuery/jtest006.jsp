<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jtest006.jsp</title>
<script type="text/javascript" src="<%=cp %>/data/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		$("div").click(function()
		{
			var h1 = $("h1", this).text();	// 클릭이 일어난, 이벤트가 발생한 당사자를 this로 칭한다.
			//var p =  $("p", this).text();
			var p =  $("p", this).html();
			alert(h1+" - "+p);
		});
	});
</script>
<style type="text/css">
	*
	{
		margin: 0px; padding: 0px;
	}
	
	div
	{
		margin: 5px; padding: 3px;
		border: 3px solid black;
		border-radius: 10px;
	}
</style>
</head>
<body>
	<h2>jQuery 실습</h2>
	<hr>

<div>
	<h1>A강의실</h1>
	<p><span id="a">JAVA 수업중</span></p>	
</div>
<div>
	<h1>B강의실</h1>
	<p><span id="b">보안 수업중</span></p>	
</div>
<div>
	<h1>A강의실</h1>
	<p><span id="c">.NET 수업중</span></p>	
</div>
</body>
</html>