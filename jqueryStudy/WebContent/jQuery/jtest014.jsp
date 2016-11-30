<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jtest014.jsp</title>
<style type="text/css">

   *
   {
      margin: 0px;
      padding: 0px;
   }
   
   ul
   {
      list-style: none;
   }

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="<%=cp %>/data/js/jquery.innerfade.js"></script>
<script type="text/javascript">

   $(document).ready(function()
   {
      $("#innerFade").innerfade(
      {      
               'speed':            'slow',
               'type':             'random',
               'timeout':          1000,
               'containerheight':  'auto',
               'runningclass':     'innerfade',
               'children':         null
      });      
   });

</script>
</head>
<body>

<ul id="innerFade">
   <li><img alt="" src="<%=cp %>/data/images/sample_img01.jpg"></li>
   <li><img alt="" src="<%=cp %>/data/images/sample_img02.jpg"></li>
   <li><img alt="" src="<%=cp %>/data/images/sample_img03.jpg"></li>
   <li><img alt="" src="<%=cp %>/data/images/sample_img04.jpg"></li>
   <li><img alt="" src="<%=cp %>/data/images/sample_img05.jpg"></li>
</ul>



</body>
</html>