<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	// 생략 및 가정
	// DAO 활용 DAO 활용 쿼리문 수행 결과 반환
	// 아이디와 패스워드 값 얻어내기
	if(userId.equals("superman") && userPwd.equals("1111"))
	{
		//로그인 → 세션값 설정
		session.setAttribute("userId",userId);
		// 두번째 매개변수에 해당하는 『userId』를
		// 저장할 세션의 이름이 첫 번째 매개변수에 해당하는 『"userId"』이다.
		
		response.sendRedirect("Test1.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<h2>아이디 또는 패스워드 오류</h2>
<a href="Test1.jsp"><button type="button" class="activeControl">돌아가기</button> </a>
</body>
</html>
