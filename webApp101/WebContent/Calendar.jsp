<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 달력 객체 생성
	Calendar cal = Calendar.getInstance();

	// 오늘 날짜 확인
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DATE);
	
	//-------------------------------------------- 현재 년, 월, 일 종합
	
	// 클라이언트에 의해 넘어온 데이터 처리
	request.setCharacterEncoding("UTF-8");
	
	
	
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	// 표시할 달력의 년, 월
	int year = nowYear;
	int month = nowMonth;
		
	
	// 사용자가 요청한 특정 년, 월이 존재할 경우
	// 그값으로 표시할 달력의 년, 월을 구성(표현)
	if(strYear != null)
		year = Integer.parseInt(strYear);
	if(strMonth != null)
		month = Integer.parseInt(strMonth);
		
	// ◀
	int preYear = year;
	int preMonth = month-1;
	
	if (preMonth<1)
	{
		preYear = year-1;
		preMonth = 12;
	}
	
	// ▶
	int nextYear = year;
	int nextMonth = month+1;
	
	if(nextMonth>12)
	{
		nextYear = year +1;
		nextMonth = 1;
	}
			
	// 표시할 달력 세팅
	cal.set(year, month-1, 1);
	
	int startDay =1;
	
	// year 년 month 월의 마지막 날짜 확인
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	// year 년 month 월의 1일의 요일 확인
	int week = cal.get(Calendar.DAY_OF_WEEK);
	
	// week = 1 -> 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table, td
{
	text-shadow: black;
	border: 1 solid gray;
	border-radius: 4px;
}

table th
{
	text-shadow: black;
	border: 1 solid gray;
	border-radius: 4px;
	font-size : 18px;
	color : black;
	font-family: 맑은 고딕;
	font-weight: bold;
}
body
{
	font-size: 18px;
	color: #343;
	font-family: 맑은 고딕;
	font-weight: bold;
}
a{ text-decoration: none; color: hot pink}
</style>
</head>
<body>
<div>
	<h2> ○ JSP 를 이용한 달력 실습(a 태그 활용)</h2>
	<hr>
</div>

<div>
	<table style="text-align: center;">
		<tr>
			<td style="font-size: 15pt;" align="center">
			<a href="Calendar.jsp?year=<%=preYear%>&month=<%=preMonth%>">◀</a>
			<b>&nbsp;&nbsp;<%=year %>년 &nbsp;&nbsp;<%=month %>월</b>
			<a href="Calendar.jsp?year=<%=nextYear%>&month=<%=nextMonth%>">▶</a>
			</td>
		</tr>
	</table>
	<br>
	<!-- 마지막 날짜 확인 테스트 -->
	<%--  <%=endDay %>  --%>
	<table border="1" style="border-style:solid; border-color:white; text-align: center;">
		<tr>
			<th bgcolor="#e6e4e6" style=" color: red">일</th>
			<th bgcolor="#e6e4e6">월</th>
			<th bgcolor="#e6e4e6">화</th>
			<th bgcolor="#e6e4e6">수</th>
			<th bgcolor="#e6e4e6">목</th>
			<th bgcolor="#e6e4e6">금</th>
			<th bgcolor="#e6e4e6" style=" color: blue">토</th>
		</tr>
		<%-- 현재 년월일 테스트 --%>
		<%--
		<%=nowDay %>
		<%=nowYear %>
		<%=nowMonth %>
		 --%>
		<%
			out.print("<tr>");
			int newLine = 0;
			//1일이 어느 요일에서 시작하느냐에 따른 빈칸 삽입
			for(int i=1; i<week; i++)
			{
			    out.print("<td bgcolor='#ffffff'>&nbsp;</td>");
			    newLine++;
			}
			
			String fontColor;
			String bgColor;
			
			// 날짜 출력
			for(int i=1; i<=endDay; i++)
			{
				fontColor = (newLine == 0)?"red":(newLine==6)?"blue":"#000000";
				bgColor = (nowYear==year)&&(nowMonth==month)&&(nowDay==i)?"#e6e6e6":"#ffffff";
				
				// 1 ~ 31 까지 출력 부분
				out.print("<td bgcolor="+ bgColor + "><font color=" + fontColor +" >" + i + "</font></td>");
				
				// 계행을 시켜주기 위해 newLine 값 증가
				newLine++;
				
				// newLine 이 7이거나 끝나는 날이 아닐경우
				// 계행을 시키자!
				if(newLine == 7 && i != endDay)
				{
				    out.print("</tr>");
				    out.print("<tr>");
				    newLine = 0;
				}
			}
			
			// 뒷부분 공백 추가
			// newLine이 0보다 크면서 7보다 작을경우
			// 공백 추가
		 	while(newLine>0 && newLine<7)
			{
				out.print("<td>&nbsp;</td>");
				newLine++;    
			}
			out.print("</tr>");
		%>
	</table>
</div>

</body>
</html>