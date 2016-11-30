<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jtest001.jsp</title>
<script type="text/javascript">

	/*
	window.onload = 기능/동작; 
	*/
	
	/* 
	function jtest()
	{
		alert("환영합니다");
	}
	*/	
	
	// 같은 이벤트가 두 번 이상 등록되면
	// 마지막 내용만 실행된다.
	window.onload = function()
	{
		alert("환영합니다.1");
	}
	
	window.onload = function()
	{
		alert("환영합니다.2");
	}
	
</script>
</head>
<body>

</body>
</html>