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
<link href="<%=cp %>/css/hyuncss/main.css" rel="stylesheet">
<link href="<%=cp %>/css/font-awesome.min.css" rel="stylesheet">
<script src="<%=cp %>/js/mainjs/jquery.js"></script>
<script src="<%=cp %>/js/mainjs/bootstrap.min.js"></script>
<script type="text/javascript">
jQuery(function($) {
//메인슬라이드!!===================================================================================
	$(function(){
		$('#main-slider.carousel').carousel({
			interval: 8000
		});
	});

	$( '.centered' ).each(function( e ) {
		$(this).css('margin-top',  ($('#main-slider').height() - $(this).height())/2);
	});

	$(window).resize(function(){
		$( '.centered' ).each(function( e ) {
			$(this).css('margin-top',  ($('#main-slider').height() - $(this).height())/2);
		});
	});
//===============================================================================================
});	
</script>
<body>
	<!-- 첫번째 헤더영역 -->
	<c:import url="${cp }/main/mainGnb.jsp"></c:import>
    
    <!-- 메인 메뉴영역 -->
    <c:import url="${cp }/main/mainMenu.jsp"></c:import>
    <!-- 메인슬라이드 영역 -->
    <section id="main-slider" class="no-margin">
        <div class="carousel slide wet-asphalt">
            <ol class="carousel-indicators">
                <li data-target="#main-slider" data-slide-to="0" class="active"></li>
                <li data-target="#main-slider" data-slide-to="1"></li>
                <li data-target="#main-slider" data-slide-to="2"></li>
            </ol>
            <!-- 메인슬라이드 영역1 (동영상) -->
            <div class="carousel-inner">
                <div class="item active" style="background-image: url(<%=cp %>/images/main/slider3.jpg)">
                    <div class="container">
                        <div class="row">
                        	<div class="col-sm-6">
                                <div class="carousel-content centered">
                                    <h2 class="animation animated-item-1">Wellcome To Your My Sunshine</h2>
                                    <h4 class="animation animated-item-2">이미지 넣기 이미지넣기!!!</h4>
                                    <br>
                                    <a class="btn btn-md animation animated-item-3" href="#">Learn More</a>
                                </div>
                            </div>
                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="centered">
                                    <div class="embed-container">
                                        <iframe src="https://player.vimeo.com/video/94837904" width="640" height="360"></iframe>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 메인슬라이드 영역2 -->
                <div class="item" style="background-image: url(<%=cp %>/images/main/slider2.jpg)">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="carousel-content center centered">
                                    <h2 class="animation animated-item-1">Wellcome To Your My Sunshine</h2>
                                    <h4 class="animation animated-item-2">이미지 넣기 이미지넣기!!!</h4>
                                    <br>
                                    <a class="btn btn-md animation animated-item-3" href="#">Learn More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 메인슬라이드 영역3 -->
                <div class="item" style="background-image: url(<%=cp %>/images/main/slider1.jpg)">
                    <div class="container">
                        <div class="row">
                        	<div class="col-sm-12">
                                <div class="carousel-content centered">
                                    <h2 class="animation animated-item-1">Wellcome To Your My Sunshine</h2>
                                    <h4 class="animation animated-item-2">이미지 넣기 이미지넣기!!!</h4>
                                    <br>
                                    <a class="btn btn-md animation animated-item-3" href="#">Learn More</a>
                                </div>
                            </div>    
                        </div>
                    </div>
                </div><!-- 메인슬라이드 영역1(동영상)END -->
            </div><!-- 메인슬라이드 영역2 END -->
        </div><!-- 메인슬라이드 영역3 END -->
        <a class="prev hidden-xs" href="#main-slider" data-slide="prev">
            <i class="icon-angle-left"></i>
        </a>
        <a class="next hidden-xs" href="#main-slider" data-slide="next">
            <i class="icon-angle-right"></i>
        </a>
    </section><!-- 메인슬라이드 영역 END -->
  

	<!-- 메인 섹션 VIEW영역  -->
	<div id="pricing">
        <div class="container">
            <div class="center">
                <h2>내가직접 고르는 인기브랜드 웨딩 컬렉션</h2><br>
            </div><!--/.center-->   
            <div class="gap"></div>
            <div id="pricing-table" class="row">
                <div class="col-md-3 col-xs-6">
                    <ul class="plan plan1">
                        <li class="plan-name">
                            <h3>WeddingHall<br>이미지넣을자리</h3>
                        </li>
                        <li class="plan-action">
                            <a href="#" class="btn btn-primary btn-md">DetailView</a>
                        </li>
                    </ul>
                </div><!--/.col-md-3-->
                <div class="col-md-3 col-xs-6">
                    <ul class="plan plan2 featured">
                        <li class="plan-name">
                            <h3>Studio<br>이미지넣을자리</h3>
                        </li>
                        <li class="plan-action">
                            <a href="#" class="btn btn-primary btn-md">DetailView</a>
                        </li>
                    </ul>
                </div><!--/.col-md-3-->
                <div class="col-md-3 col-xs-6">
                    <ul class="plan plan3">
                       <li class="plan-name">
                            <h3>Dress<br>이미지넣을자리</h3>
                        </li>
                        <li class="plan-action">
                            <a href="#" class="btn btn-primary btn-md">DetailView</a>
                        </li>
                    </ul>
                </div><!--/.col-md-3-->
                <div class="col-md-3 col-xs-6">
                    <ul class="plan plan4">
                       <li class="plan-name">
                            <h3>Hair&MakeUp<br>이미지넣을자리</h3>
                        </li>
                        <li class="plan-action">
                            <a href="#" class="btn btn-primary btn-md">DetailView</a>
                        </li>
                    </ul>
                </div>
            </div> 
        </div>
    </div>

	
   <!-- 메인풋터 영역 -->
   <c:import url="${cp }/main/footer.jsp"/>
   
</body>
</html>