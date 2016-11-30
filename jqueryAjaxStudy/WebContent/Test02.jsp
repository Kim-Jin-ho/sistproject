<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.txtBox
	{
		border: 1px solid gray;
		border-radius : 3px;
	}
	
	#result
	{
		display: inline-block;
		width: 205px;
		color: #f33;
	}
</style>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">

	function check()
	{
		// 데이터 수집
		var id = document.getElementById("id").value;
		
		// URL
		var url= "/jqueryAjaxStudy/Test02.do?id="+id;
		
		// HTTPRequest 객체 생성
		ajax = createAjax();
		
		ajax.open("GET",url, true);
		
		ajax.onreadystatechange = function()
		{
			if(ajax.readyState == 4)
			{
				if(ajax.status == 200)
				{
					//업무 처리
					callBack();
				}
			}
		}
		ajax.send("");
	}
	
	// 아이디 중복 검사의 결과글 통보 받아서 아용자에게 메세지를 출력해준다.
	function callBack()
	{
		var data = ajax.responseText;
		
		// 테스트
		//alert(data);
		
		if (data == 0)
			document.getElementById("result").innerText = "사용 가능한 아이디 입니다.";
		else
			document.getElementById("result").innerText = "이미 사용중인 아이디입니다.";	
	}
</script>
</head>
<body>
<!-- 아이디 중복 검사 -->

	<h3>회원 가입</h3>
	<table class="table">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" id="id" class="txtBox" placeholder="아이디를 입력하세요.">
				<input type="button"  value="중복검사" class="control" onclick="check();">
				<span id="result"></span>
			</td>
		</tr>		
		<tr>
			<th>이름</th>
			<td>
				<input type="text" id="name" class="txtBox" placeholder="이름을 입력하세요.">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" id="addr" class="txtBox" placeholder="주소를 입력하세요.">
			</td>
		</tr>
	</table>
</body>
</html>