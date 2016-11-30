/*=====================================
 		Test001.java
=====================================*/

// HttpServlet 클래스를 상속받은 클래스
// 형태로 구성한 서블릿
package class3.com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test002 extends HttpServlet
{

	//클라이언트의 데이터 전송 및 페이지 요청 방식(get, post) 에 따라
	// 두 개의 메소드(doGet(), doPost) 중에
	// 선택해서 작업을 할 수 있다.
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	// 실무적으로
	// 사용자 정의 메소드
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		response.setContentType("text/html; charset= UTF-8");
		String str = "아이디 : " + userId + ", 패스워드 : " + userPwd;
		PrintWriter out = response.getWriter();
		out.print("<h2>" + str + "</h2>");
	}
}
