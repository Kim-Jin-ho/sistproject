/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.32
 * Generated at: 2016-07-18 03:56:05 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.main;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class userJoin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/standard.jar", Long.valueOf(1465350034000L));
    _jspx_dependants.put("jar:file:/C:/sistproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Project/WEB-INF/lib/standard.jar!/META-INF/c.tld", Long.valueOf(1098678690000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");

	String cp = request.getContextPath();

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link href=\"");
      out.print(cp );
      out.write("/css/hyuncss/bootstrap.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"");
      out.print(cp );
      out.write("/css/font-awesome.min.css\" rel=\"stylesheet\">\r\n");
      out.write("<script src=\"");
      out.print(cp );
      out.write("/js/mainjs/jquery.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(cp );
      out.write("/js/mainjs/bootstrap.min.js\"></script>\r\n");
      out.write("<script src=\"http://dmaps.daum.net/map_js_init/postcode.v2.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(cp );
      out.write("/js/userjs/jquery.countdownTimer.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("var idcheck= false; //id중복 및 유효성 확인 변수\r\n");
      out.write("var pwcheck= false; //pw유효성 확인 변수\r\n");
      out.write("var pwcheck_ok= false; //pw 재확인 변수\r\n");
      out.write("var telcheck= false; //핸드폰번호 유효성 확인 변수(중복검사도 추가해야하나?)\r\n");
      out.write("var telcheck_ok= false; //핸드폰인증번호 확인 변수\r\n");
      out.write("\r\n");
      out.write("$(document).ready(function()\r\n");
      out.write("{\t\r\n");
      out.write("\tif($('#submitbutton').val()==1)\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"Your My Sunshine의 회원이 되신것을 축하합니다.\");\r\n");
      out.write("\t\tlocation.href=\"");
      out.print(cp );
      out.write("/main/login.jsp\";\r\n");
      out.write("\t}\r\n");
      out.write("\t//① 아이디 중복 및 유효성검사=======================================================================================\t\r\n");
      out.write("\t$('#id').keyup(function() \r\n");
      out.write("\t{\r\n");
      out.write("\t var reg_id = /^[aA-zZ0-9_-]{8,16}$/; //아이디 유효성검사 변수\r\n");
      out.write("\t if(!reg_id.test($(\"#id\").val())){\r\n");
      out.write("\t\t idcheck=false;\r\n");
      out.write("\t\t $('#id_check').html(\"※ 아이디는 8-16자 이여야 하며 \\n\" \r\n");
      out.write("\t\t\t\t + \"영문,마침표, '-', '_'를 제외한 문자는 사용하실수 없습니다.\").css(\"color\",\"black\");\r\n");
      out.write("\t }\r\n");
      out.write("\t else{ //유저ID가 중복되는지 확인하고 오는 AJAX \r\n");
      out.write("\t \t $.post(\"");
      out.print(cp );
      out.write("/userinsertcheck.love\", { \"idcheck\" : $('#id').val() }, function(args){\t\t\t\t \r\n");
      out.write("\t \t var idkk = args.trim();//반환된값을 변수에 저장하고\t\t\t\t\t\t\r\n");
      out.write("\t \t if (idkk==1){ //값이 있다면  \r\n");
      out.write("\t\t \t$('#id_check').html(\"※ 중복된 아이디 입니다. 다른 아이디를 입력해 주세요\").css(\"color\",\"red\");\r\n");
      out.write("\t\t }\t\r\n");
      out.write("\t\t else{\r\n");
      out.write("\t\t\tidcheck = true;\r\n");
      out.write("\t\t\t$('#id_check').html(\"※ 사용가능한아이디입니다.\").css(\"color\",\"blue\");\r\n");
      out.write("\t\t }\t\r\n");
      out.write("\t\t });\t\r\n");
      out.write("\t }\r\n");
      out.write("\t });\r\n");
      out.write("\t\r\n");
      out.write("\t //② 비밀번호유효성검사=======================================================================================\r\n");
      out.write("\t $('#password').keyup(function() \r\n");
      out.write("\t {\r\n");
      out.write("\t\tvar reg_pw = /^.*(?=.{8,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;  \r\n");
      out.write("\t\tif(!reg_pw.test($(\"#password\").val())){\r\n");
      out.write("\t\t\tpwcheck=false;\r\n");
      out.write("\t\t\t$('#password_pw').html(\"※ 비밀번호 형식이 잘못되었습니다 (영문,숫자를 혼합하여 8~16자 이내)\").css(\"color\",\"red\");\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse{\r\n");
      out.write("\t\t\tpwcheck=true;\r\n");
      out.write("\t\t\t$('#password_pw').html(\"※ 안전한 비밀번호 입니다.\").css(\"color\",\"blue\");\r\n");
      out.write("\t\t}\t\r\n");
      out.write("\t });\r\n");
      out.write("\t \r\n");
      out.write("\t //③ 비밀번호 확인======================================================================================= \r\n");
      out.write("\t $('#password_chk').keyup(function() \r\n");
      out.write("\t {\r\n");
      out.write("      if ($('#password').val() != $('#password_chk').val()){\r\n");
      out.write("      \t   $('#pw_check_ok').html(\"※ 비밀번호가 일치하지 않습니다.\").css(\"color\",\"red\"); // 레이어에 HTML 출력\r\n");
      out.write("       \t   pwcheck_ok = false;\r\n");
      out.write("          }\r\n");
      out.write("      else{\r\n");
      out.write("    \t  pwcheck_ok=true;\r\n");
      out.write("          $('#pw_check_ok').text(\"※ 비밀번호가 일치 합니다.\").css(\"color\",\"blue\"); // 레이어에 텍스트 출력\r\n");
      out.write("      \t  }\r\n");
      out.write("\t });  \r\n");
      out.write("\t \r\n");
      out.write("\t //④ 이메일 셀렉트값 선택시 값이 들어오도록 선택하는 쿼리=====================================================\r\n");
      out.write("\t $('#email_select').click(function() \r\n");
      out.write("\t {\r\n");
      out.write("\t\t$('#email2').val($('#email_select').val());\t\t \r\n");
      out.write("\t });\r\n");
      out.write("\t\t\t \r\n");
      out.write("\t//⑤ 휴대폰인증번호 일치 확인=======================================================================================\r\n");
      out.write("\t$('#tel_send_check').click(function(){\r\n");
      out.write("    if ($('#telhidden').val() != $('#tel_check').val()){\r\n");
      out.write("    \ttelcheck_ok=false;\r\n");
      out.write("        $('#tel_check_check').html(\"※ 인증번호가 일치하지 않습니다.\").css(\"color\",\"red\"); // 레이어에 HTML 출력\r\n");
      out.write("    \t}\r\n");
      out.write("    else{\r\n");
      out.write("    \ttelcheck_ok=true;\r\n");
      out.write("        $('#tel_check_check').text(\"※ 인증이완료되었습니다.\").css(\"color\",\"blue\"); // 레이어에 텍스트 출력\r\n");
      out.write("    \t}\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t//⑥이름 공백여부확인\r\n");
      out.write("\t$('#name').keyup(function(){\r\n");
      out.write("\tif(!($(\"#name\").val()==\"\")) //이름입력이 공백이 아닐 경우엔\r\n");
      out.write("\t\t$('#name_check_ok').html(\"\").css(\"color\",\"red\");\r\n");
      out.write("\t});\r\n");
      out.write("});   \r\n");
      out.write("\r\n");
      out.write("//⑦ 우편번호 확인 함수=======================================================================================\r\n");
      out.write("function addrfun(){\r\n");
      out.write("new daum.Postcode({\r\n");
      out.write("    oncomplete: function(data) {\r\n");
      out.write("        document.getElementsByName(\"strZipcode_1\")[0].value = data.zonecode;\r\n");
      out.write("        document.getElementsByName(\"strZipcode_2\")[0].value = data.roadAddress;\r\n");
      out.write("    }\r\n");
      out.write("}).open();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("//⑧ 전화번호 인증번호 생성 및 유효성 확인=======================================================================================\r\n");
      out.write("function telsend()\r\n");
      out.write("{\r\n");
      out.write("\tvar tel1 = document.getElementById(\"tel1\").value;\r\n");
      out.write("\tvar tel2 = document.getElementById(\"tel2\").value;\r\n");
      out.write("\tvar tel3 = document.getElementById(\"tel3\").value;\r\n");
      out.write("\tvar regExOnlyNum=/^[0-9]*$/;\r\n");
      out.write("\t\t\r\n");
      out.write("\tif(tel1.length==3 && tel2.length==4 && tel3.length==4 && regExOnlyNum.test(tel1) && regExOnlyNum.test(tel2) && regExOnlyNum.test(tel3))\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\t$('#tel_check_check_check').html(\"\").css(\"color\",\"red\");\r\n");
      out.write("\t\t\ttelcheck=true;\r\n");
      out.write("\t\t\t/* 인증번호 난수발생 */\r\n");
      out.write("\t\t\trandomA = ((Math.random()+0.1)*1000000);\r\n");
      out.write("\t\t\trandomA = Math.trunc(randomA);\r\n");
      out.write("\t\t\talert(randomA); //test\t\r\n");
      out.write("\t\t\tdocument.getElementById(\"telhidden\").value = randomA;\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t$(\"#tel_check_check\").countdowntimer({\r\n");
      out.write("\t\t\t\tminutes : 3,\r\n");
      out.write("\t\t\t\tsize : \"lg\",\r\n");
      out.write("\t\t        timeUp : timeIsUp\r\n");
      out.write("\t\t\t}); \r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\telse{\r\n");
      out.write("\t\ttelcheck=false;\r\n");
      out.write("\t    $('#tel_check_check_check').html(\"※ 잘못된 전화번호 입니다.\").css(\"color\",\"red\");\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("//⑨ 인증시간 만료 함수정의=======================================================================================\r\n");
      out.write("function timeIsUp()\r\n");
      out.write("{\r\n");
      out.write("\t alert('인증시간이 만료되었습니다.');\r\n");
      out.write("\t randomA = \"\";\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("//⑩ 유효성검사 함수정의=======================================================================================\r\n");
      out.write("function sendIt()\r\n");
      out.write("{\r\n");
      out.write("\tvar regExEmail=/^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$/; //이메일유효성 \r\n");
      out.write("\tvar email = $(\"#email1\").val()+\"@\"+$(\"#email2\").val(); //이메일 값\r\n");
      out.write("\tif($(\"#id\").val()==\"\"){ //아이디가 공백일경우엔\r\n");
      out.write("\t\t$('#id_check').html(\"※ 아이디를 입력해주세요.\").css(\"color\",\"red\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\tif($(\"#password\").val()==\"\"){ //비밀번호가 공백일 경우엔\r\n");
      out.write("\t\t$('#password_pw').html(\"※ 비밀번호를 입력해주세요.\").css(\"color\",\"red\");\r\n");
      out.write("\t\treturn;\t\r\n");
      out.write("\t\t}\t\r\n");
      out.write("\tif($(\"#password_chk\").val()==\"\"){ //비밀번호 재확인이 공백일 경우엔\r\n");
      out.write("\t\t$('#pw_check_ok').html(\"※ 비밀번호를 확인해주세요.\").css(\"color\",\"red\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\tif($(\"#name\").val()==\"\"){ //이름입력이 공백일 경우엔\r\n");
      out.write("\t\t$('#name_check_ok').html(\"※ 이름을 입력해 주세요.\").css(\"color\",\"red\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t\t}/* \r\n");
      out.write("\tif($(\"#date\").val()==\"\"){ //생년월일이 공백일 경우엔\r\n");
      out.write("\t\t$('#date_check_ok').html(\"※ 생년월일을 입력해 주세요.\").css(\"color\",\"red\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t\t} */\r\n");
      out.write("\tif($(\"#tel1\").val()==\"\"||$(\"#tel2\").val()==\"\"||$(\"#tel3\").val()==\"\"){ //휴대폰번호가 공백일 경우엔\r\n");
      out.write("\t\t$('#tel_check_check_check').html(\"※ 휴대폰번호를 입력해 주세요.\").css(\"color\",\"red\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\tif($(\"#email1\").val()==\"\"||$(\"#email2\").val()==\"\"){ //이메일주소가 공백일 경우에\r\n");
      out.write("\t\t$('#email_check_confirm').html(\"※ 이메일주소를 입력해 주세요.\").css(\"color\",\"red\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\tif(!regExEmail.test(email)){ //이메일유효성확인\r\n");
      out.write("\t\t$('#email_check_confirm').html(\"※ 잘못된 이메일 형식 입니다.\").css(\"color\",\"red\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\tif(regExEmail.test(email)) //이메일유효성확인\r\n");
      out.write("\t\t$('#email_check_confirm').html(\"※ 이메일 입력이 완료되었습니다.\").css(\"color\",\"blue\");\r\n");
      out.write("\tif(idcheck==false||pwcheck==false||pwcheck_ok==false||telcheck==false||telcheck_ok==false)\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\tif($(\"#strZipcode_1\").val()==\"\"||$(\"#strZipcode_2\").val()==\"\"||$(\"#strZipcode_3\").val()==\"\"){ //주소가 공백일 경우엔\r\n");
      out.write("\t\t$('#addr_check_confirm').html(\"※ 주소를 입력해주세요.\").css(\"color\",\"red\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\telse \t\r\n");
      out.write("\t\t$(\"#join_main\").submit();\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t");
      if (_jspx_meth_c_005fimport_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t<br>\r\n");
      out.write("\t<section>\r\n");
      out.write("\t<form action=\"");
      out.print(cp );
      out.write("/userinsert.love\" id=\"join_main\" class=\"form-horizontal\">\r\n");
      out.write("\t\t<!-- 유저회원가입 입력 폼 -->\r\n");
      out.write("\t\t<!-- 아이디 입력 -->\r\n");
      out.write("\t\t<div class=\"form-group\">\r\n");
      out.write("\t    \t<label for=\"id\" class=\"col-sm-2 control-label\">ID 입력 : </label>\r\n");
      out.write("\t    \t<div class=\"col-sm-6\">\r\n");
      out.write("\t      \t<input type=\"text\" class=\"form-control\" name=\"id\" id=\"id\" maxlength=\"16\">\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<label class=\"control-label\"><span id=\"id_check\" class=\"check_css\">※ 최소 8자 이상~16자 이하의 영문, 숫자, _만 사용할 수 있습니다.</span></label>\r\n");
      out.write("  \t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t<!-- PW 입력 -->\t\r\n");
      out.write("\t\t<div class=\"form-group\">\r\n");
      out.write("\t    \t<label for=\"password\" class=\"col-sm-2 control-label\">PW 입력 : </label>\r\n");
      out.write("\t    \t<div class=\"col-sm-6\">\r\n");
      out.write("\t      \t<input type=\"password\" class=\"form-control\" name=\"password\" id=\"password\" maxlength=\"16\">\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<label class=\"control-label\"><span id = \"password_pw\" class=\"check_css\">※ 최소 8자 이상 ~ 16자 이하로 등록해 주세요.</span></label>\r\n");
      out.write("  \t\t</div>\r\n");
      out.write("  \t\t\t\t\t\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- PW 확인 -->\r\n");
      out.write("\t\t<div class=\"form-group\">\r\n");
      out.write("\t    \t<label for=\"passwordcheck\" class=\"col-sm-2 control-label\">PW 확인: </label>\r\n");
      out.write("\t    \t<div class=\"col-sm-6\">\r\n");
      out.write("\t      \t<input type=\"password\" class=\"form-control\" name=\"password_chk\" id=\"password_chk\" maxlength=\"16\">\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<label class=\"control-label\"><span id=\"pw_check_ok\" class=\"check_css\">※ 비밀번호를 다시 한번 입력해 주세요.</span></label>\r\n");
      out.write("  \t\t</div>\r\n");
      out.write("  \t\t\r\n");
      out.write("  \t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t<!-- 이름 입력 -->\t\t\t\r\n");
      out.write("\t\t<div class=\"form-group\">\r\n");
      out.write("\t    \t<label for=\"name\" class=\"col-sm-2 control-label\">이름 입력 : </label>\r\n");
      out.write("\t    \t<div class=\"col-sm-6\">\r\n");
      out.write("\t      \t<input type=\"text\" class=\"form-control\" name=\"name\" id=\"name\" maxlength=\"10\">\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<label class=\"control-label\"><span id=\"name_check_ok\" class=\"check_css\"></span></label>\r\n");
      out.write("  \t\t</div>\r\n");
      out.write("  \t\t\r\n");
      out.write("  \t\t\t\t\t\r\n");
      out.write("\t\t<!-- 생년월일 입력 -->\t\t\t\r\n");
      out.write("\t\t<div class=\"form-group\">\r\n");
      out.write("\t    \t<label for=\"date\" class=\"col-sm-2 control-label\">생년월일 : </label>\r\n");
      out.write("\t    \t<div class=\"col-sm-6\">\r\n");
      out.write("\t      \t<input type=\"date\" class=\"form-control\" name=\"date\" id=\"date\">\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<label class=\"control-label\"><span id=\"date_check_ok\" class=\"check_css\"></span></label>\r\n");
      out.write("  \t\t</div>\r\n");
      out.write("  \t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<!-- 휴대폰번호 입력 -->\r\n");
      out.write("\t\t<div class=\"form-group\">\r\n");
      out.write("\t    \t<label for=\"telnum\" class=\"col-sm-2 control-label\">휴대폰번호 : </label>\r\n");
      out.write("\t    \t<div class=\"col-sm-1\">\r\n");
      out.write("\t      \t<input type=\"tel\" name=\"tel1\" id=\"tel1\" value=\"010\" maxlength=\"3\" class=\"form-control\">\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<div class=\"col-sm-1\">\r\n");
      out.write("\t      \t<input type=\"tel\" name=\"tel2\" id=\"tel2\" maxlength=\"4\" class=\"form-control\">\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<div class=\"col-sm-1\">\r\n");
      out.write("\t      \t<input type=\"tel\" name=\"tel3\" id=\"tel3\" maxlength=\"4\" class=\"form-control\">\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<div class=\"col-sm-1\">\r\n");
      out.write("\t    \t<button type=\"button\" name=\"tel_send\" id=\"tel_send\" onclick=\"telsend();\" class=\"btn btn-primary\">인증번호전송</button>\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<div>\r\n");
      out.write("\t    \t<label class=\"control-label\"><span id=\"tel_check_check_check\" class=\"check_css\"></span></label>\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<input type=\"text\" id=\"telhidden\" hidden=\"hidden\" value=\"8521\">\r\n");
      out.write("  \t\t</div>\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t \r\n");
      out.write("\t\t<!-- 인증번호 입력 -->\t\t\t\r\n");
      out.write("\t\t<div class=\"form-group\">\r\n");
      out.write("\t    \t<label for=\"telnumcheck\" class=\"col-sm-2 control-label\">인증번호 : </label>\r\n");
      out.write("\t    \t<div class=\"col-sm-2\">\r\n");
      out.write("\t      \t<input type=\"text\" name=\"tel_check\" id=\"tel_check\" placeholder=\"인증번호 입력\" class=\"form-control\">\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<div class=\"col-sm-1\">\r\n");
      out.write("\t    \t<button type=\"button\" name=\"tel_send_check\" id=\"tel_send_check\" class=\"btn btn-primary\">인증번호확인</button>\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<div>\r\n");
      out.write("\t    \t<label class=\"control-label\"><span id=\"tel_check_check\" class=\"check_css\"  style=\"color: blue;\"></span></label>\r\n");
      out.write("\t    \t</div>\t\r\n");
      out.write("  \t\t</div>\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t<!-- 이메일 입력 -->\t\t\t\r\n");
      out.write("\t\t<div class=\"form-group\">\r\n");
      out.write("\t    \t<label for=\"email\" class=\"col-sm-2 control-label\">이메일 : </label>\r\n");
      out.write("\t    \t<div class=\"col-sm-2\">\r\n");
      out.write("\t      \t<input type=\"text\" class=\"form-control\" name=\"email1\" id=\"email1\" maxlength=\"14\"> \r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<div class=\"col-sm-2\">\r\n");
      out.write("\t\t    \t<div class=\"input-group\">\r\n");
      out.write("\t\t      \t \t<span class=\"input-group-addon\">@</span><input type=\"text\" class=\"form-control\" name=\"email2\" id=\"email2\"> \r\n");
      out.write("\t\t    \t</div>\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<div class=\"col-sm-2\">\r\n");
      out.write("\t    \t<select class=\"form-control email_select\" name=\"email_select\" id=\"email_select\">\r\n");
      out.write("\t\t\t  \t<option value=\"\">선택하세요</option>\r\n");
      out.write("\t\t\t  \t<option value=\"hanmail.net\">hanmail.net</option>\r\n");
      out.write("\t\t\t  \t<option value=\"nate.com\">nate.com</option>\r\n");
      out.write("\t\t\t  \t<option value=\"empal.com\">empal.com</option>\r\n");
      out.write("\t\t\t\t<option value=\"hotmail.com\">hotmail.com</option>\r\n");
      out.write("\t\t\t\t<option value=\"naver.com\">naver.com</option>\r\n");
      out.write("\t\t\t\t<option value=\"gmail.com\">gmail.com</option>\r\n");
      out.write("\t\t\t\t<option value=\"\">(직접입력)</option>\t\t\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<div>\r\n");
      out.write("\t    \t<label class=\"control-label\"><span id=\"email_check_confirm\" class=\"check_css\"></span></label>\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("  \t\t</div>\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t<!-- 성별 체크 -->\t\t\t\r\n");
      out.write("\t\t<div class=\"form-group\">\t\r\n");
      out.write("\t\t\t<label for=\"gender\" class=\"col-sm-2 control-label\">성&nbsp;별 : </label>\r\n");
      out.write("\t\t\t<div class=\"col-sm-6\">\r\n");
      out.write("\t\t\t<label class=\"radio-inline\">\r\n");
      out.write("\t\t\t\t<input type=\"radio\" name=\"gender\" id=\"gender\" value=\"1\" checked=\"checked\"> 여성\t</label>\r\n");
      out.write("\t\t\t<label class=\"radio-inline\">\r\n");
      out.write("\t\t\t\t<input type=\"radio\" name=\"gender\" id=\"gender\" value=\"2\"> 남성\t</label>\r\n");
      out.write("\t\t\t</div>\t\r\n");
      out.write("\t\t</div>\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- 우편번호 및 주소 입력 -->\t\t\r\n");
      out.write("\t\t<div class=\"form-group\">\r\n");
      out.write("\t    \t<label for=\"addrNum\" class=\"col-sm-2 control-label\">우편번호 : </label>\r\n");
      out.write("\t    \t<div class=\"col-sm-5\">\r\n");
      out.write("\t      \t<input type=\"text\" class=\"form-control\" name=\"strZipcode_1\" id=\"strZipcode_2\" maxlength=\"50\">\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<div class=\"col-sm-1\">\r\n");
      out.write("\t    \t<button type=\"button\" class=\"button red mr5 btn btn-primary\" id=\"btnAddr\" onclick=\"addrfun();\">우편번호검색</button>\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("  \t\t</div>\r\n");
      out.write("\t\t<div class=\"form-group\">\r\n");
      out.write("\t    \t<label for=\"addr1\" class=\"col-sm-2 control-label\">기본주소 : </label>\r\n");
      out.write("\t    \t<div class=\"col-sm-6\">\r\n");
      out.write("\t      \t<input type=\"text\" class=\"form-control\" name=\"strZipcode_2\" id=\"strZipcode_1\" maxlength=\"50\">\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("  \t\t</div>\r\n");
      out.write("  \t\t<div class=\"form-group\">\r\n");
      out.write("\t    \t<label for=\"addr2\" class=\"col-sm-2 control-label\">상세주소 : </label>\r\n");
      out.write("\t    \t<div class=\"col-sm-6\">\r\n");
      out.write("\t      \t<input type=\"text\" class=\"form-control\" name=\"strZipcode_3\" id=\"strZipcode_3\" maxlength=\"50\" placeholder=\"상세주소를 입력해주세요\">\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<label class=\"control-label\"><span id=\"addr_check_confirm\" class=\"check_css\"></span></label>\r\n");
      out.write("  \t\t</div>\t\t\r\n");
      out.write("\t\t<br><br>\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t<!-- 회원가입완료 및 취소 -->\r\n");
      out.write("\t\t<div class=\"form-group\">\r\n");
      out.write("\t    \t<label class=\"col-sm-4 control-label\"></label>\r\n");
      out.write("\t    \t<div class=\"col-sm-1\">\r\n");
      out.write("\t      \t<button type=\"button\" onclick=\"sendIt();\" id=\"submitbutton\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${UserInsertcheck }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" class=\"btn btn-primary\">가입 하기</button>\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("\t    \t<div class=\"col-sm-1\">\r\n");
      out.write("\t      \t<a href=\"");
      out.print(cp );
      out.write("/main.love\"><button type=\"button\" id=\"resetbutton\" class=\"btn btn-primary\">취소(메인으로)</button></a>\r\n");
      out.write("\t    \t</div>\r\n");
      out.write("  \t\t</div>\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t<!-- 유저회원가입 폼 종료 -->\t\t\t\r\n");
      out.write("\t</form>\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- 섹션종료 -->\r\n");
      out.write("\t</section>\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- 푸터영역시작 -->\r\n");
      out.write("\t");
      if (_jspx_meth_c_005fimport_005f1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fimport_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:import
    org.apache.taglibs.standard.tag.rt.core.ImportTag _jspx_th_c_005fimport_005f0 = (org.apache.taglibs.standard.tag.rt.core.ImportTag) _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.ImportTag.class);
    _jspx_th_c_005fimport_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fimport_005f0.setParent(null);
    // /main/userJoin.jsp(205,1) name = url type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fimport_005f0.setUrl((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${cp }/main/mainGnb.jsp", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
    int[] _jspx_push_body_count_c_005fimport_005f0 = new int[] { 0 };
    try {
      int _jspx_eval_c_005fimport_005f0 = _jspx_th_c_005fimport_005f0.doStartTag();
      if (_jspx_th_c_005fimport_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (java.lang.Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_005fimport_005f0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_005fimport_005f0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_005fimport_005f0.doFinally();
      _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.reuse(_jspx_th_c_005fimport_005f0);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fimport_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:import
    org.apache.taglibs.standard.tag.rt.core.ImportTag _jspx_th_c_005fimport_005f1 = (org.apache.taglibs.standard.tag.rt.core.ImportTag) _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.ImportTag.class);
    _jspx_th_c_005fimport_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005fimport_005f1.setParent(null);
    // /main/userJoin.jsp(383,1) name = url type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fimport_005f1.setUrl((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${cp }/main/footer.jsp", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
    int[] _jspx_push_body_count_c_005fimport_005f1 = new int[] { 0 };
    try {
      int _jspx_eval_c_005fimport_005f1 = _jspx_th_c_005fimport_005f1.doStartTag();
      if (_jspx_th_c_005fimport_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (java.lang.Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_005fimport_005f1[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_005fimport_005f1.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_005fimport_005f1.doFinally();
      _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.reuse(_jspx_th_c_005fimport_005f1);
    }
    return false;
  }
}
