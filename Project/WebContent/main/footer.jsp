<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=cp %>/css/hyuncss/bootstrap.css" rel="stylesheet">
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" >
<link href="<%=cp %>/css/hyuncss/main.css" rel="stylesheet">
<script src="<%=cp %>/js/mainjs/jquery.js"></script>
<script src="<%=cp %>/js/mainjs/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function()
{	//<<푸터영역 화살표>> 화면 맨위로 올라가게 하는 제이쿼리
	$('.gototop').click(function(event) {
		event.preventDefault();
		$('html, body').animate({
			scrollTop: $("body").offset().top
		}, 500);
	});	
});
</script>
</head>
<body>
	<footer id="footer" class="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                	<ul>
                        <li><a href="#"><i class="fa fa-male"></i> &nbsp;이준환</a> &nbsp;&nbsp;│</li>
                        <li><a href="#"><i class="fa fa-male"></i> &nbsp;정현석</a> &nbsp;&nbsp;│</li>
                        <li><a href="#"><i class="fa fa-male"></i> &nbsp;김영진</a> &nbsp;&nbsp;│</li>
                        <li><a href="#"><i class="fa fa-female"></i> &nbsp;이아름</a> &nbsp;&nbsp;│</li>
                        <li><a href="#"><i class="fa fa-male"></i> &nbsp;김현태</a>&nbsp;&nbsp;│</li>
                    </ul><br>
                    <ul>
                    	<li>
                    	주소 : 서울 강남구 테헤란로 132 한독약품빌딩 (지번 : 서울 강남구 역삼동 735-1)<br>
						TRY - CATCH 쌍용교육센터
                    	</li>
                    </ul><br>
                    <ul>
                   		<li> © 2016 Your My Sunshine. All Rights Reserved. </li>
                    </ul>
                </div>
                <div class="col-sm-6"><br>
                    <ul class="pull-right">
                        <li><a href="<%=cp %>/main/main.jsp">Home</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="<%=cp %>/UserQnaList.love">고객지원</a></li>
                        <li><a href="#">Contact Us</a></li>
                        <li><a id="gototop" class="gototop" href="#"><i class="icon-chevron-up"></i></a></li>
                    </ul>
                    <br><br>
					<ul class="social-icons pull-right">	
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
					</ul>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>