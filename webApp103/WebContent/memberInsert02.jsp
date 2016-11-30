<%@page import="java.sql.Statement"%>
<%@page import="class3.com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//memberInsert02.jsp
	
	//데이터 수신 및 처리
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("userName");
	String tel = request.getParameter("userTel");
	
	//데이터 베이스 연결
	
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비 (insert)
	
	String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
				+"VALUES(MEMBERSEQ.NEXTVAL,'%s','%s')", name, tel);
	
	// 작업 객체 생성 및 (준비된) 쿼리문 수행
	
	Statement stmt = conn.createStatement();
	
	stmt.executeUpdate(sql);
	
	/*
		int count =stmt.executeUpdate(sql);
		String targetPage ="";
		if (count>1)
			tartargetPage = "성공할시 나타낼 페이지";
		else 
			targetPage = "error.jsp";
	*/
	// 데이터 연결 종료
	DBConn.close();	
	
	// URL 변경(변경된 URL을 사용자에게 안내 - "이 페이지를 다시 요청하세요!")
	//--> sendRedirect() 메소드 이용 → 『DBTest02.jsp』
	response.sendRedirect("DBTest02.jsp");
	
%>
