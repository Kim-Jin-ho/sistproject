<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreInsertForm.jsp</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>

<div>
	<form action="scoreinsert" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td>${id }</td>
			</tr>
			<tr>
				<th>국어</th>
				<td><input type="text" name="kor"/>
			</tr>
			<tr>
				<th>영어</th>
				<td><input type="text" name="eng"/>
			</tr>
			<tr>
				<th>수학</th>
				<td><input type="text" name="mat"/>
			</tr>
			<tr>
				<td colspan="2">
				<button type="submit" name="id" value="${id }">입력하기</button>
				</td>
			</tr>	
		</table>
	</form>
</div>

</body>
</html>