/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.32
 * Generated at: 2016-07-24 05:48:12 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.StudyRoom;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class StudyRoomMap1_jsp extends org.apache.jasper.runtime.HttpJspBase
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

	String dong = request.getParameter("dongkyung");
	String buk = request.getParameter("bukwi");
	String shop = request.getParameter("shopName");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>지도</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div id=\"map\" style=\"width:100%;height:350px;\"></div>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\" src=\"//apis.daum.net/maps/maps3.js?apikey=850448c69975031c4b91c77e0342ba63&libraries=services\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("var mapContainer = document.getElementById('map'), // 지도를 표시할 div \r\n");
      out.write("mapOption = { \r\n");
      out.write("    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표\r\n");
      out.write("    level: 3 // 지도의 확대 레벨\r\n");
      out.write("};\r\n");
      out.write("\r\n");
      out.write("var map = new daum.maps.Map(mapContainer, mapOption);\r\n");
      out.write("\r\n");
      out.write("//마커가 표시될 위치입니다 \r\n");
      out.write("var markerPosition  = new daum.maps.LatLng(");
      out.print(dong);
      out.write(',');
      out.write(' ');
      out.print(buk);
      out.write("); \r\n");
      out.write("\r\n");
      out.write("//마커를 생성합니다\r\n");
      out.write("var marker = new daum.maps.Marker({\r\n");
      out.write("position: markerPosition\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("//마커가 지도 위에 표시되도록 설정합니다\r\n");
      out.write("marker.setMap(map);\r\n");
      out.write("\r\n");
      out.write("var iwContent = '<div style=\"padding:5px;\">");
      out.print(shop);
      out.write(" <br><a href=\"http://map.daum.net/link/map/");
      out.print(shop);
      out.write(',');
      out.print(dong);
      out.write(',');
      out.print(buk);
      out.write("\" style=\"color:blue\" target=\"_blank\">큰지도보기</a> <a href=\"http://map.daum.net/link/to/");
      out.print(shop);
      out.write(',');
      out.print(dong);
      out.write(',');
      out.print(buk);
      out.write("\" style=\"color:blue\" target=\"_blank\">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다\r\n");
      out.write("iwPosition = new daum.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다\r\n");
      out.write("\r\n");
      out.write("//인포윈도우를 생성합니다\r\n");
      out.write("var infowindow = new daum.maps.InfoWindow({\r\n");
      out.write("position : iwPosition, \r\n");
      out.write("content : iwContent \r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다\r\n");
      out.write("infowindow.open(map, marker); \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
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
