<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="class3.com.test.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	// 입력받은 제목
	String id = request.getParameter("positionId");
	// 입력받은 내용
	int minpay = 0;
	int minpay1 = 0;
	EmployeeDAO dao = new EmployeeDAO();
	
	try
	{
		dao.connection();
		minpay = dao.minBasicPay(id);
		
		System.out.print(minpay);
	}catch(Exception e)
	{
		System.out.print(e.toString());
	}
%>
<input type="text" name="basicpay" id="minBasicPay" style="text-align: right;" placeholder="최소<%=minpay %>원 이상">



