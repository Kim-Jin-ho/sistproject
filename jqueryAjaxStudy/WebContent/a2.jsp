<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a2.jsp</title>
<script type="text/javascript" src="<%=cp %>/data/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
    
	$(document).ready(function()
	{
		/* 		
		$("#sendButton").click(function()
		{
			// 입력 받은 값 담아내기
			var subject = $("#subject").val();
			var content = $("#content").val();
			
			// 담아낸 값 a2_ok.jsp 로 보내주기
			$.get('a2_ok.jsp', {"subject":subject, "content":content }, function(args)
			{
				// ajax 결과가 정상적으로 돌아온 경우 처리할 구문.
				$("#resultDIV").html(args);
			});
		});
		 */
		$("#sendButton").click(function()
		{
			var params = "subject="+$("#subject").val()+"&content="+$("#content").val();
			
			$.ajax(
			{
				type:"POST",
				url:"a2_ok.jsp",
				data:params,
				success:function(args)
				{
					//innerHTML();
					$("#resultDIV").html(args);
					$("#subject").val("");
					$("#content").val("");
				},
				beforeSend:showResult,
				error:function(e)
				{
					alert(e.responseText);
				}
			});
			//-- 『$.ajax()』는
			//	 jQuery 에서의 ajax 처리 구문. json 형식으로 내부 내용을 표기.
			//	 『type:』 은 보내는 형식(페이지 요청 방식)
			//	 『url』 은 보내는 주소
			//	 『data』 는 보내는 데이터
			//	 『success』 는 성공적으로 결과를 받은 경우 처리할 콜백 함수
			//	 『beforeSend』 는 데이터를 전송하기 전에 처리할 함수 지정
			//	   → 함수는 반드시 true 또는 false 를 리턴 값으로 지정해야 한다.
			//	      함수의 결과 true 인 경우만 정상적인 ajax 전송을 하게 됨.
			//	 『error』 는 처리 과정에서 에러 발생 시 처리할 함수 지정이나 처리 구문.
			//	  		현재는 에러 발생 시 경고 창 호출.
			
		});
	});
	
	function showResult()
	{
		var flag = true;
		
		if(!$("#subject").val())
		{
			alert("제목을 입력해야 합니다.");
			$("#subject").focus();
			$("#subject").empty();
			flag = false;
		}
		else if(!$("#content").val())
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			$("#resultDIV").empty();
			flag = flase;
		}
		
		return flag;
	}

	

</script>
</head>
<body>
	<!-- jQuery 를 이용한 AJAX 처리 작업 -->
	
<div>
	<h2>jQuery-Ajax 실습</h2>
	<hr>	
</div>

<div>
	제목 : <input type="text" id="subject"><br>
	내용 : <input type="text" id="content"><br><br>
	<input type="button" value="보내기" id="sendButton"><br>
	<div id="resultDIV"></div><br>	
</div>

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