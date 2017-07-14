package util;

public class BaseFunction
{

	/*
	 * intPageBlock // 한 줄에 출력될 페이지 수 (기본값 10) intCurrentPage // 현재페이지
	 * intTotalPageSize // 전체 페이지 수
	 */
	public String getHtmlPaging(int intPageBlock, int intCurrentPage, int intTotalPageSize)
	{
		StringBuffer str = new StringBuffer();

		str.append("");

		// 맨 처음으로...
		if (intCurrentPage > 1)
		{ // 현재 페이지가 1페이지 이상일때 (기본값은 1페이지)
			str.append(
					"<img src='/PSYP/App/images/admin/pn_arr_first.gif' align='absmiddle' class='pointer' id='btnPageFirst' strA='1' />");
		} else
		{
			str.append("<img src='/PSYP/App/images/admin/pn_arr_first.gif' id='btnPageFirst' strA='0'/>");
		}

		// 이전페이지로...
		if (intCurrentPage > 1)
		{
			str.append("<img src='/PSYP/App/images/admin/pn_arr_pre.gif' class='pointer' id='btnPagePrevious' strA='"
					+ (intCurrentPage - 1) + "' />");
		} else
		{
			str.append("<img src='/PSYP/App/images/admin/pn_arr_pre.gif' id='btnPagePrevious' strA='0' />");
		}

		int startPage = (((intCurrentPage - 1) / intPageBlock) * intPageBlock) + 1;
		int endPage = startPage + intPageBlock - 1;

		if (endPage >= intTotalPageSize)
			endPage = intTotalPageSize;

		// 각 페이지 출력
		if (intTotalPageSize > 0)
		{
			for (int k = startPage; k <= endPage; k++)
			{
				if (intCurrentPage != k)
					str.append(" &nbsp;<a name='btnPageMove' class='pointer' strA='" + k + "'>" + k + "</a>");
				else
					str.append(" &nbsp;<a name='btnPageMove' class='pointer on' strA='" + k + "'>" + k + "</a>");
			}
		}

		// 다음페이지로..
		if (intCurrentPage < intTotalPageSize)
		{
			str.append(
					" &nbsp;<img src='/PSYP/App/images/admin/pn_arr_next.gif' class='pointer' id='btnPageNext' strA='"
							+ (intCurrentPage + 1) + "'/>");
		} else
		{
			str.append(
					" &nbsp;<img src='/PSYP/App/images/admin/pn_arr_next.gif' id='btnPageNext' strA='0' alt='image' />");
		}

		// 맨 뒤 페이지로...
		if (intCurrentPage < intTotalPageSize)
		{
			str.append(" <img src='/PSYP/App/images/admin/pn_arr_last.gif' class='pointer' id='btnPageLast' strA='"
					+ intTotalPageSize + "'/>");
		} else
		{
			str.append(" <img src='/PSYP/App/images/admin/pn_arr_last.gif' id='btnPageLast' strA='0'/>");
		}

		str.append("");
		return str.toString();

	}

	// 페이징 처리
	public int getPageCount(int numPerPage, int dataCount)
	{
		int pageCount = 0;

		pageCount = dataCount / numPerPage;

		if (dataCount % numPerPage != 0)
		{
			pageCount++;
		}

		return pageCount;
	}

	// ■■■ 페이징 처리 기능의 메소드 ■■■
	// current_page : 현재 표시할 페이지
	// total_page : 전체 페이지 수
	// list_url : 링크를 설정한 url
	public String pageIndexList(int current_page, int total_page, String list_url)
	{
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

}
