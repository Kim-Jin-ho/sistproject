package util;

public class MyUtil {

	// ■ 전체 페이지 수를 구하는 메소드
	// numPerPage : 한 페이지에 표시할 데이터(게시물)의 수
	// dataCount : 전체 데이터(게시물)의 수
	// → 한페이지 표시할 데이터 갯수를 구한 변수와
	// 데이터 수를 구한 변수를 인자값으로 받는다.
	public int getPageCount(int numPerPage, int dataCount) {
		int pageCount=0;
		
		pageCount = dataCount/numPerPage;
		if(dataCount%numPerPage !=0)
			pageCount++;
		
		return pageCount;

	}
	// -- 한 페이지에 10 개의 게시물을 출력할 때
	// 총 32 개의 게시물을 페이지로 구성하기 위해서는
	// 32 / 10 연산을 수행하면 결과 3을 얻을 수 있다.
	// → 『pageCount = dataCount / numPerPage;』
	// 그런데 이 때,
	// 나머지가 2개의 게시물을 출력하기 위해서는
	// 페이지가 하나 더 필요하다.

	// ■ 페이징 처리 기능의 메소드
	// current_page : 현재 표시할 페이지
	// total_page : 전체 페이지 수
	// list_url : 링크를 설정할 url
	public String pageIndexList(int current_page, int total_page, String list_url) {

		// 실제 페이징을 저장할 StringBuffer 변수
		StringBuffer strList = new StringBuffer();
		
		int numPerBlock = 10; // -- 페이징 처리 시 게시물 리스트 하단의 숫자를 10개식 보여주겠다.
		int currentPageSetup; // -- 현재 페이지 (이 페이지를 기준으로 보여주는 숫자가 달라져야 하기 때문에...)
		int page; // --
		int n; // -- 이전 페이지 블록과 같은 처리에서 이동하기 위한 변수 (얼만큼... 이동 할 것인지)

	// 페이징 처리가 별도로 필요하지 않은 경우
	// -- 데이터가 없거나 데이터 수가 1페이지도 못 채울 경우는
	// 페에징 처리를 별도로 할 필요가 없다.
		if (current_page == 0) {

			return "";

		}

		// GET 방식으로 처리하는 과정에서
		// URL 경로의 패턴에 대한 처리
		if (list_url.indexOf("?") != -1) { // -- 링크 설정할 URL 에 『?』가
											// 들어있으면...(GET방식)
			list_url = list_url + "&";
		} else { // -- 링크 설정할 URL 에 『?』가 없으면... (POST 방식 → GET 방식)
			list_url = list_url + "?";
		}
		// -- 검색값이 존재하면 이미 request 값에 searchKey 값과 value 값이 들어있는 상황이므로
		// 『&』를 붙여서 추가해 주어야 한다.

		// currentPageSetup = 표시할 첫 페이지 - 1
		currentPageSetup = (current_page / numPerBlock) * numPerBlock;
		// -- 만약 현재 페이지가 5펭이지이고 (current_page= 5)
		// 리스트 하단에 보여줄 페이지 갯수가 10 이면 (numPerBlock = 10)
		// 『5 / 10 = 0』 이며... 여기에 『* 10』(10을 곱해도)을 해도 0 이다.
		// 하지만 현재 페이지가 11페이지라면 (current_page = 11)
		// 『11 / 10 = 1』 이며... 여기에 『* 10』(10을 곱하면)을 하면 10이다
		// 그러면 currentPageSetup 은 10 이 되는 것이다.

		if (current_page % numPerBlock == 0) {
			current_page = currentPageSetup - numPerBlock;
			// 만약 위에서 처리한 내용에서 현재 페이지가 20페이지였다면 (current_page = 20)
			// 『20 / 10 = 2』 이며... 여기에 『* 10』(10을 곱해서)을 해서 20이 되는데
			// 이 경우 다시 10을 뺴서 10으로 만들어준다.
		}

		// 1 페이지
		if ((total_page > numPerBlock) && (currentPageSetup > 0)) {
			strList.append("<li><a href='" + list_url + "pageNum=1'>1</a></li>");
		}

		// prev
		n = current_page - numPerBlock;
		// -- 『n』 : 해당 페이지만큼 앞으로 가기 위한 변수

		if ((total_page > numPerBlock) && (currentPageSetup > 0)) {

			strList.append("<li><a href='" + list_url + "pageNum=" + n + "'>prev</a></li>");
		}

		// -- currentPageSetup 이 0 보다 큰 경우는 이미 페이지가 10 이상이라는 의미이며
		// 이 때 현재 페이지(current_page) 가 11 이상일 경우 Prev 를 붙이기 위한 내용
		// -- Prev 를 클릭할 경우 n 변수 페이지로 이동하는데 12 에서 Prev 를 할 경우
		// 2페이지가 되게끔 처리

		// 바로 가기 페이지
		page = currentPageSetup + 1;
		// -- currentPageSetup 에다가 『+1』을 하는 이유는
		// 앞에서 currentPageSetup 에서 10을 가져왔다면
		// 10 부터 시작하는 것이 아니라 11 부터 시작해야 하기 떄문에 해준다.

		while ((page <= total_page) && (page <= currentPageSetup + numPerBlock)) 
		{
			if (page == current_page) 
			{
				strList.append("<li class='active'><a>" + page + "</a></li>");
			} else 
			{
				strList.append("<li><a href='" + list_url + "pageNum=" + page + "'>" + page + "</a></li>");
			}
			page++;

		}

		// Next
		n = current_page + numPerBlock;
		if ((total_page - currentPageSetup) > numPerBlock) {
			strList.append("<li><a href='" + list_url + "pageNum=" + n + "'>Next</a></li> ");
		}

		// 마지막 페이지
		if ((total_page > numPerBlock) && (currentPageSetup + numPerBlock) < total_page) {
			strList.append("<li><a href='" + list_url + "pageNum=" + total_page + "'>" + total_page + "</a></li>");
		}

		return strList.toString();

	}

