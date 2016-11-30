<%@page import="class3.com.test.MemberScoreDTO"%>
<%@page import="class3.com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// MemberScoreSelect.jsp 페이지로 부터 넘겨받은 데이터 수신
	String sid = request.getParameter("sid");

	String name = "";
	
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try{
		
		// 데이터베이스 연결
		dao.Connection();
		
		// 수신한 sid 를 통해 name 얻어내기
		MemberScoreDTO score = dao.search(sid);
		
		name = score.getName();
		
		
	}catch(Exception e){
		
		System.out.println(e.toString());
		
	}finally{
		
		try{
			
			
			
		}catch(Exception e){
			
			System.out.println(e.toString());
			
		}
		
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp </title>
<link rel="stylesheet" href="css/memberMin.css">
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
</head>
<body>

<div>
   <h2>회원 명단 관리 - 입력 페이지</h2>      
   <a href="MemberScoreSelect.jsp"><button type="button" class='activeControl'>회원 명단 관리</button></a>
   <hr>
</div>

<div>
   <form action="memberScoreInsert.jsp?sid=<%=sid %>" method="post" id="memberScoreForm">
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
               <input type="text" id="kor" name="kor" class="scoreTxt">
               <span id="korMsg" class="errMsg">1 ~ 100 사이의 정수를 입력해야 합니다.</span>
            </td>
         </tr>
         
         <tr>
            <th>영어점수</th>
            <td>
               <input type="text" id="eng" name="eng" class="scoreTxt">
               <span id="engMsg" class="errMsg">1 ~ 100 사이의 정수를 입력해야 합니다.</span>
            </td>
         </tr>
         
         <tr>
            <th>수학점수</th>
            <td>
               <input type="text" id="mat" name="mat" class="scoreTxt">
               <span id="matMsg" class="errMsg">1 ~ 100 사이의 정수를 입력해야 합니다.</span>
            </td>
         </tr>
      </table>   
      <br><br>
      <a href="javascript:memberScoreSubmit()"><button type="button" class='activeControl2'>입력하기</button></a>
      <a href="javascript:memberScoreReset()"><button type="button" class='activeControl2'>취소하기</button></a>
      <a href="MemberScoreSelect.jsp"><button type="button" class='activeControl2'>목록으로</button></a>
   </form>
</div>

</body>
</html>