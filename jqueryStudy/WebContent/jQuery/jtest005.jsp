<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jtest005.jsp</title>
<style type="text/css">
.item
{
    border: solid 2px red;
    color: white;
    background: black;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		//$();
		/* 
		$(document).ready(function()
		{
			$("h1").click(function()
			{
				//alert("test");
				//alert($(this).html());
				$(this).html($(this).html()+"★");
			});
		});
		 */
		// 『on()』 함수 : 이벤트 처리
/* 		
		$("h1").on("click",function()
		{
			$(this).html(function(index, html)
			{
				//alert(html);
				return html+"★";
			});
		});
		
		
		// 이벤트 다중 등록
		$("h1").on
		({
			// mouseenter -> 마우스 커서가 진입할 때
			// mouseleave -> 마우스 커서가 빠져 나갈 때
			mouseenter:function(){$(this).addClass("item");},
			mouseleave:function(){$(this).removeClass("item");},
		})
	 */	
		$("h1").hover(function()
		{
			$(this).addClass("item");
		}, function()
		{
			$(this).removeClass("item");
		});
	});
</script>
<link rel="stylesheet" href="<%=cp%>/data/css/style.css">
</head>
<body>
<div>
	<h2>jQuery 실습</h2>
	<hr>
</div>

<div>
	<h1>이지해</h1>
	<h1>이재학</h1>
	<h1>정성찬</h1>
</div>

</body>
</html>