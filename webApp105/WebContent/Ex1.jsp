<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript">

	function sendIt()
	{
		var f = document.myForm;
		
		if(!f.userName.value)
		{
			alert("이름을 입력하세요");
			f.userName.focus();
			return;
		}
		if(!f.userBirth.value)
		{
			alert("생일을 입력하세요.");
			f.userBirth.focus();
			return;
		}
		f.submit();
	}
</script>
</head>
<body>
<div>
	<h2>이름과 생일 정보 입력</h2>
	<hr>
</div>
<div>
	<form action="Ex2.jsp" method="post" name="myForm">
		<table class="hi">
			<tr>
				<td>이름 : <input type="text" name="userName" id="userName"></td>
			</tr>
			<tr>
				<td>생일 : <input type="date" name="userBirth" id="userBitrh"></td>
			</tr>
			<tr>
				<td>
					<button type="button"onclick="sendIt();" >입력</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>