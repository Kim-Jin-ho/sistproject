<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%   
    request.setCharacterEncoding("utf-8");

    String title = request.getParameter("title");
    String content = request.getParameter("content");
    System.out.print(content);
%>

제목 : <%=title %><br>
내용 : <br>
<%=content %>
	

