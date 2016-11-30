/*===============================
   MemberInsert.java(서블릿)
===============================*/

package class3.com.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberInsert extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 요청이 GET 방식인 경우 자동 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GE POST 방식 모두 같은 메소드에서 처리할 수 있도록
		// 사용자 정의 메소드 호출
		doGetPost(request, response);
	}

	// 사용자의 요청이 POST 방식인 경우 자동 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GE POST 방식 모두 같은 메소드에서 처리할 수 있도록
				// 사용자 정의 메소드 호출
		doGetPost(request, response);
	}
	
	// 데이터 전송 및 페이지 요청 방식에 관계없이
	// 정의된 내용을 수행할 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 데이터 수신 과정(MemberInsertForm.jsp로 부터 모든 정보를 받아야 한다)
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		
		
		// 수신된 데이터를 데이터베이스에 저장
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPw(pw);
		dto.setName(name);
		dto.setTel(tel);
		dto.setEmail(email);
		
		MemberDAO dao = new MemberDAO();
		
		try
		{
			dao.connection();
			dao.insertQuery(dto);
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				dao.close();
			} catch (Exception e2)
			{
				System.out.println(e2.toString());
			}
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("MemberInsert.jsp");
		dispatcher.forward(request, response);
		
		
		
		
		
	}
}