package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.IMemberDAO;

public class LoginController implements Controller
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
		String nickname = null;
		String mid = "";
		String save = "";
		try
		{
			nickname = dao.login(id, pw);
			
			mid = dao.getMid(nickname);
			
			save = dao.getSave(mid);
			
			System.out.println(mid);
			System.out.println(save);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		if (nickname == null)
		{
			mav.setViewName("redirect:login_form.room");
		}
		
		if (save ==null)
		{
			save = "0";
		}
		else
		{
			HttpSession session = request.getSession();
			session.setAttribute("nickname", nickname);
			session.setAttribute("save", save);
			System.out.println(nickname);
			mav.setViewName("redirect:StudyMain.room");
		}
		
		return mav;
	}

}
