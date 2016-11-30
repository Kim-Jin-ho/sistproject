<%@page import="class3.com.test.MemberDAO"%>
<%@page import="class3.com.test.MemberVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	/*
		데이터 가져오기
		
		메소드 호출
		
		테이블에 데이터 입력
		
		페이지 이동
	*/
	// 넘겨받는 값이 한글이 포함되므로 선언
	request.setCharacterEncoding("UTF-8");
	
	// 가입시킬 정보 받아오기
	String name = request.getParameter("uName");
	String tel = request.getParameter("tel");
	
	// member 인스턴스 생성
	MemberVO member = new MemberVO();
	member.setName(name);
	member.setTel(tel);
	
	// dao 인스턴스 생성
	MemberDAO dao = new MemberDAO();
	
	try
	{
		// 데이터 베이스 연결
		dao.Connection();
		// DB에 데이터 추가
		dao.add(member);
		
	}catch(Exception e)
	{
		System.out.print(e.toString());
	}finally
	{
		try
		{
			// 데이터베이스 연결 종료
			dao.close();		
		}catch(Exception e)
		{
			System.out.print(e.toString());
		}
	}
	
	response.sendRedirect("MemberSelect.jsp");
	
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