<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09.jsp</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>

<!-- Send09.jsp - Send09_re.jsp - Send09_for.jsp - Receive09.jsp -->
<div>
	<h2>포워딩 및 리다이렉트 실습</h2>
	<hr>
</div>
<div>
	<form action="" method="post">
		이름 : <input type="text" name="name"><br><br>
		<button type="submit" onclick="this.form.action='Send09_re.jsp'">리다이렉트</button>
		<button type="submit" onclick="this.form.action='Send09_for.jsp'">포워드</button>
	</form>
</div>
</body>
</html>