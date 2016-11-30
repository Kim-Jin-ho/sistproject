package class3.com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class CmpnyLoginController implements Controller
{
	private ICmpnyDAO dao; // 의존성 멤버주입을위해선 인터페이스 형의 자료형을 띄어야 하므로 멤버타입을 인터페이스 형으로 갖고 있어야한다.           
	
	public void setDao(ICmpnyDAO dao)
	{
		this.dao = dao;
	}
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		request.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		String name="";
		try
		{	
			String cmpnyid = request.getParameter("cmpnyid");
			String cmpnypassword = request.getParameter("cmpnypassword");
			name = dao.cmpnylogin(cmpnyid,cmpnypassword);
			
			if(name!=null||name!="")//로그인에 성공하면 아이디와 유저넘버1 로 세션 생성생성
			{
				HttpSession session = request.getSession();
				session.setAttribute("checkname",name);
				session.setAttribute("checkid",cmpnyid);
				session.setAttribute("checknum","2");			
			}
			
			System.out.println(name);			
			mav.addObject("login", name);
			mav.setViewName("ajax/ajaxcheck.jsp");	
						
			
		} catch (Exception e)
		{
			
		}
		return mav;
	}	
}	
	
