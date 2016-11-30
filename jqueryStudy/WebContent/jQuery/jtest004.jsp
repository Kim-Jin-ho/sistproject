<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jtest004.jsp</title>
<link rel="stylesheet" href="<%=cp %>/data/css/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<%-- <script type="text/javascript" src="<%=cp %>/data/js/jquery-1.12.3.min.js"></script> --%>
<script type="text/javascript">
	
$(function()
{
	var d = 500;
	
	$('#navigation a').each(function()
	{
	   //$(this).stop.animate({'marginTop' : '-80px'}, 500);
	   $(this).stop().animate({'marginTop' : '-80px'}, 120);
	   
	});
	$("#navigation > li").hover(function()
	{
	   $('a',$(this)).stop().animate({'marginTop' : '-2px'}, 200);
	   
	}, function()
	{
	   $('a', $(this)).stop().animate({'marginTop' : '-80px'}, 200);
	   
	}); 
	   
});
</script>
<style type="text/css">
	body
	{
		height: 2000px;		
	}
</style>
</head>
<body>
<div align="center">
	<table style="width: 700px; border: 0px; border-spacing: 0px; margin: 0px;">
		<tr>
			<td>
				<ul id="navigation">
					<li class="home"><a href=""><span>Home</span></a></li>
					<li class="about"><a href=""><span>About</span></a></li>
					<li class="search"><a href=""><span>Search</span></a></li>
					<li class="photos"><a href=""><span>Photos</span></a></li>
					<li class="rssfeed"><a href=""><span>Rssfeed</span></a></li>
					<li class="podcasts"><a href=""><span>Podcasts</span></a></li>
					<li class="contact"><a href=""><span>Contact</span></a></li>
				</ul>
			</td>
		</tr>
	</table>
</div>
</body>
</html>