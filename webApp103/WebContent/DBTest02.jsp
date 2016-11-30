<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="class3.com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String str = "";

	//데이터베이스 연결
	try
	{
		// 데이터베이스 연결
		Connection conn = DBConn.getConnection();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		// 작업 객체
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		
		// 결과 ResultSet에 대한 처리 -> 반복문 구성
		str += "<table border='1' style='border-style:solid; border-color:white;'><tr><th>번호</th><th>이름</th><th>전화번호</th></tr>";
		while(rs.next())
		{
			str += "<tr>";
			str += "<td align='center'>" +rs.getString("SID") + "</td>";
			str += "<td align='center'>" +rs.getString("NAME") + "</td>";
			str += "<td align='center'>" +rs.getString("TEL") + "</td>";
			str += "</tr>";
		}
		str += "</table>";
		
		rs.close();
		stmt.close();
		DBConn.close();
		
	}catch(Exception e)
	{
		str = e.toString();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css">
<style type="text/css">
	input{ width:200px;}
	.msg{ color: red; font-size: smal; display: none;}
	body{ width: 500px;}
</style>
<script type="text/javascript">
	
	function formCheck()
	{
		var name = document.getElementById("userName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display="none";
		
		if(name.value =="")
		{
			nameMsg.style.display="inline";
			alert("이름을 입력해주세요.");
			return false;
		}
		return true;
	}
	
</script>
</head>
<body>
<div>
	<h2>데이터베이스 연결 및 데이터 입력</h2>
	<hr>
</div>
<div align="left">
	<form action="memberInsert02.jsp" method="post" onsubmit="return formCheck();">
		<table border="1" style="border-style:solid; border-color:white;" >
			<tr>
				<td>이름(*)</td>
				<td align="left">
						<input type="text" id="userName" name="userName">
						<span class="msg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<input type="tel" id="userTel" name="userTel">
				</td>
			</tr>
		</table>
		<br>
		<div align="left">
			<button type="submit" id="btnAdd">데이터 추가</button>
		</div>
	</form>
	<br><br>
	<div>
		<%=str %>
	</div>
</div>
</body>
</html>