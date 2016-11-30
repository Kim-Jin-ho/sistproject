<%@page import="class3.com.test.MemberVO"%>
<%@page import="class3.com.test.MemberDAO"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();

	MemberDAO dao = new MemberDAO();
	try
	{
		// 데이터 베이스연결
		dao.Connection();
		
		// 회원 출력
		str.append("<table>");
		str.append("<tr>");
		str.append("<th>번호</th>");
		str.append("<th>이름</th>");
		str.append("<th>전화번호</th>");
		str.append("</tr>");		
		
		// 회원 조회를 위해 향상된 for 문을 통하여
		// 조회된 값 받아와 출력하기
		for(MemberVO member : dao.lists())
		{
			str.append("<tr>");
			str.append("<td style='text-align: center;'>"+ member.getSid() + "</td>");
			str.append("<td style='text-align: center; width:100px;'>"+ member.getName() + "</td>");
			str.append("<td style='text-align: center; width:200px;'>"+ member.getTel() + "</td>");
			str.append("<td>");
			str.append("<a href='MemberUpdateForm.jsp?sid="+member.getSid()+"'>");
			str.append("<button type='button' class='activeControl'>수정</button></a>");
			str.append("<a href='javascript:memberDelete("+member.getSid()+",\""+member.getName()+"\");'>");
			str.append("<button type='button' class='activeControl'>삭제</button></a>");
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
<title>MemberSelect.jsp</title>
<link rel="stylesheet" href="css/memberMin.css"> 
<script type="text/javascript">
	function memberDelete(sid, name)
	{
		// 테스트
		//alert(sid+" "+name);
		
		var res = confirm("번호 : " + sid + ", 이름 : "+ name +"\n이 학생의 정보를 삭제하시겠습니까?");

		if(res)
			window.location.href="MemberDelete.jsp?sid="+sid;
	}
</script>
</head>
<body>
<div>
	<h2>회원 관리 - 출력 페이지</h2>
	<a href="MemberScoreSelect.jsp"><button type="button" class="activeControl">회원 성적 관리</button></a>
	<a href='MemberInsertForm.jsp'><button type='button' class='activeControl'>학생입력</button></a>
	<hr>
</div>

<div>
	<%=str %>
</div>
</body>
</html>
