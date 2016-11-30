<%@page import="class3.com.test.MemberScoreDTO"%>
<%@page import="class3.com.test.MemberScoreDAO"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%

	StringBuffer str = new StringBuffer();

	MemberScoreDAO dao = new MemberScoreDAO();
	
	try{
		
		// 데이터베이스 연결
		dao.Connection();
		
		str.append("<table>");
	      str.append("<tr>");
	      str.append("<th>번호</th>");
	      str.append("<th>이름</th>");
	      str.append("<th>국어점수</th>");
	      str.append("<th>영어점수</th>");
	      str.append("<th>수학점수</th>");
	      str.append("<th>총점</th>");
	      str.append("<th>평균</th>");
	      str.append("<th>석차</th>");
	      str.append("<th>성적처리</th>");
	      str.append("</tr>");
	      
	      for(MemberScoreDTO score : dao.lists())
	      {
	         str.append("<tr>");
	         str.append("<td>"+score.getSid()+"</td>");
	         str.append("<td>"+score.getName()+"</td>");
	         str.append("<td>"+score.getKor()+"</td>");
	         str.append("<td>"+score.getEng()+"</td>");
	         str.append("<td>"+score.getMat()+"</td>");
	         str.append("<td>"+score.getTot()+"</td>");
	         str.append("<td>"+String.format("%.1f", score.getAvg())+"</td>");
	         str.append("<td>"+score.getRank()+"</td>");
	         
	         /* 성적 처리 항목 (입력, 수정, 삭제) */
	         if (score.getKor()==0 && score.getEng()==0 && score.getMat()==0)
	         {
	            str.append("<td>");
	            str.append("<a href='MemberScoreInsertForm.jsp?sid="+score.getSid()+"'><button type='button' class='activeControl'>입력</button></a>");
	            str.append("<button type='button' class='noneControl' disabled='disabled'>수정</button>");
	            str.append("<button type='button' class='noneControl' disabled='disabled'>삭제</button>");
	            str.append("</td>");
	            
	         }
	         else
	         {
	            str.append("<td>");
	            str.append("<button type='button' class='noneControl' disabled='disabled'>입력</button>");
	            str.append("<a href='MemberScoreUpdateForm.jsp?sid="+score.getSid()+"'><button type='button' class='activeControl'>수정</button></a>");
	            str.append("<a href='javascript:memberScoreDelete("+score.getSid()+",\""+score.getName()+"\");'><button type='button' class='activeControl'>삭제</button></a>");
	            str.append("</td>");
	            
	         }
	         str.append("</tr>");
	      }
	      str.append("</table>");
	}catch(Exception e)
	{
		System.out.println(e.toString());
	}finally
	{
		try
		{
			dao.close();
		}catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreSelect.jsp</title>
<link rel="stylesheet" href="css/memberMin.css"> 
<script type="text/javascript">
	
	function memberScoreDelete(sid, name)
	{
		//alert("삭제할꺼니?");
		// 테스트
		//alert(sid+" "+name);
		var res = confirm("번호 : " + sid + ", 이름 : "+ name +"\n이 학생의 정보를 삭제하시겠습니까?");
		//alert(res);
		
		if(res)
			window.location.href="MemberScoreDelete.jsp?sid="+sid;
	}
</script>
</head>
<body>

<div>
	<h2>회원 성적 관리 - 출력 페이지</h2>
	<a href="MemberSelect.jsp"><button type="button" class="activeControl">회원 명단 관리</button></a>
	<hr>
</div>

<div>
	<%=str %>
</div>


</body>
</html>