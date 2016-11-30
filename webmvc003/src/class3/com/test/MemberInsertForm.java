/*==========================
	MemberInsertForm.java
	- 서블릿 클래스
==========================*/

// 20160414_2. Servlet 기본코딩 내용 복붙 하기~!!!

package class3.com.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberInsertForm extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	
	// 사용자의 요청이 GET 방식인 경우 자동 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET, POST 방식 모두 같은 메소드에서 처리할 수 있도록
		// 사용자 정의 메소드 호출
		doGetPost(request, response);
	}

	// 사용자의 요청이 POST 방식인 경우 자동 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET, POST 방식 모두 같은 메소드에서 처리할 수 있도록
		// 사용자 정의 메소드 호출
		doGetPost(request, response);	
	}
	
	// 데이터 정송 및 페이지 요청 방식에 관계없이
	// 정의된 내용을 수행할 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 여기 내용은 새로 작성~!! (기존 내용 지우기)
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("MemberInsertForm.jsp");
		dispatcher.forward(request, response);
		
	}
}
