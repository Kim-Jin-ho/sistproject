package ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test03 extends HttpServlet{


private static final long serialVersionUID = 1L;

@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
	doGetPost(request, response);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
	doGetPost(request, response);
	
	}
	
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// 내용 작성
		int n1 = Integer.parseInt(request.getParameter("n1"));
		int n2 = Integer.parseInt(request.getParameter("n2"));
		String oper = request.getParameter("oper");
		
		int result = 0;
		
		if (oper.equals("hap"))
		{
			result = n1 + n2;
			oper = "+";
		}else if(oper.equals("sub"))
		{
			result = n1 - n2;
			oper = "-";
		}else if(oper.equals("mul"))
		{
			result = n1 * n2;
			oper = "*";
		}else if(oper.equals("div"))
		{
			result = n1 / n2;
			oper = "/";
		}
		
		System.err.println(result);
		
		request.setAttribute("result", result);
		request.setAttribute("n1", n1);
		request.setAttribute("n2", n2);
		request.setAttribute("oper", oper) ;
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test03_ok.jsp");
		dispatcher.forward(request, response);
	}
}