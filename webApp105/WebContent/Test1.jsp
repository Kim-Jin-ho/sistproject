<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Test1_ok.jsp 에서 되돌려 보낸 userId를 받음
	String userId = (String)session.getAttribute("userId");

	// 세션 시간 변경
	// 세션 기본 시간은 1800초.
	session.setMaxInactiveInterval(30);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test1.jsp</title>
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
<div>
	<h2>세션 처리 - 로그인</h2>
	<hr>
</div>

<div>
	<table class="hi" style="width: 270px; color: white; border-style: solid;">
		<tr>
			<td>
				<a><button type="button" style="font-size:9pt; ; width: 100px;">게시판</button></a>
				|<%if(userId==null) 
				 {%>
				<a><button style="font-size:9pt; width: 98px;"class="noneControl" disabled="disabled">일정관리</button> </a> | ...
				<%}else
				  {%>
				    <a href="Test2.jsp"><button style="font-size:9pt ; width: 98px;" class="activeControl">일정관리</button> </a> | ...
				
				<%}%>
			</td>
		</tr>
		<tr>
			<td>
				<%if(userId ==null)
					{%>
				<form action="Test1_ok.jsp" method="post" name="myForm">
					아 이 디 &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userId"style="width:120px; height: 26px;"><br>
					패스워드 &nbsp;&nbsp;&nbsp;<input type="password" name="userPwd"style="width: 120px; height: 26px;"><br><br>
					<button type="button" class="activeControl" style="width: 220px; height: 40px"
					onclick="sendIt();" >로그인</button>
				</form>
				<%}
					else
					{%>
					<h3><%=userId %>님</h3>
					<h4>환영합니다.</h4>
					
					<a href="Logout.jsp" ><button type="button" class="activeControl" style="font-size: 9pt;">로그아웃</button> </a>
					<%} %>
			</td>
		</tr>
	</table>
</div>
</body>
</html>