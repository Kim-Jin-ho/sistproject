<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jtest007.jsp</title>
<style type="text/css">
	.item
	{
		border: 1px solid gray;
		width: 40px;
		height: 40px;
		background-color: white;
		display: inline-block;
		margin-bottom: -4px; 
		transition : 1s all;
		
	}
	#box
	{
		width: 420px;
	}
</style>
<script type="text/javascript">
	
	window.onload = function()
	{
		var box = document.getElementById("box");
		
		for(var i = 1; i<=100; i++)
		{
			var item = document.createElement("div");
			//item.id = "text" 아이디에 text 라는 id 속성 부여
			item.className = "item";		// 클래스는 xxx.id 는 안되고 xxx.className을 써야함
			box.appendChild(item);
			
			// item 100개에 이벤트 걸기
			/* item.onclick = function() */
			//item.ondblclick= function()
			item.mouseover = function()
			{
				//alert("아이템");
				
				event.srcElement.style.backgroundColor = "yellow";
				event.srcElement.style.transform = "rotate(720deg)";
				event.srcElement.style.opacity ="0";
			}
			
		}
			
	}
</script>
</head>
<body>
<div id="box">
	
</div>
</body>
</html>