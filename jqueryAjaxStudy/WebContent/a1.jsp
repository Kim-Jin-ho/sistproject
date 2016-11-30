<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a1.jsp</title>
<script type="text/javascript" src="<%=cp %>/data/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">

	// jQuery 는 jQuery 라는 키워드 대신에 $ 를 사용한다.
	jQuery(document).ready(function()
	{
		// $("#saveButton") 는 document.getElementByI("saveButton") 과 같은 의미
		$("#saveButton").click(function()
		{
			var value = $("#name").val();
			
			// ajax 객체 생성. 콜백 메소드 지정.
			// open(), send() 등이
			// jQuery 에서는 『$.get()』에서 모두 실행됨.
			//-- 『$.get()』 은 GET 방식으로 데이터를 전송하며 페이지를 요청한다는 의미
			//	 『$.get('보낼대상',{json 구조에 의한 키:값 형태의 전송}, function(결과수신변수){결과 처리 구문});』
			//-- json 구조에서 데이터가 여러개인 경우는
			//	 『,』(콤마:comma)로 구분해서 계속 나열하면 됨.
			//-- 『$.get()』을 『$.post()』로 바꾸면
			//	 POST 방식으로 데이터 전송 및 페이지 요청 됨.
			$.get('a1_ok.jsp', {"name":value}, function(args)
			{
				// ajax 결과가 정상적으로 돌아온 경우 처리할 구문.
				$("#resultDIV").html(args);
			});
		});
		
		$("#clearButton").click(function()
		{
			$("#resultDIV").empty();
		});
	});
</script>
<script type="text/javascript" src="ajax.js"></script>
</head>
<body>
	<!-- jQuery 를 이용한 AJAX 처리 작업 -->
	
<div>
	<h2>jQuery-Ajax 실습</h2>
	<hr>	
</div>

<div>
	이름 : <input type="text" id="name">
	<button type="button" id="saveButton">전송</button>
	<button type="button" id="clearButton">지우기</button>
	<div id="resultDIV"></div>
</div>
<br><br>
<div>
	<input type="text"><br>
	<input type="radio" name="test">test1
	<input type="radio" name="test">test2<br>
	<input type="checkbox" name="exam">exam1
	<input type="checkbox" name="exam">exam2
	<input type="checkbox" name="exam">exam3
</div>

</body>
</html>
