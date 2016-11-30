<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userId1 = request.getParameter("userId");
	String userPw = request.getParameter("userPwd");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	String userGender = request.getParameter("userGender");
	String userCity = request.getParameter("userCity");
	
	String[] userSubject = request.getParameterValues("userSubject");
	
	String strSubject ="";
	for(int i=0; i<userSubject.length;i++)
	{
		strSubject += userSubject[i].toString()+" ";
	}
	// 수신된 데이터를 쿼리문을 통해 DB에 입력하는 과정을
	// 염두하여 작업을 진행하자
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h3>아이디 : <%=userId1 %></h3>
		<h3>패스워드 : <%=userPw %></h3>
		<h3>이름 : <%=userName %></h3>
		<h3>전화번호 : <%=userTel %></h3>
		
		<h3>성별 : <%=userGender %></h3>
		<h3>지역 : <%=userCity %></h3>
		<h3>과목 : <%=strSubject %></h3>
	</div>
</body>
</html>