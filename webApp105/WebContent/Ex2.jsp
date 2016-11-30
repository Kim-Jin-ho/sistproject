<%@ page contentType="text/html; charset=UTF-8"%>
<%
 	// Ex1.jsp 로 부터 넘어온 데이터 수신
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userBirth = request.getParameter("userBirth");
	
	// Ex1.jsp 로부터 넘어온 사용자 정보 이름,생년월일을 session 을 통하여 다음 페이지로 같이 
	// 넘겨 준다.(Ex3.jsp)로
	session.setAttribute("userName", userName);
	session.setAttribute("userBirth", userBirth);
	
	/* 
	아래와 같은 방법으로도 데이터를 바로 전송 할 수 있다.
	session.setAttribute("userName", request.getParameter("userName"));
	session.setAttribute("userBirth", request.getParameter("userBirth"));
	*/
%>
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
	
	if(!f.userId.value)
	{
		alert("아이디를 입력하세요");
		f.userId.focus();
		return;
	}
	if(!f.userPwd.value)
	{
		alert("패스워드를 입력하세요.");
		f.userPwd.focus();
		return;
	}
	f.submit();
}
</script>
</head>
<body>
<!-- 테스트
<%=userName %>
<%=userBirth %>
 -->
<div>
	<h2>아이디와 패스워드 정보 입력</h2>
	<hr>
</div>
<div>
	<form action="Ex3.jsp" method="post" name="myForm">
		<table class="hi">
			<tr>
				<td>아이디 : <input type="text" name="userId"id="userId"></td>
			</tr>
			<tr>
				<td>패스워드 : <input type="text" name="userPwd"id="userPwd"></td>
			</tr>
			<tr>
				<td>
					<button type="button" onclick="sendIt();" >입력</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>