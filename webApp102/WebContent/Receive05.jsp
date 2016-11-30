<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String gugudan = request.getParameter("dan");
	
	int num = Integer.parseInt(gugudan);
	
	String result = "";
	
	/* for(int i=0; i<9; i++)	// 이방법 편하진 않으나 가능함
	{
		result += String.format("%d * %d = %d",num,(i+1),(num*(i+1))) + "<br>";
	} */
		
	for(int i=1; i<=9; i++)	// 이방법 편하진 않으나 가능함
	{
		result += String.format("%d * %d = %d",num,i,(num*i)) + "<br>";
	}
	/*
	int nDan = Integer.parseInt(request.getParameter("dan")); 
	
	String result = "";
	
	int i = 1;
	
	for(i = 1; i<=9; i++)
	{
		result += String.format("%d * %d = %d",nDan,i,i*nDan)+"<br>";
	} */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<div>
	<h2>결과 화면!</h2>
	<hr>
</div>
	<%=result %>
</body>
</html>