	/*public String pageIndexList(int current_page, int total_page, String list_url) 
	{
        int pagenumber;     // 화면에 보여질 페이지 인덱스 수
        int startpage;      // 화면에 보여질 시작페이지 번호
        int endpage;        // 화면에 보여질 마지막페이지 번호
        int curpage;        // 이동하고자 하는 페이지 번호
        String strList="";  // 리턴될 페이지 인덱스 리스트

        pagenumber = 3;    // 한 화면의 페이지 인덱스 수 

        // 시작 페이지번호 구하기
        startpage = ((current_page - 1) / pagenumber) * pagenumber + 1;
        // 마지막 페이지번호 구하기
        endpage = (((startpage - 1) +  pagenumber) / pagenumber) * pagenumber;

        // 총 페이지 수가 계산된 마지막페이지 번호보다 작을경우 
        // 총 페이지 수가 마지막페이지 번호가 됨
        if (total_page <= endpage)
        {
            endpage = total_page;
        }

        // 첫번째 페이지 인덱스 화면이 아닌경우
        if ( current_page > pagenumber) {
            curpage = startpage - 1;    // 시작페이지 번호보다 1 적은 페이지로 이동
            strList = strList + "<a href='"+list_url+"&pageNum="+curpage+"'>[<<]</a>";
        }else{
            strList = strList + "[<<]";
        }
        strList = strList + " ... ";

        // 시작페이지 번호부터 마지막페이지 번호까지 화면에 표시
        curpage = startpage;

        while (curpage <= endpage){
            if (curpage == current_page) {
                strList = strList + "["+current_page+"]";
            } else {
                strList = strList +"<a href='"+list_url+"&pageNum="+curpage+"'>["+curpage+"]</a>";
            }
            curpage++;
        }
        strList = strList + " ... ";
     
        // 뒤에 페이지가 더 있는경우
        if ( total_page > endpage) {
            curpage = endpage + 1;  
            strList = strList + "<a href='"+list_url+"&pageNum="+curpage+"'>[>>]</a>";
        }else{
            strList = strList + "[>>]";
	        }
	        return strList;
    }*/
}