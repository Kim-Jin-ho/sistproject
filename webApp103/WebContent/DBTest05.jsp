<%@page import="class3.com.test.ScoreDTO"%>
<%@page import="class3.com.test.ScoreDAO"%>
<%@page contentType="text/html; charset=UTF-8"%>

<%
	String cs = request.getContextPath();
%>
<%
	StringBuilder str = new StringBuilder();

	ScoreDAO dao = null;
	
	String memberCount = "<span id=\"memberCount\">전체 학생수 : ";
	try
	{
		dao = new ScoreDAO();
		memberCount += dao.count() + "</span>";
		
		str.append("<table border='1' style='border-style:solid;border-color:white;'><tr><td align='center'>학생번호</td><td align='center'>이름</td><td align='center'>국어점수</td><td align='center'>영어점수</td><td align='center'>수학점수</td><td align='center'>총점</td><td align='center'>평균</td><td align='center'>석차</td></tr>");
		
		for(ScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>" + score.getSid() + "</td>");
			str.append("<td>" + score.getName() + "</td>");
			str.append("<td>" + score.getKor() + "</td>");
			str.append("<td>" + score.getEng() + "</td>");
			str.append("<td>" + score.getMat() + "</td>");
			str.append("<td>" + score.getTot() + "</td>");
			str.append("<td>" + score.getAvg() + "</td>");
			str.append("<td>" + score.getRank() + "</td>");
		}
		str.append("</table>");
		
	}catch(Exception e)
	{
		System.out.print(e.toString());	
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
	body{ width: 530px;}
</style>
<script type="text/javascript">
	function windowOnload()
	{
		var name = document.getElementById("userName");
		name.focus();
	}
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
		
		var count = 0;
		for(var i = 1 ; i<= 4; i++)
		{
			if(userName.value == "")
			{
				nameMsg.style.display="inline";
				userName.focus();
				count++;
			}
			
			if(userKor.value==""|| isNaN(userKor.value) || Number(userKor.value)<0 || Number(userKor.value)>100)
			{
				korMsg.style.display="inline";
				userKor.focus();
				count++;
			}
			
			if(userEng.value==""|| isNaN(userEng.value) || Number(userEng.value)<0 || Number(userEng.value)>100)
			{
				engMsg.style.display="inline";
				userEng.focus();
				count++;
			}
			
			if(userMat.value==""|| isNaN(userMat.value) || Number(userMat.value)<0 || Number(userMat.value)>100)
			{
				matMsg.style.display="inline";
				userMat.focus();
				count++;
			}
		}
		
		if(count>0)
		{
			return false;
		}
				
		return true;
	}
</script>
</head>
<body onload="windowOnload()">
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
 	<form action="memberInsert05.jsp" method="post" onsubmit="return formCheck();">
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
 <%=memberCount %>
 <%=str %>
 </div>
</body>
</html>