<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 네비바</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">하기스터디</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
     
      <ul class="nav navbar-nav">       
        <!-- <li class="avtive"><a href="#">Link <span class="sr-only">(current)</span></a></li> -->
        <li><a href="#">공지사항</a></li>        
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">스터디 정보<span class="caret"></span></a>         
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>  
        
        <li><a href="#">스터디룸 정보</a></li>   
        <li><a href="#">Q & A</a></li>          
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li><a href="join3_2.jsp">회원가입</a></li>
        <li><a href="#">로그인</a></li>
      </ul>
      
    </div>
  </div>
</nav>


</body>
</html>