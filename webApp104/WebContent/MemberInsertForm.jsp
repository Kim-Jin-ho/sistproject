<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberInsertForm.jsp
	
	
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
			
			
		if(tel.value =="")
		{
			telMsg.style.display="inline";
			tel.focus();
			return false;
		}
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
   <h2>회원 관리 - 가입 페이지</h2>      
   <a href="MemberSelect.jsp"><button type="button" class='activeControl'>회원 명단 관리</button></a>
   <hr>
</div>
<div>
	<form action="MemberInsert.jsp" method="post" id="memberForm">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" id="uName" Name="uName"class="memberTxt">
				<span id="uNameMsg" class="errMsg">이름을 입력해주세요.</span>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" id="tel" Name="tel" class="memberTxt">
				<span id="telMsg" class="errMsg">전화번호를 입력해주세요.</span>
			</tr>
		</table>
		<br>
		<a href="javascript:memberSubmit();"><button type="button" class="activeControl2">가입하기</button></a>
		<a href="javascript:memberReset();"><button type="button" class="activeControl2">취소</button></a>
		<a href="MemberSelect.jsp"><button type="button" class='activeControl2'>목록으로</button></a>
	</form>
</div>
</body>
</html>