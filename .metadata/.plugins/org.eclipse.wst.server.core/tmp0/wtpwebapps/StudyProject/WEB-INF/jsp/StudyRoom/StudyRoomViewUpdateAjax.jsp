<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String cp = request.getContextPath(); %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <!-- Google Font -->
    <link href='http://fonts.googleapis.com/css?family=Dosis:300,400,500,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <!-- Icon Font-->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.default.css">
    <!-- Animate CSS-->
    <link rel="stylesheet" href="css/animate.css">

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Style -->
    <link href="css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="<%=cp%>/css/StudyRoomView.css">
	
<script type="text/javascript" src="../OpenStudy/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="ajax.js"></script>




<c:forEach var="dto" items="${reList }">
	
	<c:if test="${scId == dto.scid}">
		
		<div class="col-xs-11">
			<span class="input-group-btn">
				<textarea  class="col-xs-10 form-control" rows="5" placeholder="comment" id="updateSrcontent" name="updateSrcontent">${dto.srcontent}</textarea>
				<button class="updateBtn btn btn-success" type="button" style="height: 114px;" data-scid="${dto.scid }">등록</button><i class="fa fa-edit spaceLeft"></i>
			</span>
			 	
		</div>
		

				

		
	</c:if>
	<c:if test="${scId != dto.scid}">
		<div>
		
		<div class="col-xs-8">
			${dto.srwid} ${dto.srwdate } 
		</div>
		
		<div class="col-xs-4">
			<button type="button" id="update" data-scid="${dto.scid }" class="btn btn-sm btn-default">수정</button>
			<button type="button" id="delete" data-scid="${dto.scid }" class="btn btn-sm btn-default">삭제</button>
			<button type="button" class="btn btn-sm btn-warning">추천 ${dto.srscore }</button>
		</div>
		<div class="col-xs-12">
			${dto.srcontent}
			
			<hr>
		</div>
		</div>
	</c:if>
</c:forEach>	