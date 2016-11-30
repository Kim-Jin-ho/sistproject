<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%!
	// 스케쥴 함수(메소드) 선언
	// 스케쥴 양은 임의로 내가 만들기
	// 함수는 선언부에 정의 해야함 
	// 스크립트 릿에 정의하면 메소드 안에 메소드를 정의하는 것과 같으므로
	// 선언부에 정의하여야 한다.
	int mySchedule(int lyear, int lmonth, int lday)
	{
		int result = 0;
		
		if(lyear== 2016 && lmonth== 3&& lday== 22)
			result = 4;
		if(lyear== 2016 && lmonth== 3&& lday== 15)
			result = 1; 
		if(lyear== 2016 && lmonth== 3&& lday== 6)
			result = 2;
		return result;
	}
%>
<%
	request.setCharacterEncoding("UTF-8");

	// 달력 객체 생성
	Calendar cal = Calendar.getInstance();
	
	//오늘 날짜 변수 선언 및 담기
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	
	// 공휴일을 구분하기 위한 변수
	int nowDay = cal.get(Calendar.DATE);
	
	// 사용자로부터 변경될 날짜 변수에 담기
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	//현재 날짜를 표현하기 위한 변수에 오늘 날짜 담기
	int year = nowYear;
	int month = nowMonth;
	
	// 사용자가 변경한 값이 있을경우 조건문을 통하여 그값 변수에 담기
	if(strYear != null)
		year = Integer.parseInt(strYear);
	if(strMonth != null)
		month = Integer.parseInt(strMonth);
			
	
	// 출력할 년 월 일 설정하기
	cal.set(year,month-1, 1);
	
	// 해당월의 마지막 날짜 구하기
	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	// 1 ~ 7 일 구하기
	int week = cal.get(Calendar.DAY_OF_WEEK);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<style type="text/css">
