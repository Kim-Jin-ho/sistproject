<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	String checkname = (String)session.getAttribute("checkname");
	String checknum = (String)session.getAttribute("checknum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=cp %>/css/hyuncss/bootstrap.css" rel="stylesheet">
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" >
<script src="<%=cp %>/js/mainjs/jquery.js"></script>
<script src="<%=cp %>/js/mainjs/bootstrap.min.js"></script>
</head>
<body>
	<header class="navbar-inverse navbar-fixed-top" >
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="<%=cp %>/main/main.jsp"><img src="#" alt="logo"></a>
            </div>
	            <div>
				<ul class="nav navbar-nav navbar-right">
					<%if(checkname==null||checkname=="") 
					{%>
						<li><a href="<%=cp %>/main/login.jsp"><i class="fa fa-lock"></i> 로그인</a></li>
						<li><a href="<%=cp %>/signupcmpnycontroller.love?num=1"><i class="fa fa-user"></i> Sign up</a></li>
						
	                <%}
					else{
						if(checknum=="1")
						{ %>
						<li class="checkgnb"><a href="#"><%=checkname %>님 환영합니다</a></li>
						<li class="checkgnb"><a href="<%=cp %>/logoutcontroller.love"><i class="fa fa-lock"></i> 로그아웃</a></li>	
						<li class="checkgnb"><a href="<%=cp %>/UserReservationList.love"><i class="fa fa-heart"></i> 마이페이지</a></li>
						
					  <%}
				        if(checknum=="2")
						{ %>
						<li class="checkgnb"><a href="#"><%=checkname %>업체의 방문을 환영합니다</a></li>
						<li class="checkgnb"><a href="<%=cp %>/logoutcontroller.love"><i class="fa fa-lock"></i> 로그아웃</a></li> 
						<li class="checkgnb"><a href="<%=cp %>/company/CompanyMain.jsp"><i class="fa fa-share"></i> 기업페이지</a></li>                 
	                    
					  <%}
				      	if(checknum=="0")
						{ %>
						<li class="checkgnb"><a href="#"><%=checkname %>님의 방문을 환영합니다</a></li>
						<li class="checkgnb"><a href="<%=cp %>/logoutcontroller.love"><i class="fa fa-lock"></i> 로그아웃</a></li> 
						<li class="checkgnb"><a href="<%=cp %>/AdminCoMemberList.love"><i class="fa fa-share"></i>관리자페이지</a></li>
						
					  <%}
				      }%>
				      	<li class="checkgnb"><a href="<%=cp %>/UserQnaList.love"><i class="fa fa-cogs"></i> 고객지원</a></li>
				</ul>
			</div>
		</div>
    </header><!--/header-->
</body>
</html>