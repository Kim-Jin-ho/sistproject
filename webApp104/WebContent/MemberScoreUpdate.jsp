<%@page import="class3.com.test.MemberScoreDTO"%>
<%@page import="class3.com.test.MemberScoreDAO"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	
	String sid = request.getParameter("sid");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try{

		dao.Connection();
		
		MemberScoreDTO score = new MemberScoreDTO();
		score.setSid(sid);
		score.setKor(Integer.parseInt(kor));
		score.setEng(Integer.parseInt(eng));
		score.setMat(Integer.parseInt(mat));
		
		dao.modify(score);
		
	}catch(Exception e){
		
		System.out.println(e.toString());
		
	}finally{
		
		try{
			
			dao.close();
			
		}catch(Exception e){
			
			System.out.println(e.toString());
			
		}
		
	}
	
	response.sendRedirect("MemberScoreSelect.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreUpdate.jsp</title>
</head>
<body>

</body>
</html>