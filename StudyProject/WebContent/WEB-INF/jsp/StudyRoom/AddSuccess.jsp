<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>확인</title>
<script type="text/javascript">
	function re()
	{
		window.opener.top.location.href= "http://localhost:8090/StudyProject/ShopSelect.room";
		window.close();
	}
</script>
</head>
<body>

추가되었습니다.


<button type="button" onclick="re();">확인</button>

</body>
</html>