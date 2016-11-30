<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신 후 처리 부분
	//-- (현재 자기 자신 페이지로부터 넘어온 데이타 다시 수신하기)
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	
	// 현재 날짜 확인------------------------------------------------
	Calendar cal = Calendar.getInstance();		//-- 달력 객체 생성
	int nowYear = cal.get(Calendar.YEAR);		//-- 년 정보 얻어오기
	int nowMonth = cal.get(Calendar.MONTH)+1;	//-- 월 정보 얻어오기
	int day = cal.get(Calendar.DATE);
	//--------------------------------------------------현재 날짜 확인
	// 확인한 날짜로 년도 select 의 option 구성-----------------------
	// <option value="2006">2006</option>
	// <option value="2006">2006</option>
	//					:
	// <option value="2016">2006</option>
	//					:	
	// <option value="2025">2006</option>
	// <option value="2026">2006</option>
	String yOptions= "";
	for(int year=(nowYear-10); year<=(nowYear+10); year++)
	{
		// 상황 1. 페이지 최초 요청 (sYear 은 null에서 현재 년도와 옵션값이 같을 때) 
		
		// 상황 2. 페이지 최초 요청 아님 (sYear 은 null 아님 선택된 년도와 옵션값이 같을 때)
		
		// 상황 3. 나머지
		
		if(sYear==null && nowYear==year)
			yOptions += "<option value='"+year+"' selected='selected'>"+year+"</option>";
		else if(sYear != null && Integer.parseInt(sYear) ==year)
			yOptions += "<option value='"+year+"' selected='selected'>"+year+"</option>";
		else	
			yOptions += "<option value='"+year+"'>"+year+"</option>";
	}
	//------------------------ 확인한 날짜로 년도 select 의 option 구성 
	
	// 중간 테스트
	
	// 확인한 날짜로 월 select 의 option 구성-------------------------
	// <option value="1">1</option>
	// <option value="2">2</option>
	//					:
	// <option value="3">3</option>
	//					:	
	// <option value="11">11</option>
	// <option value="12">12</option>
	
	String mOptions="";
	for(int month=1; month<=12; month++)
	{
		if(sMonth==null && nowMonth==month)
			mOptions += "<option value='"+month+"'  selected='selected'>"+month+"</option>";
		else if(sMonth != null && Integer.parseInt(sMonth) ==month)
			mOptions += "<option value='"+month+"'  selected='selected'>"+month+"</option>";
		else	
			mOptions += "<option value='"+month+"'>"+month+"</option>";
	}
	//-------------------------- 확인한 날짜로 월 select 의 option 구성
	
	// 달력 그리기-----------------------------------------------------
	String result = "";
	int total = 0;
	int days = 0;
	if (sYear != null && sMonth !=null)
	{
		// 입력한 년 월 확인
		int year = Integer.parseInt(sYear);
		int month = Integer.parseInt(sMonth);
		
		// 1단계 1년 1월 1일 부터 입력 이전 년도 12월 31일 까지의 총 날 수 
		total = (year-1)*365 + (year-1)/4 - (year-1)/100 + (year-1)/400;
		
		// 2단계. 해당 년 1월 1일 부터 해당 월 1일 까지의 총 날 수 누적
		int[] m = {31,28,31,30,31,30,31,31,30,31,30,31};
		for(int i =0; i<month-1; i++)
		{
			total+= m[i];
		}
		total++;
		
		// 3단계. 해당 년의 2월에 대한 날 수 계산이 포함되어야 할 상황이라면
		// 윤년, 평년 여부 확인
		if (month >=3 && (year%4==0 && year%100 !=0 || year%400==0))
			total++;
		
		// 4단계 해당 년 해당 월의 첫날(1일) 의 요일 확인
		days = total % 7;
		
		// 5단계. 해당년 해당 월의 마지막 날짜 확인
		int lastDay = m[month-1];
		if(month==2 && (year%4==0 && year%100!=0 || year%400==0))
			lastDay = 29;
		
		// 6단계 해당 년 해당 월에 맞는 달력 출력(그리기)
		result += "<table border='1' style='border-style:solid; border-color:white; text-align: center;'><tr>";
		
		// 6-1단계 요일의 이름 출력
		String[] dayName = {"일","월","화","수","목","금","토"};
		
		for(int i =0; i<dayName.length; i++)
		{
			result += "<th style='width:300px;' id='title"+i+"'>"+dayName[i]+"</th>";
		}
		result +="</tr>";
		
		// 6-2단계 1일 앞쪽에 빈 칸 <td> 구성
		result +="<tr>";
		for(int i =0; i<days; i++)
			result +="<td></td>";
			
		// 6-3 단계 해당 월의 1일 부터 끝날 날까지 채우는 구성
		int d;
		for(d=1; d<=lastDay; d++)
		{
			result +="<td>"+d+"</td>";
			if(d != lastDay && (d+days)%7==0)
				result += "</tr><tr>";
			else if((d+day%7)==0)
				result += "</tr>";
		}
		
		//6-4 단계, 마지막 빈 칸 <td> 구성
		if(  ((d-1)+days)%7 != 0  )
		{
			for(int i=0; i<7; i++,d++)
			{
				result += "<td></td>";
				if((d+days)%7==0)
					break;
			}
		}
		result +="</tr></table>";
	}
		
	//----------------------------------------------------- 달력 그리기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive06.jsp</title>
<link rel="stylesheet" href="css/main.css">
<style type="text/css">
table{ width:500px; height: 220px; border-style: outset; color: green}
th{ background-color: #008ae6;}
td{ text-align: right; background-color: #e6f5ff;}
#title0{color: red;}
#title6{color: blue;}
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
   color : white;
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
}
</style>
<script type="text/javascript">
	function calForm(obj)
	{
		obj.submit();
	}
</script>
</head>
<body>
<!-- 
	○ 문제 데이터 송수신 실습)
	 - 달력을 출력하는 JSP 페이지를 구성한다.
	 - 년도와 월을 입력 받아 화면에 출력해주는 형태의 페이지로 구성한다.
	 - 단, submit 버튼없이 이벤트 처리를 한다.
	 - 전송한 내용을 수신해서 출력해누는 혀 ㅇ테의 페이지로 구현한다.
	 - 년도 구성은 현재 년도 기준 이전 10년 이후 10년 구성한다.
	 - 월은 1월 12월 까지로 구성한다.
	 
		[2016 ▼]년 [3 ▼]월
	
	 - 최초 요청 주소는 『httl://localhost:8090/webApp102/SendAndReceive06.jsp』로 한다.
	 - 결과 페이지는 『httl://localhost:8090/webApp102/SendAndReceive06.jsp』로 한다.
	 
	 // SendAndReceive06.jsp 
 -->
<div>
	<h2>달력 요청 및 응답</h2>
	<hr>
</div> 
<div>
	<!-- form 태그의 action 송석을 생략하면
		 데이터의 수신처는 자기 자신이다/ -->
		 
	<form method="post">
		<%-- <h3><%=sYear%>년</h3><h3><%=sMonth %>월</h3> --%>
		<select name="year" id="year" onchange="calForm(this.form);">
		<!-- option 은 동적으로 구성 -->
		<%=yOptions %>
		</select> 년
		<select name="month" id="month" onchange="calForm(this.form);">
		<!-- option 은 동적으로 구성 -->
		<%=mOptions %>
		</select> 월
	</form>
</div>
<br>
<div>
	<%=result %>
</div>
</body>
</html>