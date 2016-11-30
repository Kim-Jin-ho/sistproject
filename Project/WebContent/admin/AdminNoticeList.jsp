<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_공지사항(AdminNotice.jsp)</title>

</head>
<body>

<div id="wrap"> <%-- 전체 틀 --%>

	<!-- GNB 영역 -->
	<c:import url="${cp }/main/mainGnb.jsp"/>
	<!-- 메뉴 -->
	<c:import url="${cp }/admin/AdminMenu.jsp"></c:import>
	
	<div id="container"> <%-- 내용 --%>
	
	<div> <!-- 테이블 -->
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일자</th>
			<th>조회수</th>
		</tr>
		<tr>
			<td>3</td>
			<td>서비스 일시 중단 안내 (4월 23일(토) 02:00~06:00 (4시간))</td>
			<td>2016/04/14</td>
			<td>481</td>
		</tr>
		<tr>
			<td>2</td>
			<td>개인정보취급방침 변경 안내(2015/12/30일자)</td>
			<td>2015/12/23</td>
			<td>2082</td>
		</tr>
		<tr>
			<td>1</td>
			<td>GS SHOP 서비스 일시중단 안내 (12월 6일 일요일 02시 ~ 06시)</td>
			<td>2015/12/04</td>
			<td>77</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td><button type="button" onclick="location.href='AdminNoticeInsertForm.jsp'">글쓰기</button> </td>
		</tr>
	</table>
	
	
	
	
	
	
	</div>
	
	
	
	
	
	</div>
	
	
	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>
	

</div>

</body>
</html>