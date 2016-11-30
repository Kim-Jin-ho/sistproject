/*===========================
 * - 게시판 페이징 처리
 * ========================*/

package class3.com.admin;

public class Myutil
{
	// 전체페이지 수를 구하는 메소드
	// numPerPage : 한 페이지에 표시할 데이터(게시물)의 수
	// dataCount : 전체 데이터(게시물)의 수
	// → 한 페이지 표시할 데이터 갯수를 구한 변수와 전체 데이터 수를 구한 변수를 인자값으로 받는다.
	public int getPageCount(int numPerPage, int dataCount)
	{
		//전체 페이지 수
		int pageCount = 0;
		pageCount = dataCount / numPerPage;
		// 전체페이지수 = 총데이터갯수 / 페이지에 표시할 데이터수
		//만약 총 데이터 갯수가 15개이고 페이지에 표시하고 싶은 데이터 수가 10개라면 
		// 15/10 → 1이다.
		if(dataCount % numPerPage != 0)
			pageCount++;
		/* 한 페이지에 10개의 게시물을 출력할 때
		   총 32개의 게시물을 페이지로 구성하기 위해서는 
		   32 / 10연산을 수행하면 결과 3을 얻을수 있다.
		   → 『pageCount = dataCount / numPerPage;』 그런데 이 때,
		   나머지 2개의 게시물을 출력하기 위해서는
		   페이지가 하나 더 필요하다.
		   따라서 ++를 해주는거임!!  */
		return pageCount;
	}

	
	//페이징 처리 기능의 메소드
	// current_page : 현재 표시할 페이지
	// total_page : 전체 페이지 수
	// list_url : 링크를 설정할 url
	public String pageIndexList (int current_page, int total_page, String list_url, String searchKey, String searchValue)
	{
		//실제 페이징을 저장할 String Buffer변수 선언
		StringBuffer strList = new StringBuffer();
		
		int numPerBlock = 10; // 페이징 처리시 게시물 리스트 하단의 숫자를 10개씩 보여주겠다.◀◀  ◀  1 2 3 4 5 6 7 8 9 10 ▶  ▶▶
		int currentPageSetup; // 현재페이지(이 페이지를 기준으로 보여주는 숫자가 달라져야 하기때문에) 
		int page;
		int n;                // 이전페이지 블록과 같은 처리에서 이동하기 위한 변수(얼만큼이동할것인지)
		
		// 페이징 처리가 별도로 필요하지 않은 경우 
		// 데이터가 없거나 데이터 수가 1페이지도 못 채울 경우는 페이징 처리를 별도로 할 필요가 없다.
		if (current_page == 0)
			return "";
		
		//○ list_url 에 대한 사전 처리
		// 페이지가 한페이지 이상일경우!!
		// get방식으로 처리하는 과정에서 URL경로의 패턴에 대한 처리
		// get방식 처리할때 첫번째는 주소값 ? key = value 를 쓰는데 여기서 추가해주고싶을때 & 를 붙이잖아!!!
		if (list_url.indexOf("?")!= -1) //링크 설정할 URL에 ?가 들어있으면(GET방식)!!!
			list_url = list_url + "&"; //&를 추가해서 확장시켜나가라!! 
		else                           //링크 설정할URL에 ?가 없으면(POST방식) 
			list_url = list_url +"?"; //아니라면 ?부터 시작해라!!(기존 POST방식을 GET방식으로 변환!!)
		// 검색 값이 존재하면 이미 request 값에 searchKey 값과 value값이 들어있는 상황이므로
		// &를 붙여서 추가해 주어야 한다.
		
		//currentPageSetup = 표시할 첫 페이지 -1
		currentPageSetup = (current_page/numPerBlock) *numPerBlock;
		//만약 현재 페이지가 5페이지이고 (current_page=5) 
		//리스트 하단에 보여줄 페이지 갯수가 10개 이면 (numPerBlock=10)
		//『5/10 = 0』 이며... 여기에 *10을 해도 0 이다.
		// 하지만 현재 페이지가 11페이지라면 (current_page = 11)
		// 『11/10 = 1』 이며.. 여기에 *10을 하면 10이다.
		
		if(current_page % numPerBlock ==0) 
			 currentPageSetup = currentPageSetup - numPerBlock;
		//만약 위에서 처리한 내용에서 현재 페이지가 20페이지였다면 (current_page = 20)
		//『20/10 = 2』 이며... 여기에 * 10 을해서 20이 되는데, 
		// 이 경우 다시 10을 빼서 10으로 만들어준다. 
		
		//1페이지
		if((total_page>numPerBlock) && (currentPageSetup > 0))
		{
			strList.append("<a href='" + list_url +"pageNum=1'");
		}
		
		//Prev
		n = current_page - numPerBlock;
		//『n』 : 해당 페이지 만큼 앞으로 가기 위한 변수 
		if( (total_page> numPerBlock) && (currentPageSetup>0))
		{
			strList.append("<a href='" + list_url + "pageNum=" + n + "'>Prev</a>");
		}
		// currentPageSetup 이 0보다 큰 경우는 이미 페이지가 10이상이라는 의미이며
		// 이 때 현재 페이지(current_page) 가 11이상일 경우 Prev 를 붙이기 위한 내용
		// Prev를 클릭할 경우 n 변수 페이지로 이동하는데 12에서 Prev를 할 경우
		// 2페이지가 되게끔 처리한다.
		
		//바로가기 페이지
		page = currentPageSetup +1;
		// currentPageSetup 에다가 +1을 하는 이유는
		// 앞에서 current PageSetup 에서 10을 가져왔다면
		// 10부터 시작하는 것이 아니라 11부터 시작해야 하기 때문에 해준다.
		
		while( (page <=total_page) && (page <= currentPageSetup + numPerBlock))
		{
			if(page == current_page)
				strList.append("<font color ='orange'>"+ page + "</font>");
			else
				strList.append("<a href='"+ list_url + "pageNum=" + page + "&searchKey=" + searchKey + "&searchValue=" + searchValue + "'>" + page + "</a>");
			page ++;
		}
		

		
		//Next
		n = current_page + numPerBlock;
		if((total_page - currentPageSetup) > numPerBlock)
		{
			strList.append("<a href='"+ list_url + "pageNum==" + n + "'>Next</a>");
		}	
	    //마지막 페이지
		if((total_page > numPerBlock) && ((currentPageSetup + numPerBlock) < total_page))
		{
			strList.append("<a href='"+list_url+"pageNum="+total_page + "'>" + total_page + "</a>");
		}
		
		return strList.toString();
	}
	
}

