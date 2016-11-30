<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=cp %>/data/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		$("h1").click(function()
		{
			$(this).html(function(num, content)
			{
				
				return content + "★";
			});
		});
		
		// 트리거 활용
		$("input[type=button]").click(function()
		{
			//『trigger()』 : 트리거
			$("h1").last().trigger("click");
		});
	});
	
	
</script>
</head>
<body>
<div>
	<h2>트리거 활용</h2>
	<hr>
</div>
<input type="button" value="트리거 구동 시작">
<div>
	<h1>START :</h1>
	<h1>START :</h1>
</div>
</body>
</html>