table{ 	height: 220px;
border-style: outset; color: green}
th{ background-color: #008ae6;}
td{ text-align: right; background-color: #e6f5ff;}
#title0{color: red;}
#title6{color: blue;}
th
{
	width: 65px;
}
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
select
{
	font-size: 18px;
   color: #343;
   font-family: 맑은 고딕;
   font-weight: bold;
}

</style>
<script type="text/javascript">

	function sendForm(obj)
	{
		obj.submit();
	}
	
</script>
</head>
<body>
<div>
	<h2>달력 처리 및 일정</h2>
	<hr>
</div>
<!-- 
	○ 문제 (데이터 송수신 실습)
	 - 달력을 출력하는 JSP 페이지를 구성한다.
	 - 년도와 월을 입력 받아 화면에 출력해주는 형태의 페이지로 구성한다.
	 - 단, submit 버튼없이 이벤트 처리를 한다.
	 - 전송한 내용을 수신해서 출력해누는 혀 ㅇ테의 페이지로 구현한다.
	 - 년도 구성은 현재 년도 기준 이전 10년 이후 10년 구성한다.
	 - (추가) 선택한 년독다 변경될 경우 해당 년도 기준 이전 10년 기준 10년으로 구성한다.
	 - 월은 1월 12월 까지로 구성한다.
	 - (추가) 일정이 추가되었을 때 해당 날짜 영역에
	          추가된 일정 의 갯수를 표현할 수 있도록한다.
	          단, 일정은 고정된 값으로 지정해줄 수 있도록 처리한다.
	          -> 함수를 만들어서 호출해라
	          ex) 함수명(2016, 3, 29) -> 2016년 3월 29일에 일정 갯수 2개 추가
	              mySchedule
	              등록된 스케줄에 댛란 갯수 확인하는 정도
	              
		[2016 ▼]년 [3 ▼]월
		
		---------------------------------------------
		|		|			|			|			|
		|		|			|			|			|
		|_______|___________|__________	|___________|
	
	 - 최초 요청 주소는 『httl://localhost:8090/webApp102/SendAndReceive07.jsp』로 한다.
	 - 결과 페이지는 『httl://localhost:8090/webApp102/SendAndReceive07.jsp』로 한다.
	 
	 // SendAndReceive07.jsp 
 -->
 
 <form method="post">
          <!-- Year(년도) select 구성 -->
          <!-- select 값이 바뀐다면, 그 값을 sendForm 함수를 통해
               submit 시켜서 변경된 값을 가지고 Calendar2.jsp 페이지를
               요청한다. -->
         <select name="year" onchange="sendForm(this.form)">
               <!-- select 문 안에 조건문을 통하여
                   선택된 year 값을 기준으로 -10 하는 반복문 작성 -->
                 <%for(int i=year-10; i<year; i++) { %>
               <option value="<%=i%>" > <%=i%>년</option>
               <%} %>
               <!-- 반복문을 거친 값 option value에 추가 -->
               <option value="<%=year%>" selected="selected"><%=year%>년</option>
               
               <!-- select 문 안에 조건문을 통하여 선택된 year 값을 기준으로
                    +10 를 option 에 추가하는 과정 -->
               <%for(int i=year+1; i<=year+10; i++) { %>
               <option value="<%=i%>" > <%=i%>년</option>
               <%} %>
         </select>
          <!-- select 값이 바뀐다면, 그 값을 sendForm 함수를 통해
               submit 시켜서 변경된 값을 가지고 Calendar2.jsp 페이지를
               요청한다. -->
         <!-- month(월) select 구성 -->
         <select name="month" onchange="sendForm(this.form)">
            <% for(int i=1; i<=12; i++) 
            { %>
               <option value="<%=i%>" <%=month==i?"selected='selected'":"" %>> <%=i%>월 </option>
            <%} %>
         </select>
         <br><br>
    </form>
    
	<!-- 날짜 출력 작성 부분 -->
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
      	
		//테스트 확인      
        //out.print(year);
      	//out.print(month);
      	//out.print(nowDay);
      	//int rs =  mySchedule(year, month, i);
      	//out.print(rs);
      	
      	// 한줄 계행
        out.print("<tr>");
      	
      	int newLine = 0;
        //1일이 어느 요일에서 시작하느냐에 따른 빈칸 삽입
        for(int i=1; i<week; i++)
        {
            out.print("<td bgcolor='#ffffff'>&nbsp;</td>");
            newLine++;
        }
        
        // 공휴일(토,일)에 색상을 넣어주기 위한 
        // 변수 선언
        String fontColor;
        String bgColor;
        String scColor;
        // 날짜 출력
        for(int i=1; i<=lastDay; i++)
        {
         
        	// 선언한 스케쥴 함수에 현재 년 월 일 값 넘겨 주기
        	int rrt = mySchedule(year, month, i);
        
        	// 공휴일(토,일) 에 따른 폰트 색상 주기 
       		fontColor = (newLine == 0)?"red":(newLine==6)?"blue":"#000000";
       	    bgColor = (nowYear==year)&&(nowMonth==month)&&(nowDay==i)?"#e6e6e6":"#ffffff";
	        // 1 ~ 31 까지 출력 부분
			
           
			// 스케쥴 함수로부터 넘겨 받은 값이 0이 아닐경우 <td> 안에 추가할 
			// 내용 out.print 로 출력하기
			if(rrt != 0)
			{
				out.print("<td bgcolor="+ bgColor + "><font color=" + fontColor +" >");
				out.print("[" + rrt +"]<a href='SendAndReceive07.jsp'>");		// 출력하면서 <a> 태그 추가하기
				out.print( i + "</font></td></a>");
			}
			else
			{
				out.print("<td bgcolor="+ bgColor + "><font color=" + fontColor +" >");
				out.print( i + "</font></td></a>");
			}
			// 계행을 시켜주기 위해 newLine 값 증가
			newLine++;
			
			// newLine 이 7이거나 끝나는 날이 아닐경우
			// 계행을 시키자!
			if(newLine == 7 && i != lastDay)
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
</body>
</html>