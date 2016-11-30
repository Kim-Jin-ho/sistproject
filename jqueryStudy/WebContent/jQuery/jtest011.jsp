<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jtest011.jsp</title>
<script type="text/javascript" src="<%=cp %>/data/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function()
	{
		// ①
		// 문서의 준비 상태에서
		// 처음에 스크롤을 생기게끔 하기 위한 내용
		var dheight = $(document).height();
		var sheight = $(window).scrollTop()+$(window).height();
		
/* 		alert(dheight);	//document 의 높이
		alert($(window).height()); */
		
		// body 영역 안에 문자열 20번 출력
		for(var i=0; i<20; i++)
		{
			$("<h3>배달의민족 게시물 / "+$(document).height()+" / "
					+$(window).scrollTop()+" / "+$(window).height()+" </h3> ").appendTo("body");
		}
		
		//②
		$(window).scroll(function()
		{
			var dheight = $(document).height();
			var sheight = $(window).scrollTop()+$(window).height();
			
			//스크롤이 바닥으로 내려졌을 때 <h3> 태그 10개 추가 ~ !! (body 영역에)
			if(dheight == sheight)
			{
				for(var i=0; i<10; i++)
				{
					$("<h3>배달의민족 게시물 / "+$(document).height()+" / "
							+$(window).scrollTop()+" / "+$(window).height()+" </h3> ").appendTo("body");
				}
			}
		});
		
	});
</script>
</head>
<body>

</body>
</html>