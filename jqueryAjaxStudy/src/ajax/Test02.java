package ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test02 extends HttpServlet{


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
		String id = request.getParameter("id");
		
		// DB에서 id가 중복되었는지 확인
		// select count(*) from tbl_member where id='superman';
		
		// 현재 DB가 없기 때문에 자료구조로 대체
		ArrayList<String> db = new ArrayList<String>();
		
		db.add("superman");
		db.add("admin");
		db.add("test");
		
		int result = 0;
		
		for (String item : db)
		{
			if (item.equals(id))
			{
				result = 1;
			}
		}
		
		// 최종 result 에 1이 있으면... 이미 존재하는 id 로 간주
		// 0 이 있으면... 존재하지 않는 id 로 간주
		
		// 이 값을 돌려주기 위해서 view 로 이동
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test02_ok.jsp");
		dispatcher.forward(request, response);
	}
}