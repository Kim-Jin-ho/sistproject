<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="class3.com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String str = "";
	try
	{
		// 데이터 베이스 연결
		Connection conn = DBConn.getConnection();
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 작성
		String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, TRUNC((KOR+ENG+MAT)/3,1) AS AVG, RANK() OVER (ORDER BY (KOR+ENG+MAT)/3 DESC) AS RANK FROM TBL_SCORE";
		ResultSet rs = stmt.executeQuery(sql);
		
		str += "<table border='1' style='border-style:solid; border-color:white;'><tr><td align='center'>학생번호</td><td align='center'>이름</td><td align='center'>국어점수</td><td align='center'>영어점수</td><td align='center'>수학점수</td><td align='center'>총점</td><td align='center'>평균</td><td align='center'>석차</td></tr>";
		
		while(rs.next())
		{
			str += "<tr>";
			str += "<td align='right'>"+rs.getString("SID")+"</td>";
			str += "<td align='center'>"+rs.getString("NAME")+"</td>";
			str += "<td align='right'>"+rs.getString("KOR")+"</td>";
			str += "<td align='right'>"+rs.getString("ENG")+"</td>";
			str += "<td align='right'>"+rs.getString("MAT")+"</td>";
			str += "<td align='right'>"+rs.getString("TOT")+"</td>";
			str += "<td align='right'>"+rs.getString("AVG")+"</td>";
			str += "<td align='right'>"+rs.getString("RANK")+"</td>";
			str += "</tr>";
		}
		str+="</table>";
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
<title>DBTest03.jsp</title>
<link rel="stylesheet" href="css/main.css">
<style type="text/css">
	input{ width:200px;}
	.msg{ color: red; font-size: smal; display: none;}
	body{ width: 530px;}
</style>
<script type="text/javascript">
	function formCheck()
	{
		var userName = document.getElementById("userName");
		var userKor = document.getElementById("userKor");
		var userEng = document.getElementById("userEng");
		var userMat = document.getElementById("userMat");
		
		var nameMsg = document.getElementById("nameMsg");
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		nameMsg.style.display= "none";
		korMsg.style.display= "none";
		engMsg.style.display= "none";
		matMsg.style.display= "none";
		
		if(userName.value == "")
		{
			nameMsg.style.display="inline";
			userName.focus();
			return false;
		}
		
		if(userKor.value==""|| isNaN(userKor.value) || Number(userKor.value)<0 || Number(userKor.value)>100)
		{
			korMsg.style.display="inline";
			userKor.focus();
			return false;
		}
		
		if(userEng.value==""|| isNaN(userEng.value) || Number(userEng.value)<0 || Number(userEng.value)>100)
		{
			engMsg.style.display="inline";
			userEng.focus();
			return false;
		}
		
		if(userMat.value==""|| isNaN(userMat.value) || Number(userMat.value)<0 || Number(userMat.value)>100)
		{
			matMsg.style.display="inline";
			userMat.focus();
			return false;
		}
		
		
		return true;
	}
</script>
</head>
<body>
<!-- 
	이름 국어 영어 수학
	
	출력
	이름 국어 영어 수학 총점 평균 석차
 -->
 <div>
 	<h2>성적 출력</h2>
 	<hr>
 </div>
 
 <div>
 	<form action="memberInsert03.jsp" method="post" onsubmit="return formCheck();">
		<table>
			<tr>
				<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
				<td align="right">이름</td>
				<td><input type="text" name="userName" id="userName" style="width: 100px;">
				<span class="msg" id="nameMsg">이름을 입력하세요.</span>
				</td>
			</tr>
		</table>
		<hr>
		<table>
			<tr>
				<td align="left">국어점수</td>
				<td align="left">
				<input type="text" name="userKor" id="userKor" style="width:100px;">
				<span class="msg" id="korMsg">0 ~ 100점 사이 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
			<td align="left">영어점수</td>
				<td align="left"><input type="text" name="userEng" id="userEng" style="width:100px;">
					<span class="msg" id="engMsg">0 ~ 100점 사이 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
			<td align="left">수학점수</td>
				<td align="left"><input type="text" name="userMat" id="userMat" style="width:100px;">
					<span class="msg" id="matMsg">0 ~ 100점 사이 점수를 입력하세요.</span>
				</td>
			</tr>
		</table> 
	<div align="left">
		<br>
		<button type="submit" id="btnAdd">성적 입력</button>
	</div>
 	</form>
 </div>
<hr>
 <div>
 <%=str %>
 </div>
</body>
</html>