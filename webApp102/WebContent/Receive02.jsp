<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("userName");
	int eng = Integer.parseInt(request.getParameter("userEng"));
	int kor = Integer.parseInt(request.getParameter("userKor"));
	int mat = Integer.parseInt(request.getParameter("userMat"));
	
	int hap = eng + kor + mat;
	double avg = hap/3;
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h2>점수 산출 결과</h2>
	<hr>
</div>
	<%=name %> 님, 성적 처리가 완료 되었습니다.<br><br>
	회원님의 점수는 국어 : <%=kor %>점, 영어 : <%=eng %>점, 수학 : <%=mat %>점 입니다.<br>
	총점은 <%=hap %>, 평균은<%=avg %>점 입니다. 
</body>
</html>