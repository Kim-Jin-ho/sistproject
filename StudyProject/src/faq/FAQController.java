package faq;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.IFAQDAO;

public class FAQController implements Controller
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
		String admin = (String)session.getAttribute("admin");

		// FAQ.jsp 페이지에서 삭제 버튼의 name 값을 불러온다.
		String cd = request.getParameter("hidden");
		
		// 넘어온 페이지 번호 수신
		String pageNum = request.getParameter("pageNum");
		
		// 현재 표시되어야 하는 페이지
		int current_page = 1;
		
		// 수신한 페이지 번호가 null 이 아닐 경우... 
		// 즉, 수신한 pageNum 파라미터가 존재할 경우
		// 정수 형태로 컨트롤 → 현재 표시되어야 하는 페이지로 적용
		if(pageNum != null)
			current_page = Integer.parseInt(pageNum);
		
		try
		{ 
			// 삭제를 진행해라.
			if (cd != null)
			{
				cd = cd.substring(6);
				dao.delete(cd);
			}
			
			
			
			
			// 검색 추가 ------------------------------------------------------------------------------------------------
			// 검색 키와 검색 값
			String searchKey = request.getParameter("searchKey");
			String searchValue = request.getParameter("searchValue");
			
			
			
			// 검색이 됐을 경우
			if (searchKey != null)
			{
				// 넘어온 값이 GET 방식이라면 ... (GET은 한글을 인코딩 해서 보내기 때문에...)
				if(request.getMethod().equalsIgnoreCase("GET"));
				{
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}
			}
			else
			{
				searchKey = "FAQNAME";
				searchValue = "";
			}
			//-------------------------------------------------------------------------------------------------검색 추가 
			
			// 전체 데이터 갯수 구하기
			int dataCount = dao.getDataCount(searchKey, searchValue);
			
			
			
			// 전체 데이터를 기준으로 총 페이지 수를 계산하기
			int numPerPage = 10;	//-- 한 페이지에 표시할 데이터 갯수
			int total_page = dao.getPageCount(numPerPage, dataCount);
			
			
			// 전체 페이지 수 보다 표시할 페이지가 큰 경우...
			// 표시할 페이지를 전체 페이지로...
			if (current_page > total_page)	//-- 데이터를 삭제해서 페이지가 줄었을 경우~!!!
				current_page = total_page;
			
			/*
			// 데이터베이스에서 가져올 시작과 끝 위치
			int start = (current_page - 1) * numPerPage + 1;
			int end = current_page * numPerPage;
			*/
			
			int end = dataCount - ((current_page - 1) * 10);
			System.out.println("end : " + end);
			int start = dataCount - (current_page * numPerPage) + 1;
			System.out.println("start : " + start);
			
			
			// 데이터베이스에서 해당 페이지를 가져오는 작업 수행
			//List<BoardDTO> lists = dao.getLists(start, end);
			ArrayList<FAQDTO> lists = dao.getLists(start, end, searchKey, searchValue, dataCount);
				
			// 페이징 처리 (검색 추가)
			String param = "";
			if (!searchValue.equals(""))
			{
				param="?searchKey="+searchKey;
				param+="&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
			}
			
			
			// 페이징 처리
			String listUrl = "FAQ.room"+param; //-- 검색 추가
			
			String pageIndexList = dao.pageIndexList(current_page, total_page, listUrl);
			
			session.setAttribute("searchKey", searchKey);
			session.setAttribute("searchValue", searchValue);
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("list", lists);
			mav.addObject("admin", admin);
			mav.setViewName("/WEB-INF/jsp/FAQ/FAQ.jsp");
		}
		catch (Exception e)
		{
			System.out.println(e.toString());			
		}

		return mav;
	}
}
