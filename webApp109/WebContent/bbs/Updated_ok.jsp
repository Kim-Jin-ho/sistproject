<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.board.BoardDAO"%>
<%@page import="com.board.BoardDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="com.board.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	
	Connection conn = null;
	BoardDAO dao = null; 
	try
	{
		conn = DBConn.getConnection();
		dao = new BoardDAO(conn);
		
		int result = dao.updateData(dto);
	}catch(Exception e)
	{
		System.out.print(e.toString());
	}
	response.sendRedirect("List.jsp");
	
%>
<%-- <%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));	
	System.out.print(num);
	
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String email = request.getParameter("email");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	BoardDTO dto = new BoardDTO();
	
	Connection conn = DBConn.getConnection();
	
	BoardDAO dao = new BoardDAO(conn);
	
	dto.setNum(num);
	dto.setSubject(subject);
	dto.setName(name);
	dto.setEmail(email);
	dto.setContent(content);
	dto.setPwd(pwd);

	dao.updateData(dto);
	
	response.sendRedirect("List.jsp");
%> --%>
