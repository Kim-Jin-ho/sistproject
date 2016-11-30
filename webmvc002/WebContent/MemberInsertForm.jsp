<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
</head>
<body>

<!-- 데이터 입력 관련 뷰 페이지 구성 -->

<div>
	<h2>직원 추가</h2>
	<hr>	
</div>

<div>
	<form action="memberinsert" method="post">
		<table>
			<tr>
				<th>아이디(*)</th>
				<td>
					<input type="text" name="id">
				</td>
			</tr>
			
			<tr>
				<th>패스워드(*)</th>
				<td>
					<input type="password" name="pw">
				</td>
			</tr>
			
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" name="name" size="15">
				</td>
			</tr>
			
			<tr>
				<th>전화(*)</th>
				<td>
					<input type="tel" name="tel">
				</td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td>
					<input type="email" name="email"
					placeholder="abc@test.com 형식으로 입력하세요" size="30">
				</td>
			</tr>
			
			<tr>
				<th></th>
				<td>
					<button type="submit">확인</button>
				</td>
			</tr>
		</table>
	</form>	
</div>


</body>
</html>