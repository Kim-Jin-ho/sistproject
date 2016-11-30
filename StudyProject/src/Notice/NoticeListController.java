package Notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.INoticeDAO;
import util.BaseFunction;
import dto.Notice;

public class NoticeListController  implements Controller
{
	
	private INoticeDAO dao;
	
	public void setDao(INoticeDAO dao)
	{
		this.dao = dao;
	}
	

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		
		ModelAndView mav = new ModelAndView();
		
		BaseFunction baseFunction = new BaseFunction();
		ArrayList<Notice> lists = new ArrayList<Notice>();
		
		String pageNum = request.getParameter("pageNum");
		int current_page = 1;

		if (pageNum != null)
			current_page = Integer.parseInt(pageNum);

		int listCount = 0;
		
		
		try
		{
			listCount = dao.listCount();

			int numPerPage = 10; // 한 페이지에 표시할 데이터
			int total_page = baseFunction.getPageCount(numPerPage, listCount);

			//test
			System.out.println("totalPage:" + total_page);

			if (current_page > total_page)
				current_page = total_page;

			int end = listCount - ((current_page-1) * numPerPage);
			int start = listCount - (current_page * numPerPage) +1;
			System.out.println(start);
			System.out.println(end);

			String listUrl = "Notice.room";
			String pageIndexList = baseFunction.pageIndexList(current_page, total_page, listUrl);

			
			lists = dao.noticeList(start,end);
			
			mav.addObject("listCount", listCount);
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("lists", lists);
			mav.setViewName("WEB-INF/jsp/Notice/NoticeList.jsp");
			
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}



}
