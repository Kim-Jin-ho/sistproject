<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
%>
<jsp:useBean id="vo" class="class3.com.test.FriendVO"/>
<jsp:setProperty property="*" name="vo"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<%
	String[] ho = vo.getUserHyung();
	StringBuffer sb = new StringBuffer();
	
	
	for(int i = 0; i < ho.length; i++)
	{
	   sb.append(ho[i]+" ");
	}
	
%>
<h3>이  름 : <%=vo.getUserName() %></h3>
<h3>나  이 : <%=vo.getUserAge() %></h3>
<h3>성  별 : <%=vo.getUserAge() %></h3>
<h3>이상형 : <%=sb %></h3>
</div>
</body>
</html>