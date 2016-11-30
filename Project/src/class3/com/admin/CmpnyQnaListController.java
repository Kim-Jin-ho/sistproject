package class3.com.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


public class CmpnyQnaListController implements Controller
{
	private IQnaDAO dao;

	public void setDao(IQnaDAO dao)
	{
		this.dao = dao;
	}

	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// Myutil.java 사용
		Myutil Myutil = new Myutil();
		
		// 전체 글에 대한 페이지수가 나뉘어 졌을대 받아오는 변수
		// 그러나 첫 페이지에는 1로 지정함으로써 가장 최근 10개 글을 볼 수 있게했다.
		String pageNum = request.getParameter("pageNum");
		int current_page = 1;
		
		// 받아온 pageNum 이 있으면 int 로 형변환
		if(pageNum != null)
		      current_page = Integer.parseInt(pageNum);
		
		// 검색 옵션에서 선택한 searchKey 를 가져옴
		String searchKey = request.getParameter("searchKey");
		
		// 검색어인 searchValue 를 가져옴
		String searchValue = request.getParameter("searchValue");
		
		// 총 QNA 갯수를 0 으로 선언
		int dataCount = 0;
		
		// 검색어가 없을 때에 KEY값을 NAME으로 지정해서 모든 글이 출력될 수 있도록 했다
		// 검색어가 없을 때에는 searchValue 에 %% 를 초기화 함으로써
		// 오라클 구문에서 모든 글을 출력할 수 있도록 했다.
		if(searchValue==null)
		{
			searchKey = "NAME";
			searchValue = "%%";
		}
		
		dataCount = dao.maxNum2(searchKey, searchValue);
		
		int numPerPage = 10; //-- 한 페이지에 표시할 데이터 갯수
		int total_page = Myutil.getPageCount(numPerPage, dataCount); // 총 페이지 갯수
		
		if (current_page > total_page)   //-- 데이터를 삭제해서 페이지가 줄었을 경우~!!!
		      current_page = total_page;
		
		ArrayList<Qna> cmpnyQnaList = new ArrayList<Qna>();
		
		int start = (current_page-1) * numPerPage+1;
		
		int end = current_page * numPerPage;
		
		String listUrl = "CmpnyQnaList2.love";
		
		// 아래 출력되는 QNA 페이징 처리
		String pageIndexList = Myutil.pageIndexList(current_page, total_page, listUrl, searchKey, searchValue );
		
		
		try
		{
			// cmpnyQnaList() 메소드로 cmpnyQnaList 변수 초기화
			cmpnyQnaList = dao.cmpnyQnaList(searchKey, searchValue, start, end, dataCount);
			
			// 회원 QNA 리스트와 페이징 처리 값을 CmpnyQnaList.jsp 로 보냄
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("cmpnyQnaList", cmpnyQnaList);
			
			mav.setViewName("admin/CmpnyQnaList.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	

}
