package join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.IMemberDAO;
import dto.Member;

public class MemberInsertController implements Controller
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
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String nickname = request.getParameter("nickname");
		String pw = request.getParameter("password");
		String email = request.getParameter("email");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String tel = tel1 + "-" + tel2 + "-" + tel3;
		
				
		try
		{
			Member member1 = new Member();
			Member member2 = new Member();
			
			member1.setId(id);
			member1.setPw(pw);
			member1.setNickname(nickname);
			member2.setName(name);			
			member2.setEmail(email);
			member2.setTel(tel);
			
			dao.memberAdd(member1);
			dao.gainfoAdd(member2);
			
			mav.setViewName("/WEB-INF/jsp/join/join_end.jsp");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;		
	}
	
}
