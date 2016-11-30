<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello.jsp</title>
</head>
<body>


<div><h4><%=request.getAttribute("hello") %></h4></div>
<div><h4>${hello }</h4></div>


</body>
</html>