<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jtest010.jsp (키보드 관련 이벤트)</title>
<script type="text/javascript" src="<%=cp %>/data/js/jquery-1.12.3.min.js"></script>
<style type="text/css">
	.outer
	{
		width: 100px;
		height: 100px;
		background: orange;
		padding: 50px;
		margin: 10px;
	}
	.inner
	{
		width: 100%;
		height: 100%;
		background: red;
	}
</style>
<script type="text/javascript">
	$(document).ready(function()
	{
		// 키보드 관련 이벤트
		$("textarea").keyup(function()
		{
			//alert("text");
			//alert($(this).text());	//-- text() (X)
			//alert($(this).html);		//-- html()	(X)
			//alert($(this).val());		
			var len = $(this).val().length;
			
			// 테스트
			//alert(len);
			
			var remain = 10 - len;
			
			$("h1").html(remain);
			
			// 만약 remin 이 0이면
			// 입력을 막아버리던지 경고 출력
			if(remain < 0)
			{
				$("h1").css("color","red").html("더 이상 입력 불가");	
				//alert("입력한도초과");
				$(this).attr("disabled","disabled");
				
			}
			else
				$("h1").css("color","black");
		})
		
		// 마우스 관련
		//$(".outer").mouseover().mouseenter();
		$(".outer").mouseover(function()
		{
			$("body").append($("<div>mouserover</div>").css("color","red"));
		}).mouseenter(function()
			      {
	         $("body").append("<div>mouseenter</div>");
	      });
	});
	
</script>
</head>
<body>
키보드 관련 이벤트 <br>
1. keydown / 2. keypress / 3. keyup  순으로 이벤트 발생!! <br>
<div>
	<p>하고싶은 말</p>
	<h1>10</h1>
	<textarea rows="5" cols="70"></textarea>
</div>

마우스 관련 이벤트<br>
mouseenter / mouseleave / mousemove / mouseout / mouseover / mouseup 등

<div class="outer">
	<div class="inner">
	</div>
</div>

</body>
</html>