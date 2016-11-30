<%@page import="class3.com.test.MemberVO"%>
<%@page import="class3.com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	//MemberUpdateForm
	// 사용자로부터 수정할 회원의 sid 정보 받아오기
	String sid = request.getParameter("sid");
	String uName = "";
	String tel = "";
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		//데이터베이스 연결
		dao.Connection();
		// 사용자에게 sid 에 대한 정보를
		// 보여주기 위해서 search 하여 이름과 전화번호 정보 받아오기
		MemberVO member = dao.search(sid);
		uName = member.getName();
		tel = member.getTel();
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/memberMin.css">
<script type="text/javascript">
	
	function memberSubmit()
	{
		var memberForm = document.getElementById("memberForm");
		
		var uName = document.getElementById("uName");
		var tel  = document.getElementById("tel");
		
		var uNameMsg = document.getElementById("uNameMsg");
		var telMsg = document.getElementById("telMsg");
		
		uNameMsg.style.display ="none";
		telMsg.style.display ="none";
		
		if(uName.value =="")
		{
			uNameMsg.style.display="inline";
			uName.focus();
			return false;
		}
		/* 			
		if(tel.value =="")
		{
			telMsg.style.display="inline";
			tel.focus();
			return false;
		}
		*/
		memberForm.submit(); 			
	}
	
	function memberReset()
	{
		var memberForm = document.getElementById("memberForm");
		memberForm.reset();
	}
</script>
</head>
<body>
<div>
	<h2>회원 관리 - 수정 페이지</h2>
	<a href="MemberSelect.jsp"><button type="button" class="activeControl">회원 명단 관리</button></a>
	<hr>
</div>
<div>
	<form action="MemberUpdate.jsp?sid=<%=sid %>" method="post" id="memberForm">
	
		<table>
			<tr>
				<th>번호</th>
				<td style="text-align: center; background-color: gray"><%=sid %></td>
			</tr>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" style="text-align: right;" id="uName" Name="uName" class="memberTxt" value="<%=uName %>">
					<span id="uNameMsg" class="errMsg">이름을 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" style="text-align: right;" id="tel" Name="tel" class="memberTxt" value="<%=tel %>">
					<span id="telMsg" class="errMsg">전화번호를 입력해주세요.</span>
				</td>
			</tr>
		</table>
		 <br><br>
      <a href="javascript:memberSubmit()"><button type="button" class='activeControl2'>수정하기</button></a>
      <a href="javascript:memberReset()"><button type="button" class='activeControl2'>취소하기</button></a>
      <a href="MemberSelect.jsp"><button type="button" class='activeControl2'>목록으로</button></a>
	</form>
</div>
</body>
</html>