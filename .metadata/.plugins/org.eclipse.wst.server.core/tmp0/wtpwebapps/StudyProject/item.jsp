<%@ page contentType="text/html; charset=UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%
    // 추천 검색어들을 XML로 목록화해서 돌려준다.
    response.setContentType("text/xml");
%><?xml version="1.0" encoding="UTF-8" ?>
    <list>
       <c:forEach items="${list}" var="item">
          <item>${item.menuId}</item>
          <item>${item.name}</item>
       </c:forEach>
	</list>
