<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.List"%>
<%@page import="com.util.MyUtil"%>
<%@page import="com.board.BoardDAO"%>
<%@page import="com.board.BoardDTO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cp = request.getContextPath();
%>

<%
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	MyUtil myUtil = new MyUtil();
	
	// 넘어온 페이지 번호 수신
	String pageNum = request.getParameter("pageNum");
	
	// 현재 표시되어야 하는 페이지
	int current_page = 1;
		
	// 수신한 페이지 번호가 null 이 아닐 경우...
	// 즉, 수신한 pageNum 파라미터가 존재할 경우
	// 정수 형태로 컨트롤 → 현재 표시되어야 하는 페이지로 이동
	if (pageNum != null)
	    current_page = Integer.parseInt(pageNum);
	
	// 검색 추가 -------------------------------------------------------------------------
	
	// 검색 키와 검색 값
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
	// 검색이 됐을 경우
	if(searchKey != null)
	{
		// 넘어온 값이 GET 방식이라면...(GET 은 한글 인코딩 해서 보내기 때문에..)
		if(request.getMethod().equalsIgnoreCase("GET"));
		{
			searchValue = URLDecoder.decode(searchValue,"UTF-8");	//디코딩 시킴
		}
	}else
	{
		searchKey="subject";
		searchValue="";
	}
	// 검색 추가 -------------------------------------------------------------------------
	
	// 전체 데이터 갯수 구하기
	int dataCount = dao.getDataCount(searchKey,searchValue);
	
	// 전체 데이터를 기준으로 총 페이지 수를 계산하기
	int numPerPage = 10;  // 한 페이지에 표시할 데이터 갯수
	int total_page = myUtil.getPageCount(numPerPage, dataCount);
	
	
	// 전체 페이지 수 보다 표시할 페이지가 큰 경우
	// 표시할 페이지를 전체 페이지로
	if(current_page > total_page)		//-- 데이터를 삭제해서 페이지가 줄었을 경우
		current_page = total_page;
	
	// 데이터 베이승네서 가져올 시작과 끝 위치
	int start = (current_page - 1) * numPerPage +1;
	int end = current_page * numPerPage;
	
	// 데이터베이스에서 해당 페이지를 가져오는 작업 수행
	List<BoardDTO> lists =  dao.getLists(start, end, searchKey, searchValue, dataCount);
	
	// 페이징 처리(검색 추가)
	String param = "";
	if(!searchValue.equals(""))
	{
		param="?searchKey="+searchKey;
		param="&searchValue="+ URLEncoder.encode(searchValue, "UTF-8");
	}
	
	// 페이징 처리
	//String listUrl = "List.jsp"
	String listUrl = "List.jsp"+param; 	//-- 검색 추가
	String pageIndexList = myUtil.pageIndexList(current_page, total_page, listUrl);
	
	// 검색 후 리스트 버튼 클릭시 되돌아 가기 위한 세션 설정
	session.setAttribute("searchKey", searchKey);
	session.setAttribute("searchValue", searchValue);
	
	DBConn.close();
		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게 시 판 (List.jsp)</title>
<link rel="stylesheet" href="<%=cp %>/bbs/data/css/list.css">
<link rel="stylesheet" href="<%=cp %>/bbs/data/css/style.css">

<script type="text/javascript">

	// 검색 추가 --------------------------------------------------------------------
	function sendIt()
	{
		var f = document.searchForm;
		f.action = "<%=cp%>/bbs/List.jsp";
		f.submit();
	}
	
	// 검색 추가 --------------------------------------------------------------------
</script>
</head>
<body>
<!-- 중간 확인 작업 -->
<%-- <h2><%=total_page %></h2> --%> 
<div id="bbsList">
	<div id="bbsList_title">
		게시판 (JDBC 버전)
	</div>
	
	<div id="bbsList_header">
		<div id="leftHeader">
			<form action="" name="searchForm" method="post">
				<select name="searchKey" class="selectFiled">
					<option value="subject">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
				</select>
				
				<input type="text" name="searchValue"> 
				<button type="button" class="btn1" onclick="sendIt();">검색</button>
			</form>	
		</div>
		<div id="rightHeader">
			<button type="button" class="btn1" 
			onclick="javascript:location.href='<%=cp%>/bbs/Created.jsp'">글 올리기</button>
			<dl></dl>
		</div>
	</div>
	
	<div id="bbsList_list">
		<div id="title">
			<dl>
				<dt class="num">번호</dt>
				<dt class="subject">제목</dt>
				<dt class="name">작성자</dt>
				<dt class="created">작성일</dt>
				<dt class="hitCount">조회수</dt>
			</dl>
		</div>
		
		<div id="lists">
		<%for (BoardDTO dto : lists)
		  {%>
		  <dl>
		  	<dd><input type="hidden" name="searchKey" value="<%=searchKey%>"></dd>
		  	<dd><input type="hidden" name="searchValue" value="<%=searchValue%>"> </dd>
		  	<dd class="num"><%=dto.getRnum() %></dd>
		  	<dd class="subject">
		  	<a href=
		  	"<%=cp%>/bbs/Article.jsp?num=<%=dto.getNum()%>&pageNum=<%=current_page%>"><%=dto.getSubject() %></a>
		  	</dd>
		  	<dd class="name"><%=dto.getName() %></dd>
		  	<dd class="created"><%=dto.getCreated() %></dd>
		  	<dd class="hitCount"><%=dto.getHitCount() %></dd>
		  </dl>
		  <%} %>
		</div>
		
		<div id="footer">
		 <%if(dataCount !=0)
			{%>
				<%=pageIndexList %>
		  <%} 
			else
			{%>
				등록된 게시물이 존재하지 않습니다.
		  <%} %>		
		</div>
	</div>
</div>
</body>
</html>