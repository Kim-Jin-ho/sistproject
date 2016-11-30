<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	
	int nUm1 = Integer.parseInt(request.getParameter("num1"));
	int nUm2 = Integer.parseInt(request.getParameter("num2"));
	
	String yun = request.getParameter("kk");
	String str= "";
	
	switch(yun)
	{
		case "+" : str = String.format("%d",nUm1+nUm2); break;
		case "-" : str = String.format("%d",nUm1-nUm2); break;
		case "*" : str = String.format("%d",nUm1*nUm2); break;
		case "/" : str = String.format("%f",(double)nUm1/nUm2); break;
	}
	
	/* 	  
		String str = "";
	   
	   if(option.equals("+"))
	      str = String.format("%d + %d = %d", num1, num2, (num1+num2));
	   else if(option.equals("-"))
	      str = String.format("%d - %d = %d", num1, num2, (num1-num2));
	   else if(option.equals("*"))
	      str = String.format("%d * %d = %d", num1, num2, (num1*num2));
	   else if(option.equals("/"))
	      str = String.format("%d / %d = %f", num1, num2, (num1/(double)num2));
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h2>연산 결과</h2>
		<hr>
	</div>
	
	<%=nUm1 %> <%=yun %> <%=nUm2 %> = <%=str %>

</body>
</html>