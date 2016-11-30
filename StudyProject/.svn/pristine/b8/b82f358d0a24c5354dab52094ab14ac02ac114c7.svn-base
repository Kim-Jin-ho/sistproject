package MemberRoomMainController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.SreBoardDAO;
import dto.SreBoard;

public class StudyRoomViewRecommendAjax implements Controller
{
	private SreBoardDAO dao;

	public void setDao(SreBoardDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse arg1) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		int srId = Integer.parseInt(request.getParameter("num"));
		
		// 세션을 사용하겠다는 의미
		HttpSession session = request.getSession();
		// 세션을 받아옴 (사업자번호, 사업자 이름)
		String nickname = (String)session.getAttribute("nickname");
		
		// 추천 리스트 박스의 값을 받아옴
		String recommendList = (String)request.getParameter("recommendList");
		
		
		int recommend = 0, recommendCheck = 0;
		int mid = 0;
		try
		{
			// nickname으로 mid 찾기
			mid = dao.searchNum(nickname);
			// 추천하기
			dao.recommendInsert(recommendList, srId, mid);
			// 추천수 불러오기
			recommend = dao.recommend(srId);
			// 추천 여부 체크
			recommendCheck = dao.recommendCheck(srId, mid);
			
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		mav.addObject("nickname",nickname);
		mav.addObject("recommend",recommend);
		mav.addObject("recommendCheck", recommendCheck);

		mav.setViewName("WEB-INF/jsp/StudyRoom/StudyRoomViewRecommendAjax.jsp");
		
		
		return mav;
	}
}
