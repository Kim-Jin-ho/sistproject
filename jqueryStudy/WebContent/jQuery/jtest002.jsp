<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jtest002.jsp</title>
<!-- jQuery 를 사용하기 위해서는 반드시 다음처럼 .js 를 연결해야 한다. -->
<script type="text/javascript" src="<%=cp%>/data/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">

/* 	window.onload = function()
	{
		alert("환영합니다.1");
	}
	
	window.onload = function()
	{
		alert("환영합니다.2");
	} */
	
	// ※ jQuery 는 『$(선택자)』 또는 『jQuery(선택자)』 로 시작한다.
	// 『$()』는 『$(document).ready()』와 같은 의미로 사용된다.
	// 문서가 사용 가능 시저멩 자동으로 인식된다.
	// 그리고 이 때 주어진 콜백 함수가 동작하게 된다.
	
	$(function()
	{
		alert("환영합니다.1");
	});
	
	$(function()
	{
		alert("환영합니다.2");
	});
	
	// 프로그램 실행 도중에 Css 프로퍼티를 적용시킬수도 있다.
	//$();
	$(document).ready(function()
	{
		$(document.body).css("background","hotpink");
	});
	
	// 프로그램 실행 도중에 HTML 태그를 추가 / 삭제 할 수도 있다.
	$(function()
	{
		$("<div><h2>jQuery Test...</h2></div>").appendTo("body");	
	})


</script>

</head>
<body>
</body>
</html>