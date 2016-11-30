<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>

<!-- 광고영역 -->
<c:forEach var="ad" items="${advtajaxResult }">
	<table>
		<tr>
			<td><img src="${ad.img }" alt="사진없음"></td>
		</tr>
		<tr>
			<th>${ad.sbjct } + 광고</th>
		</tr>
	</table>
	
	<%-- <h2>${ad.sbjct } + 광고</h2>
	<h2><img src="${ad.img }"></h2> --%>
</c:forEach>

<!-- 일반상품영역 -->
<c:forEach var="i" items="${mainResult }">
	<table>
		<tr><!-- 각각의 상세페이지로 간다를 넣어준다 -->
			<td><a href="<%=cp%>/youngjin/wedding_select.love"><img src="${i.img }" alt="사진없음"></a></td>
		</tr>
		<tr>
			<th>${i.addr1 }<br>
				${i.addr2 }<br>
				${i.name }<br>
				${i.prc }
			</th>
		</tr>
	</table>
</c:forEach>
<hr>




<!-- 한영역끼리 묶어서 뿌려진다. 묶이는것끼리 -->

