<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   // 클라이언트에 의해 넘어온 데이터 처리
   request.setCharacterEncoding("UTF-8");

   // 달력 객체 생성
   Calendar cal = Calendar.getInstance();
   
   // 오늘 날짜 확인 및 변수 선언
   int nowYear = cal.get(Calendar.YEAR);
   int nowMonth = cal.get(Calendar.MONTH)+1;
   int day = cal.get(Calendar.DATE);
   
   // 사용자로부터 변경될 같을 받아내기 위한 변수
   String strYear = request.getParameter("year");
   String strMonth= request.getParameter("month");
   
   // 현재 날을 표시하기 위한 변수
   int year = nowYear;
   int month = nowMonth;
   
   // 사용자가 요 청한 특정 년, 월이 존재할 경우
   // 그 값으로 표시할 년 월을 구성
   if(strYear != null)
      year = Integer.parseInt(strYear);
   if(strMonth != null)
      month= Integer.parseInt(strMonth);
   
   // 출력할 년도, 월로 설정
   cal.set(year,month-1, 1);
   
   // 해당 월의 마지막 날짜
   int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
   // 1 ~ 7 (일 ~ 토요일 까지)
   int week = cal.get(Calendar.DAY_OF_WEEK);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 과제</title>
<style type="text/css">
* {padding: 0px; margin: 0px;}
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
a{ text-decoration: none; color: hotpink}
</style>
<script type="text/javascript">
	
	//  submit 시키기.
	function sendForm()
	{
		var f = document.forms[0];
		f.submit();
	}
	   
</script>
</head>
<body>
<!-- 
   ○ 문제(스크립트 릿/ 표현식 테스트)
    - 년, 월을 select 태그를 이용하여 선택할 수 있도록 페이지를 구성한다.
     - 년도는 선택한 년도를 기준으로 앞뒤로 5년씩만 가능하도록 출력하고
     - 월은 1월에서 12월 까지 출력할 수 있도록 한다.
       2011             1
        :            :
     [ 2016 ]▼년    [  3  ]▼월
       2017             4
        :            :
       2021            12
 -->
 <div>
    <h2> ○ JSP 를 이용한 달력 실습(Select 활용)</h2><br>
   <hr>
   <br>
 </div>
 <div>
    <table>
       <tr>
       <td>
       <!-- 변경된 년도와 월을 보고싶으면 method 에서
            get 방식으로 전송하면된다. -->
       <form action="Calendar2.jsp" method="post">
          <!-- Year(년도) select 구성 -->
          <!-- select 값이 바뀐다면, 그 값을 sendForm 함수를 통해
               submit 시켜서 변경된 값을 가지고 Calendar2.jsp 페이지를
               요청한다. -->
         <select name="year" onchange="sendForm()">
               <!-- select 문 안에 조건문을 통하여
                   선택된 year 값을 기준으로 -5 하는 반복문 작성 -->
                 <%for(int i=year-5; i<year; i++) { %>
               <option value="<%=i%>" > <%=i%>년</option>
               <%} %>
               <!-- 반복문을 거친 값 option value에 추가 -->
               <option value="<%=year%>" selected="selected"><%=year%>년</option>
               
               <!-- select 문 안에 조건문을 통하여 선택된 year 값을 기준으로
                    +5 를 option 에 추가하는 과정-->
               <%for(int i=year+1; i<=year+5; i++) { %>
               <option value="<%=i%>" > <%=i%>년</option>
               <%} %>
         </select>
          <!-- select 값이 바뀐다면, 그 값을 sendForm 함수를 통해
               submit 시켜서 변경된 값을 가지고 Calendar2.jsp 페이지를
               요청한다. -->
         <!-- month(월) select 구성 -->
         <select name="month" onchange="sendForm()">
            <% for(int i=1; i<=12; i++) 
            { %>
               <option value="<%=i%>" <%=month==i?"selected='selected'":"" %>> <%=i%>월 </option>
            <%} %>
         </select>
      </form>
      </td>
       </tr>
    </table>
    
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
            bgColor = (nowYear==year)&&(nowMonth==month)&&(day==i)?"#e6e6e6":"#ffffff";
            
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