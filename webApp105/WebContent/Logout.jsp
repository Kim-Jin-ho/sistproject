<%@ page contentType="text/html; charset=UTF-8"%>
<%
	session.removeAttribute("userId");		//-- 세션의 사용자 아이디 삭제
	session.invalidate();
	//-- 기존 세션에 저장되어 있는 모든 것을 지우고 세션을 초기화 한다
	response.sendRedirect("Test1.jsp");
%>
