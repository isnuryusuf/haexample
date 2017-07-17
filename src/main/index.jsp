<html>
<body>
<h2>Hello World!</h2>
<%
    // This is a scriptlet.  Notice that the "date"
    // variable we declare here is available in the
    // embedded expression later on.
    System.out.println( "Evaluating date now" );
    java.util.Date date = new java.util.Date();
%>


<%@ page contentType="text/html; charset=iso-8859-1" language="java"  %>
<%
   String url = request.getRequestURL().toString();
  String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/";
%>

Hello!  The time is now <%= date %> </p>
<a href=" <%=baseURL%>put.jsp " target="_blank">Klik disini untuk refresh/Mensetting date </a> </p>
<a href=" <%=baseURL%>get.jsp " target="_blank">Klik mentest session replication </a> </p>
<a href=" <%=baseURL%> " target="_blank">Klik disini untuk menuju baseURL </a> </p>
</body>
</html>
