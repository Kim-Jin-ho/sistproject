<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String admin = (String)session.getAttribute("admin");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.3/jquery.min.js"></script>
<script type="text/javascript">

	

</script>
</head>
<body>
<footer>
    <div class="container">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="footer_logo   wow fadeInUp animated">
                        <img src="images/logo2.png" alt="">
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center   wow fadeInUp animated">
                    <div class="social">
                        <h2>Follow Me on Here</h2>
                        <ul class="icon_list">
                            <li><a href="https://www.facebook.com/kim.jinho.564" target="_blank"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="https://www.facebook.com/kim.jinho.564" target="_blank"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="https://www.facebook.com/kim.jinho.564"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="copyright_text   wow fadeInUp animated">
                        <p>&copy; STUDY 2016. All Right Reserved By
                        <c:if test="${admin!='admin' }">
                        	<a href="Admin_login_form.room">JH*2+AREUM+YUMI</a>
                        </c:if>
                        
                        <c:if test="${admin=='admin' }">
                         	<a href="Admin_logout.room" id="logout">LOGOUT</a>
                        </c:if>
                         </p>
                        <p>SO HARD PROJECT</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>


</body>
</html>