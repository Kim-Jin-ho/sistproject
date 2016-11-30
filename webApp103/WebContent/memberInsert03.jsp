<%@page import="java.sql.Statement"%>
<%@page import="class3.com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신
	 request.setCharacterEncoding("UTF-8");

	// 데이터 담기
	String name = request.getParameter("userName");
	String kor = request.getParameter("userKor");
	String eng = request.getParameter("userEng");
	String mat = request.getParameter("userMat");
	
	try
	{
		// DB 연결
		Connection conn = DBConn.getConnection();
		
		// 쿼리문 작성
		String sql = String.format("INSERT INTO TBL_SCORE(SID,NAME,KOR,ENG,MAT)VALUES(SCORESEQ.NEXTVAL,"
									+"'%s',%s,%s,%s)",name,kor,eng,mat);
		int count =0;
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		
		stmt.close();
		
		response.sendRedirect("DBTest03.jsp");
	}catch(Exception e)
	{
		System.out.print(e.toString());
	}
	finally
	{
		try
		{
			
			DBConn.close();
		}catch(Exception e)
		{
			System.out.print(e.toString());
		}
	}
	
			
%>
