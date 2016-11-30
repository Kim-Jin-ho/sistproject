<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	System.out.print(cp);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>/jsp/css/bootstrap.css">
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
<div class="container">
	<!-- 버튼 -->
	<button type="button" class="" data-toggle="modal" data-target="#myModal" >
	  추가
	</button>

	<!-- 모달 팝업 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">대분류 추가</h4>
	      </div>
	      <div class="modal-body">
			<input type="text">
			<button type="button">중복확인</button>
	      </div>
	      <div class="modal-footer">
			<button type="button" class="btn btn-primary" onclick="">Close</button>
			<button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
</div>
</body>
</html>