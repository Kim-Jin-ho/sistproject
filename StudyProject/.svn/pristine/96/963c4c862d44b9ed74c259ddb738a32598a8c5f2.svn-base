package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.IMemberDAO;

public class Admin_LoginController implements Controller
{
	private IMemberDAO dao;

	public void setDao(IMemberDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String admin = null;
		
		try
		{
			admin = dao.loginAdmin(id, pw);
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		if (admin == null)
		{
			mav.setViewName("redirect:Admin_login_form.room");
		}
		else
		{
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);
			
			// 관리자 페이지 만들어서 설정하기
			mav.setViewName("redirect:StudyMain_member.room");
		}
		
		return mav;
	}

}
