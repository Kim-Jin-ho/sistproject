<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<div>
	<h2>계산기 구동</h2>
	<hr>
</div>

<div>
	<!-- 첫 번째 방법 -->
	<!-- <form action="Calc_ok1.jsp" method="post" name="myForm"> -->
	
	<!-- 두 번째 방법 -->
	<!-- <form action="Calc_ok2.jsp" method="post" name="myForm"> -->
	
	<!--  세 번째 방법 -->
	<form action="Calc_ok4.jsp" method="post" name="myForm">
		<input type="text" name="su1" class="txt">
		
		<select name="oper">
		<option value="+">더하기</option>
		<option value="-">빼기</option>				
		<option value="*">곱하기</option>
		<option value="/">나누기</option>
		</select>
		<input type="text" name="su2" class="txt"> 
		<button type="submit"class="activeControl"> = </button>
	</form>
</div>
</body>
</html>