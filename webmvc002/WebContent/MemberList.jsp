<%@page import="class3.com.test.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");

	ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
	
	list = (ArrayList<MemberDTO>)request.getAttribute("list");
	
	StringBuffer sb = new StringBuffer();
	
	for (MemberDTO dto : list)
	{
		sb.append(dto.getId()+" ");
		sb.append(dto.getName()+" ");
		sb.append(dto.getTel()+" ");
		sb.append(dto.getEmail());
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<h2>직원 명단</h2>
	<hr>
</div>

<div>
	<form action="">
		<button type="button" onclick="location.href='memberinsertform'">직원 추가</button>
	</form>
</div>


<div>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
		</tr>
		
		<%-- 『<c:forEach> 는 반복문 실행하는 JSTL』 --%>
		<%-- 『items=${컬렉션} 속성은 컬렉션 자료를 수신하는 속성』 --%>
		<%-- 『var="변수명"』 속성은 임시 변수 지정 --%>
		<c:forEach var="dto" items="${list}">
		<tr>
			<%-- 『dto.id』는 속성과 매핑되는 dto 객체의 getter 를 호출한다. --%>
			<td>${dto.id }</td>
			<td>${dto.name }</td>
			<td>${dto.tel }</td>
			<td>${dto.email }</td>
		</tr>
		</c:forEach>
	</table>	
</div>


</body>
</html>