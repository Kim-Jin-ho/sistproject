<%@page import="class3.com.test.ScoreDTO"%>
<%@page import="class3.com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("userName");
	int kor = Integer.parseInt(request.getParameter("userKor"));
	int eng = Integer.parseInt(request.getParameter("userEng"));
	int mat = Integer.parseInt(request.getParameter("userMat"));
	
	ScoreDAO dao = null;
	
	try
	{
		dao = new ScoreDAO();
		
		ScoreDTO score = new ScoreDTO();
		
		score.setName(name);
		score.setKor(kor);
		score.setEng(eng);
		score.setMat(mat);
		
		dao.add(score);
		
	}catch(Exception e)
	{
		System.out.print(e.toString());
	}
	response.sendRedirect("DBTest05.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>