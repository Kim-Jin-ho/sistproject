/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.32
 * Generated at: 2016-07-25 07:27:35 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.StudyRoom;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ShopAdd_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/standard.jar", Long.valueOf(1468241066457L));
    _jspx_dependants.put("jar:file:/C:/sistproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/StudyProject/WEB-INF/lib/standard.jar!/META-INF/c.tld", Long.valueOf(1098678690000L));
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
  }

  public void _jspDestroy() {
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
      out.write("<title>스터디룸 추가</title>\r\n");
      out.write("<script src=\"http://code.jquery.com/jquery-latest.min.js\"></script>\r\n");
      out.write("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js\"></script>\r\n");
      out.write("    <!-- Google Font -->\r\n");
      out.write("    <link href='http://fonts.googleapis.com/css?family=Dosis:300,400,500,600,700,800' rel='stylesheet' type='text/css'>\r\n");
      out.write("    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>\r\n");
      out.write("\r\n");
      out.write("    <!-- Font Awesome -->\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css\">\r\n");
      out.write("\r\n");
      out.write("    <!-- Icon Font-->\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"style.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/owl.carousel.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/owl.theme.default.css\">\r\n");
      out.write("    <!-- Animate CSS-->\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/animate.css\">\r\n");
      out.write("\r\n");
      out.write("    <!-- Bootstrap -->\r\n");
      out.write("    <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\" src=\"ajax.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(cp );
      out.write("/js/HuskyEZCreator.js\" charset=\"utf-8\"></script>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("$(document).ready(function()\r\n");
      out.write("{\r\n");
      out.write("\t//저장버튼 클릭시 form 전송\r\n");
      out.write("\t$(\"#add\").click(function()\r\n");
      out.write("\t{\r\n");
      out.write("\t\r\n");
      out.write("\t    // 데이터 검사(누락된 입력값 검사) 후 submit 액션\r\n");
      out.write("\t    if($(\"#shopName\").val()=='')            \r\n");
      out.write("\t    {\r\n");
      out.write("\t       //$(\"#errMsg\").css(\"display\",\"inline\")\r\n");
      out.write("\t       alert(\"방 이름을 입력해주세요.\");\r\n");
      out.write("\t       $(\"#shopName\").focus();\r\n");
      out.write("\t    }\r\n");
      out.write("\t    else if($('#tel').val()=='')            \r\n");
      out.write("\t    {\r\n");
      out.write("\t       alert(\"전화번호를 입력해주세요.\");\r\n");
      out.write("\t       $(\"#tel\").focus();\r\n");
      out.write("\t    }\r\n");
      out.write("\t    else if($(\"#hour\").val()=='')            \r\n");
      out.write("\t    {\r\n");
      out.write("\t       alert(\"영업시간을 입력해주세요.\");\r\n");
      out.write("\t       $(\"#hour\").focus();\r\n");
      out.write("\t    }\r\n");
      out.write("\t    else if($(\"#p_id\").val()=='' || $(\"#t_id\").val()=='')            \r\n");
      out.write("\t    {\r\n");
      out.write("\t       alert(\"위치를 입력해주세요.\");\r\n");
      out.write("\t    }\r\n");
      out.write("\t    else if($(\"#holiday\").val()=='')            \r\n");
      out.write("\t    {\r\n");
      out.write("\t       alert(\"휴무일을 입력해주세요.\");\r\n");
      out.write("\t       $(\"#holiday\").focus();\r\n");
      out.write("\t    }\r\n");
      out.write("\t    else if($(\"#roomCount\").val()=='')            \r\n");
      out.write("\t    {\r\n");
      out.write("\t       alert(\"방 개 수를 입력해주세요.\");\r\n");
      out.write("\t       $(\"#roomCount\").focus();\r\n");
      out.write("\t    }\r\n");
      out.write("\t    else if($(\"#yesno1\").val()=='0')            \r\n");
      out.write("\t    {\r\n");
      out.write("\t       alert(\"흡연실 유무를 입력해주세요.\");\r\n");
      out.write("\t       $(\"#yesno1\").focus();\r\n");
      out.write("\t    }\r\n");
      out.write("\t    else if($(\"#yesno2\").val()=='0')            \r\n");
      out.write("\t    {\r\n");
      out.write("\t       alert(\"프린트 유무를 입력해주세요.\");\r\n");
      out.write("\t       $(\"#yesno2\").focus();\r\n");
      out.write("\t    }\r\n");
      out.write("\t    //저장버튼 클릭시 form 전송\r\n");
      out.write("\t    else \r\n");
      out.write("\t    {\r\n");
      out.write("\t        $(\"#frm\").submit();\r\n");
      out.write("\t    }\r\n");
      out.write("\t    \r\n");
      out.write("\t});  \r\n");
      out.write("\t\r\n");
      out.write("});\t\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("<div class=\"row text-center\">\r\n");
      out.write("   <div class=\"form-group col-sm-2\"></div>\r\n");
      out.write("   <div class=\"form-group col-sm-8 form-group-sm\">\r\n");
      out.write("   <form id=\"frm\" action=\"ShopAdd.room\" method=\"post\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("\t\t\t\t\t<br>            \r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("               \t\t<table class=\"table table-hover\">\r\n");
      out.write("\t               \t\t<tr>\r\n");
      out.write("\t\t                    <td><strong>스터디룸명</strong></td> \r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"text\" class=\"form-control\" id=\"shopName\" name=\"shopName\" placeholder=\"예) 구름방\"> </td>\r\n");
      out.write("\t                    </tr>\r\n");
      out.write("\t                    <tr>\r\n");
      out.write("\t                    \t<td><strong>전화번호</strong></td> \r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"text\" class=\"form-control\" id=\"tel\" name=\"tel\" placeholder=\"예) 02-1111-1111\"> </td>\r\n");
      out.write("\t                    </tr>\r\n");
      out.write("\t                    <tr>\r\n");
      out.write("\t                    \t<td><strong>영업시간</strong></td> \r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"text\" class=\"form-control\" id=\"hour\" name=\"hour\" placeholder=\"예) 09:00~20:00\"> </td>\r\n");
      out.write("\t                    </tr>\r\n");
      out.write("\t                    <tr>\r\n");
      out.write("\t                    \t<td><strong>위치</strong></td> \r\n");
      out.write("\t\t\t\t\t\t\t<td><button type=\"button\" id=\"map\" class=\"btn btn-info btn-sm \" name=\"map\" onclick=\"javascript:window.open('StudyRoomCreateMap.room','지도','width=400,height=550,left=500,top=120')\">지도보기</button></td>\r\n");
      out.write("\t                    </tr>\r\n");
      out.write("\t                    <tr>\r\n");
      out.write("\t                    \t<td><strong>휴무일</strong></td> \r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"text\" class=\"form-control\" id=\"holiday\" name=\"holiday\" placeholder=\"예) 매주 월요일\"> </td>\r\n");
      out.write("\t                    </tr>\r\n");
      out.write("\t                    <tr>\r\n");
      out.write("\t                    \t<td><strong>방 개 수</strong></td> \r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"text\" class=\"form-control\" id=\"roomCount\" name=\"roomCount\" placeholder=\"예) 10\"> </td>\r\n");
      out.write("\t                    </tr>\r\n");
      out.write("\t                    <tr>\r\n");
      out.write("\t                    \t<td><strong>흡연실 유무</strong></td> \r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<select name=\"yesno1\" class=\"form-control\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"1\">있음</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"2\">없음</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t                    </tr>\r\n");
      out.write("\t                    <tr>\r\n");
      out.write("\t                    \t<td><strong>프린트 유무</strong></td> \r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<select name=\"yesno2\" class=\"form-control\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"1\">있음</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"2\">없음</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"3\">고장</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t                    </tr>\r\n");
      out.write("                     \r\n");
      out.write("         \r\n");
      out.write("         \t\t  </table>\r\n");
      out.write("                  </div>\r\n");
      out.write("                  \r\n");
      out.write("           <div class=\"row\">\r\n");
      out.write("               <div class=\"col-sm-12 text-center\">\r\n");
      out.write("                  <button type=\"button\" class=\"btn btn-success\" id=\"add\" name=\"add\">확인</button>\r\n");
      out.write("\t\t\t\t\t\t<button type=\"reset\" class=\"btn btn-danger\" onclick=\"window.close();\">취소</button>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("\t\t   <!-- 좌표 찍는 값 -->\r\n");
      out.write("\t\t   <input type=\"text\" id=\"p_id\" name=\"p_id\" value=\"\" hidden=\"\" >\r\n");
      out.write("\t\t   <input type=\"text\" id=\"t_id\" name=\"t_id\" value=\"\" hidden=\"\">\r\n");
      out.write("\t\t</form>        \r\n");
      out.write("         </div>\r\n");
      out.write("                     \r\n");
      out.write("   </div>\r\n");
      out.write("   \r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
}
