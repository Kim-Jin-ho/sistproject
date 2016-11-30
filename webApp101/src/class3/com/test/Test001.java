/*=====================================
 		Test001.java
=====================================*/

// GenericServlet 클래스를 상속받은 클래스
package class3.com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Test001 extends GenericServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html; charset=UTF-8");
		//-- 이부분에 오타가 있는경우 다운로드 대화 창이 호출된다.
		try
		{
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>서블릿 테스트</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("GenericServlet 클래스를 이용한 서블릿 테스트");
			out.println("</body>");
			out.println("</html>");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
	}
	
}
