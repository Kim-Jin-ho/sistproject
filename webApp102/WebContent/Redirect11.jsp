<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	
	String op = request.getParameter("op");
	
	// 연산 처리
	
	String str ="";
	
	if(op.equals("1"))
		str = String.format("%d", (num1+num2));
	if(op.equals("2"))
		str = String.format("%d", (num1-num2));
	if(op.equals("3"))
		str = String.format("%d", (num1*num2));
	if(op.equals("4"))
		str = String.format("%f", ((double)num1/num2));
	
	response.sendRedirect("Receive11.jsp?num1="+num1+"&num2="+num2+"&op="+op+"&str="+str);
%>
	