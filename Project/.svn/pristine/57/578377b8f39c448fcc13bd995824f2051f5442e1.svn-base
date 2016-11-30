package class3.com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class UsersearchIdController implements Controller
{
	private IUserDAO dao; // 의존성 멤버주입을위해선 인터페이스 형의 자료형을 띄어야 하므로 멤버타입을 인터페이스 형으로 갖고 있어야한다.           
	
	public void setDao(IUserDAO dao)
	{
		this.dao = dao;
	}
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		request.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		String usrId="";
		try
		{	
			
			String name = request.getParameter("search_name");
			String tel1 = request.getParameter("tel1");
			String tel2 = request.getParameter("tel2");
			String tel3 = request.getParameter("tel3");
			String tel= tel1+"-"+tel2+"-"+tel3;
			usrId = dao.idsearch(name,tel);
			System.out.println(usrId);
			System.out.println(tel);
			System.out.println(name);
			mav.addObject("usrId",usrId);
			mav.setViewName("ajax/ajaxcheck.jsp");
		
		} catch (Exception e)
		{
			
		}
		return mav;
	}	
}
