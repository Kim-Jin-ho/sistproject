<%@page import="java.util.ArrayList"%>
<%@page import="class3.com.test.MemberVO"%>
<%@page import="class3.com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberDAO dao = null;
	
	String memberCount = "<span id=\"memberCount\">전체 인원수 : ";
	try
	{
		dao = new MemberDAO();
		memberCount += dao.count() +"</span>";
		str.append("<table border='1'style='border-style:solid; border-color:white;'><tr><td>회원번호</td><td>이름</td><td>전화번호</td></tr>");
		
		// MemberDAO 객체의 lists() 메소드 호출
		// 반복문을 통해 <table> 엘리먼트 생성
		/* ArrayList<MemberVO> member = dao.lists();
		
		for(int i = 0 ; i <= member.size(); i++)
		{
			str.append("<tr>");
			str.append("<td>"+member.get(i).getSid()+"</td>");
			str.append("<td>"+member.get(i).getName()+"</td>");
			str.append("<td>"+member.get(i).getTel()+"</td>");
			str.append("</tr>");
		}
		str.append("</table>"); */
		
		for(MemberVO member : dao.lists())
		{
			str.append("<tr>");
			str.append("<td align='right'>"+member.getSid()+"</td>");
			str.append("<td>"+member.getName()+"</td>");
			str.append("<td>"+member.getTel()+"</td>");
			str.append("</tr>");
		}
		str.append("</table>");
	}catch(Exception e)
	{
		System.out.print(e.toString());
	}finally
	{
		try
		{
			dao.close();
		}catch(Exception e)
		{
			System.out.print(e.toString());
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBTest04.jsp</title>
<link rel="stylesheet" href="css/main.css">
<style type="text/css">
	.msg{ color: red; font-size: small; display: none;}
</style>
<script type="text/javascript">
	
	function formCheck()
	{
		var userName = document.getElementById("userName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		if(userName.value == "")
		{
			nameMsg.style.display = "inline";
			userName.focus();
			return false;	
		}
		
		return true;
	}
</script>
</head>
<body>
<div>
	<h2>데이터베이스 연동 회원 관리 실습</h2>
	<hr>
</div>

<div>
	<form action="memberInsert04.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
					<span class="msg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="tel" id="userTel" name="userTel">
				</td>
			</tr>
			<tr>
				<th></th>
				<td> 
					<button type="submit" class="btn">회원 추가</button>
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	<div>
		<!-- 번호 이름 전화번호 -->
		<%=memberCount %>
		<%=str %>
	</div>
</div>

</body>
</html>