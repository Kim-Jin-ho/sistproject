<%@page import="class3.com.test.MemberScoreDTO"%>
<%@page import="class3.com.test.MemberScoreDAO"%>
<%@ page  contentType="text/html; charset=UTF-8"%>

<%

	String sid = request.getParameter("sid");
	
	String name = "";
	int kor = 0;
	int eng = 0;
	int mat = 0;
	
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try{
		
		dao.Connection();
		MemberScoreDTO score = dao.search(sid);
		name = score.getName();
		kor = score.getKor();
		eng = score.getEng();
		mat = score.getMat();
		
	}catch(Exception e){
		
		System.out.println(e.toString());
		
	}finally{
		
		try{
			
			dao.close();
			
		}catch(Exception e){
			
			System.out.println(e.toString());
			
		}
		
	}
	
	
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreUpdateForm.jsp</title>
<script type="text/javascript">

function memberScoreSubmit() {
	
	var memberScoreForm = document.getElementById("memberScoreForm");
	
	var kor = document.getElementById("kor");
	var eng = document.getElementById("eng");
	var mat = document.getElementById("mat");
	
	var korMsg = document.getElementById("korMsg");
	var engMsg = document.getElementById("engMsg");
	var matMsg = document.getElementById("matMsg");

	korMsg.style.display = "none";
	engMsg.style.display = "none";
	matMsg.style.display = "none";
	
	if( kor.value=="" || isNaN(kor.value) || Number(kor.value)<0 || Number(kor.value)>100 ){
		
		korMsg.style.display = "inline";
		kor.focus();
		return false;
		 
	}
	
	if(eng.value=="" || isNaN(eng.value) || Number(eng.value)<0 || Number(eng.value)>100){
		
		engMsg.style.display = "inline";
		eng.focus();
		return false;
		
	}
	
	if(mat.value=="" || isNaN(mat.value) || Number(mat.value)<0 || Number(mat.value)>100){
		
		matMsg.style.display = "inline";
		mat.focus();
		return false;
		
	}
	
	
	memberScoreForm.submit();
	
}

function memberScoreReset() {
	
	var memberScoreForm = document.getElementById("memberScoreForm");
	memberScoreForm.reset();
	
}


</script>
<link rel="stylesheet" href="css/memberMin.css">
</head>
<body>

<div>
	<h2>회원 성적 관리 - 수정 페이지</h2>
	<a href="MemberSelect.jsp"><button type="button" class="activeControl">회원 명단 관리</button></a>
	<hr>
</div>

<div>
   <form action="MemberScoreUpdate.jsp?sid=<%=sid %>" method="post" id="memberScoreForm">
      <table>
         <tr>
            <th>번호</th>
            <td><%=sid %></td>
         <!--<td>2</td> -->
            
         </tr>
         
         <tr>
            <th>이름</th>
            <td><%=name %></td>
            
         </tr>
         
         <tr>
            <th>국어점수</th>
            <td>
               <input type="text" id="kor" name="kor" class="scoreTxt" value="<%=kor %>">
               <span id="korMsg" class="errMsg">1 ~ 100 사이의 정수를 입력해야 합니다.</span>
            </td>
         </tr>
         
         <tr>
            <th>영어점수</th>
            <td>
               <input type="text" id="eng" name="eng" class="scoreTxt" value="<%= eng %>">
               <span id="engMsg" class="errMsg">1 ~ 100 사이의 정수를 입력해야 합니다.</span>
            </td>
         </tr>
         
         <tr>
            <th>수학점수</th>
            <td>
               <input type="text" id="mat" name="mat" class="scoreTxt" value="<%= mat %>">
               <span id="matMsg" class="errMsg">1 ~ 100 사이의 정수를 입력해야 합니다.</span>
            </td>
         </tr>
      </table>   
      <br><br>
      <a href="javascript:memberScoreSubmit()"><button type="button" class='activeControl2'>수정하기</button></a>
      <a href="javascript:memberScoreReset()"><button type="button" class='activeControl2'>취소하기</button></a>
      <a href="MemberScoreSelect.jsp"><button type="button" class='activeControl2'>목록으로</button></a>
   </form>
</div>

</body>
</html>