<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="http://bootswatch.com/paper/bootstrap.min.css" >
<link rel="stylesheet" href="http://bootswatch.com/paper/bootstrap.css" > -->
    <!-- Google Font -->
    <link href='http://fonts.googleapis.com/css?family=Dosis:300,400,500,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Font Awesome -->


    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

     <!-- Preloader -->
 <link rel="stylesheet" href="css/preloader.css" type="text/css" media="screen, print"/> 

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

    <!-- Responsive CSS -->
    <!-- <link href="css/responsive.css" rel="stylesheet"> -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/lte-ie7.js"></script>
	  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
<script type="text/javascript" src="../OpenStudy/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">

/* 	function result(msg)
	{
		//sub()가 실행되면 결과 값을 가지고 와서 action 을 취해주는 callback 함수
		var sel = document.f.sel2;
		$("#sp1").html(msg); //innerHTML 을 이런 방식으로 사용함
		//id 는 $("#id")   name 의 경우 $("name") 으로 접근함
	} */
	$(document).ready(function()
	{
		$("#searchKey").change(function()
		{
			alert($("#searchKey").val());
			ajaxRequest1();
		})
	})
 	function ajaxRequest1()
	{
	   $.post("StudyRoomList.jsp", { "searchKey" : $("#searchKey").val() }, function(data)
	   {
	      $("#searchValue").html(data);   
	   });
	}  
/* 	
	function ajaxRequest()
	{
	   $.post("searchForm.room"	, { regionId : $("#region").val() }, function(data)
	   {
	      $("#submain").html(data);   
	   });
	}
	 */
	function sendIt()
	{
		var f = document.searchForm;
		var searchKey = $("#searchKey").val();
		
		var searchValue = $("#searchValue").val();
		if (searchKey=="")
		{
			f.action="StudyRoomMain.room"
		}
		else
		{
			f.action = "StudyRoomMain.room?searchKey="+searchKey+"&searchValue="+searchValue;	
		}
		
		f.submit();
	}
</script>
</head>
<body>
    <header id="HOME" style="background-position: 50% -125px;">
    	<section>
	        <div class="section_overlay">
<div class="row">
	<div class="form-group col-xs-12">
	   <div class="">
	      <c:import url="StudyRoomTop_member.jsp"></c:import>
	   </div>
	</div>
</div>

	            <div class="container">
	                <div class="row">
	                    <div class="col-md-12 text-center">
	                        <div class="home_text wow fadeInUp animated">
	                            <h2>Welcome StudyRoomPage</h2>
	                            <img src="images/shape.png" alt="">                        
	                        </div>
	                    </div>
	                </div>
	            </div>

	            <div class="container">
	                <div class="row">
	                    <div class="col-md-12 text-center">
	                        <div class="scroll_down">
                            <a href="#SERVICE"><img src="images/scroll.png" alt=""></a>
	                            <h4>Scroll Down</h4>
	                        </div>
	                    </div>
	                </div>
	            </div>            
	        </div>  
	    </section>         
    </header>
    

    <section class="testimonial text-center wow fadeInUp animated" id="TESTIMONIAL">
        <div class="container">
            <div class="icon">
                <i class="icon-quote"></i>
            </div>
            <div class="owl-carousel">
                <div class="single_testimonial text-center wow fadeInUp animated">
                    <p>설명</p>
                    <h4>- 진호</h4>
                </div>
                <div class="single_testimonial text-center">
                    <p>힘들구나</p>
                    <h4>- 성찬</h4>
                </div>
            </div>            
        </div>
    </section>



<!-- =========================
     SCRIPTS 
============================== -->


    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nicescroll.js"></script>
    <script src="js/owl.carousel.js"></script>
    <script src="js/wow.js"></script>
    <script src="js/script.js"></script>


<c:import url="/WEB-INF/jsp/import/copyright.jsp"></c:import>

</body>

</html>