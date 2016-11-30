<%@ page contentType="text/html; charset=UTF-8"%>
<%
	int n = 0;
	String count = (String)application.getAttribute("count");
	
	if(count != null)
	{
		n = Integer.parseInt(count);
	}
	
	n++;
	application.setAttribute("count", Integer.toString(n));
	
	// 실제 접속자의 주소(consol 창을 통해 확인)
	String realPath = application.getRealPath("/");
	application.log("접속자  : "+request.getRemoteAddr());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>App.jsp</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<div>
	<H2>application 을 통한 접속자 수 체크</H2>
</div>

<div>
	<h4>총 접속 자 수</h4>
	<%=n %>
	<%=realPath %>
</div>
</body>
</html>