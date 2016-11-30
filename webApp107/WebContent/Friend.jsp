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
		var ch = document.getElementsByName("userSung");
		var f = document.myForm;
		var msg = "아무것도 선택되지 않았습니다.";
		
		//alert(checkObjs);
		
		for (var i = 0; i < ch.length; i++)
		{
			if (ch[i].checked)
			{
				msg = ch[i].value + "\n";
			}
		}
		f.submit();
	}
</script>
</head>
<body>
<div>
	<h2>인적 정보 입력하기</h2>
	<hr>
</div>

<div>
	<form action="Friend_ok.jsp" method="post" name="myForm">
		<table class="hi">
			<tr>
				<td align="right" width="100px"> 이  름 :</td>
				<td>&nbsp;<input type="text" name="userName">
			</tr>
			<tr>
				<td align="right"> 나  이 : </td>
				<td>&nbsp;<input type="text" name="userAge">
			</tr>
			<tr>
				<td align="right">성  별 : </td>
				<td>&nbsp;<input type="radio" name="userSung" id="1"value="남자"><label for="1">남자</label>
					<input type="radio" name="userSung" id="2"value="여자"><label for="2">여자</label>
				</td>
			</tr>
			<tr>
				<td align="right">이상형 : 
				<td>
					&nbsp;<input type="checkbox" name="userHyung" value="청순" id="청순"><label for="청순">청순</label>
					<input type="checkbox" name="userHyung" value="가련" id="가련"><label for="가련">가련</label>
					<input type="checkbox" name="userHyung" value="듬직" id="득직"><label for="듬직">듬직</label>
					<input type="checkbox" name="userHyung" value="섹시" id="섹시"><label for="섹시">섹시</label>
					<input type="checkbox" name="userHyung" value="엽기" id="엽기"><label for="엽기">엽기</label>
				</td>
			</tr>
		</table>
		<button type="button" onclick="sendIt();">등 록</button>
	</form>
</div>
</body>
</html>