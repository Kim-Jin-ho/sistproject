package faq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.IFAQDAO;

public class FAQInsertController implements Controller
{
	private IFAQDAO dao;

	public void setDao(IFAQDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();

		// 세션을 사용하겠다는 의미
		HttpSession session = request.getSession();

		// 세션을 받아옴 (사업자번호, 사업자 이름)
		//String saNum = (String)session.getAttribute("checkid");
		//String name = (String)session.getAttribute("checkname");
		
		String title = request.getParameter("title");
		String comment = request.getParameter("comment");

		// textArea에서는 \n 으로 입력할 경우 
		// HTML 화면단에서는 \n 이 먹히지 않기 때문에 <br>로 변경해준다.
		comment = comment.replaceAll("\n", "<br>");
		
		try
		{  
			int cd = (dao.maxCode()) + 1;
			System.out.println("cd : " + cd);
			dao.insert(cd, title, comment);
			
			mav.setViewName("redirect:FAQ.room");
		}
		catch (Exception e)
		{
			System.out.println(e.toString());			
		}

		return mav;
	}
}
