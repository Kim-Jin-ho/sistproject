/*=======================
	MemberList.java
=======================*/

package class3.com.test;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberList extends HttpServlet
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
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		MemberDAO dao = new MemberDAO();
		
		try
		{
			// 데이터 베이스 연결 메소드
			dao.getConnection();
			
			// 리스트 받아오는 메소드 호출
			list = dao.list();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				// 데이터 베이스 종료 메소드
				dao.close();
				
			} catch (Exception e2)
			{
				System.out.println(e2.toString());
			}
		}
		
		// 리스트 메소드를 통해서 꺼내온 목록들을 setAttribute 해서
		// MemberList.jsp에 보내주기
		request.setAttribute("list", list);
		
		// 여기 내용은 새로 작성~!! (기존 내용 지우기)
		RequestDispatcher dispatcher = request.getRequestDispatcher("MemberList.jsp");
		dispatcher.forward(request, response);
		
		
	}
	
	
	
	
}
