/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.32
 * Generated at: 2016-07-18 03:56:31 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.main;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class main_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("/css/hyuncss/main.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"");
      out.print(cp );
      out.write("/css/font-awesome.min.css\" rel=\"stylesheet\">\r\n");
      out.write("<script src=\"");
      out.print(cp );
      out.write("/js/mainjs/jquery.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(cp );
      out.write("/js/mainjs/bootstrap.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("jQuery(function($) {\r\n");
      out.write("//메인슬라이드!!===================================================================================\r\n");
      out.write("\t$(function(){\r\n");
      out.write("\t\t$('#main-slider.carousel').carousel({\r\n");
      out.write("\t\t\tinterval: 8000\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("\t$( '.centered' ).each(function( e ) {\r\n");
      out.write("\t\t$(this).css('margin-top',  ($('#main-slider').height() - $(this).height())/2);\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("\t$(window).resize(function(){\r\n");
      out.write("\t\t$( '.centered' ).each(function( e ) {\r\n");
      out.write("\t\t\t$(this).css('margin-top',  ($('#main-slider').height() - $(this).height())/2);\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("//===============================================================================================\r\n");
      out.write("});\t\r\n");
      out.write("</script>\r\n");
      out.write("<body>\r\n");
      out.write("\t<!-- 첫번째 헤더영역 -->\r\n");
      out.write("\t");
      if (_jspx_meth_c_005fimport_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    <!-- 메인 메뉴영역 -->\r\n");
      out.write("    ");
      if (_jspx_meth_c_005fimport_005f1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("    <!-- 메인슬라이드 영역 -->\r\n");
      out.write("    <section id=\"main-slider\" class=\"no-margin\">\r\n");
      out.write("        <div class=\"carousel slide wet-asphalt\">\r\n");
      out.write("            <ol class=\"carousel-indicators\">\r\n");
      out.write("                <li data-target=\"#main-slider\" data-slide-to=\"0\" class=\"active\"></li>\r\n");
      out.write("                <li data-target=\"#main-slider\" data-slide-to=\"1\"></li>\r\n");
      out.write("                <li data-target=\"#main-slider\" data-slide-to=\"2\"></li>\r\n");
      out.write("            </ol>\r\n");
      out.write("            <!-- 메인슬라이드 영역1 (동영상) -->\r\n");
      out.write("            <div class=\"carousel-inner\">\r\n");
      out.write("                <div class=\"item active\" style=\"background-image: url(");
      out.print(cp );
      out.write("/images/main/slider3.jpg)\">\r\n");
      out.write("                    <div class=\"container\">\r\n");
      out.write("                        <div class=\"row\">\r\n");
      out.write("                        \t<div class=\"col-sm-6\">\r\n");
      out.write("                                <div class=\"carousel-content centered\">\r\n");
      out.write("                                    <h2 class=\"animation animated-item-1\">Wellcome To Your My Sunshine</h2>\r\n");
      out.write("                                    <h4 class=\"animation animated-item-2\">이미지 넣기 이미지넣기!!!</h4>\r\n");
      out.write("                                    <br>\r\n");
      out.write("                                    <a class=\"btn btn-md animation animated-item-3\" href=\"#\">Learn More</a>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"col-sm-6 hidden-xs animation animated-item-4\">\r\n");
      out.write("                                <div class=\"centered\">\r\n");
      out.write("                                    <div class=\"embed-container\">\r\n");
      out.write("                                        <iframe src=\"https://player.vimeo.com/video/94837904\" width=\"640\" height=\"360\"></iframe>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <!-- 메인슬라이드 영역2 -->\r\n");
      out.write("                <div class=\"item\" style=\"background-image: url(");
      out.print(cp );
      out.write("/images/main/slider2.jpg)\">\r\n");
      out.write("                    <div class=\"container\">\r\n");
      out.write("                        <div class=\"row\">\r\n");
      out.write("                            <div class=\"col-sm-12\">\r\n");
      out.write("                                <div class=\"carousel-content center centered\">\r\n");
      out.write("                                    <h2 class=\"animation animated-item-1\">Wellcome To Your My Sunshine</h2>\r\n");
      out.write("                                    <h4 class=\"animation animated-item-2\">이미지 넣기 이미지넣기!!!</h4>\r\n");
      out.write("                                    <br>\r\n");
      out.write("                                    <a class=\"btn btn-md animation animated-item-3\" href=\"#\">Learn More</a>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <!-- 메인슬라이드 영역3 -->\r\n");
      out.write("                <div class=\"item\" style=\"background-image: url(");
      out.print(cp );
      out.write("/images/main/slider1.jpg)\">\r\n");
      out.write("                    <div class=\"container\">\r\n");
      out.write("                        <div class=\"row\">\r\n");
      out.write("                        \t<div class=\"col-sm-12\">\r\n");
      out.write("                                <div class=\"carousel-content centered\">\r\n");
      out.write("                                    <h2 class=\"animation animated-item-1\">Wellcome To Your My Sunshine</h2>\r\n");
      out.write("                                    <h4 class=\"animation animated-item-2\">이미지 넣기 이미지넣기!!!</h4>\r\n");
      out.write("                                    <br>\r\n");
      out.write("                                    <a class=\"btn btn-md animation animated-item-3\" href=\"#\">Learn More</a>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>    \r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div><!-- 메인슬라이드 영역1(동영상)END -->\r\n");
      out.write("            </div><!-- 메인슬라이드 영역2 END -->\r\n");
      out.write("        </div><!-- 메인슬라이드 영역3 END -->\r\n");
      out.write("        <a class=\"prev hidden-xs\" href=\"#main-slider\" data-slide=\"prev\">\r\n");
      out.write("            <i class=\"icon-angle-left\"></i>\r\n");
      out.write("        </a>\r\n");
      out.write("        <a class=\"next hidden-xs\" href=\"#main-slider\" data-slide=\"next\">\r\n");
      out.write("            <i class=\"icon-angle-right\"></i>\r\n");
      out.write("        </a>\r\n");
      out.write("    </section><!-- 메인슬라이드 영역 END -->\r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("\t<!-- 메인 섹션 VIEW영역  -->\r\n");
      out.write("\t<div id=\"pricing\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"center\">\r\n");
      out.write("                <h2>내가직접 고르는 인기브랜드 웨딩 컬렉션</h2><br>\r\n");
      out.write("            </div><!--/.center-->   \r\n");
      out.write("            <div class=\"gap\"></div>\r\n");
      out.write("            <div id=\"pricing-table\" class=\"row\">\r\n");
      out.write("                <div class=\"col-md-3 col-xs-6\">\r\n");
      out.write("                    <ul class=\"plan plan1\">\r\n");
      out.write("                        <li class=\"plan-name\">\r\n");
      out.write("                            <h3>WeddingHall<br>이미지넣을자리</h3>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"plan-action\">\r\n");
      out.write("                            <a href=\"#\" class=\"btn btn-primary btn-md\">DetailView</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div><!--/.col-md-3-->\r\n");
      out.write("                <div class=\"col-md-3 col-xs-6\">\r\n");
      out.write("                    <ul class=\"plan plan2 featured\">\r\n");
      out.write("                        <li class=\"plan-name\">\r\n");
      out.write("                            <h3>Studio<br>이미지넣을자리</h3>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"plan-action\">\r\n");
      out.write("                            <a href=\"#\" class=\"btn btn-primary btn-md\">DetailView</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div><!--/.col-md-3-->\r\n");
      out.write("                <div class=\"col-md-3 col-xs-6\">\r\n");
      out.write("                    <ul class=\"plan plan3\">\r\n");
      out.write("                       <li class=\"plan-name\">\r\n");
      out.write("                            <h3>Dress<br>이미지넣을자리</h3>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"plan-action\">\r\n");
      out.write("                            <a href=\"#\" class=\"btn btn-primary btn-md\">DetailView</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div><!--/.col-md-3-->\r\n");
      out.write("                <div class=\"col-md-3 col-xs-6\">\r\n");
      out.write("                    <ul class=\"plan plan4\">\r\n");
      out.write("                       <li class=\"plan-name\">\r\n");
      out.write("                            <h3>Hair&MakeUp<br>이미지넣을자리</h3>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"plan-action\">\r\n");
      out.write("                            <a href=\"#\" class=\"btn btn-primary btn-md\">DetailView</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div> \r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("   <!-- 메인풋터 영역 -->\r\n");
      out.write("   ");
      if (_jspx_meth_c_005fimport_005f2(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("   \r\n");
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

  private boolean _jspx_meth_c_005fimport_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:import
    org.apache.taglibs.standard.tag.rt.core.ImportTag _jspx_th_c_005fimport_005f0 = (org.apache.taglibs.standard.tag.rt.core.ImportTag) _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.ImportTag.class);
    _jspx_th_c_005fimport_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fimport_005f0.setParent(null);
    // /main/main.jsp(39,1) name = url type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
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
    // /main/main.jsp(42,4) name = url type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fimport_005f1.setUrl((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${cp }/main/mainMenu.jsp", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
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

  private boolean _jspx_meth_c_005fimport_005f2(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:import
    org.apache.taglibs.standard.tag.rt.core.ImportTag _jspx_th_c_005fimport_005f2 = (org.apache.taglibs.standard.tag.rt.core.ImportTag) _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.ImportTag.class);
    _jspx_th_c_005fimport_005f2.setPageContext(_jspx_page_context);
    _jspx_th_c_005fimport_005f2.setParent(null);
    // /main/main.jsp(169,3) name = url type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fimport_005f2.setUrl((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${cp }/main/footer.jsp", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
    int[] _jspx_push_body_count_c_005fimport_005f2 = new int[] { 0 };
    try {
      int _jspx_eval_c_005fimport_005f2 = _jspx_th_c_005fimport_005f2.doStartTag();
      if (_jspx_th_c_005fimport_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (java.lang.Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_005fimport_005f2[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_005fimport_005f2.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_005fimport_005f2.doFinally();
      _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.reuse(_jspx_th_c_005fimport_005f2);
    }
    return false;
  }
}