 <html>
 <body>
 <h1>Clustering Test and Session Replication</h1>

<%@ page contentType="text/html; charset=iso-8859-1" language="java"  %>
<%
  String getURL=request.getRequestURL().toString();
%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java"  %>
<%
   String url = request.getRequestURL().toString();
  String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/";
%>

<%@page import="java.net.InetAddress"%>
<%
 InetAddress IP=InetAddress.getLocalHost();
System.out.println("IP of my system is := "+IP.getHostAddress());
%>




Catat / ingat value ini untuk di compare dengan hasil dari link ini: <b> <a href=" <%=baseURL%>get.jsp " target="_blank"> <font color="red"> <%= session.getAttribute("current.time") %> </font> </a>  </b> </p> 

 <%
     System.out.println( "Putting date now" );
     session.setAttribute("current.time", new java.util.Date());
//     session.setAttribute("current.time", new java.lang.string(utilDate.getTime());
//     session.setAttribute("current.time", new java.util.Date(affiliate.langString());
//     session.setAttribute("current.time", new java.lang.String(affiliate.utilDate().getTime()));
 %>



<%@page import="java.util.*, java.lang.reflect.*, javax.servlet.http.HttpSession "%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
 String cPath = request.getContextPath();
 String sPath = request.getServletPath();
 String nodeId = System.getProperty("jboss.server.name");
 String hostName = System.getProperty("java.rmi.server.hostname");
 String variableString = (String)session.getAttribute("SESSION_TEST_VARIABLE");
 int count = 0;

  if(variableString != null)
 {
  count = Integer.parseInt(variableString);
  count++;
 }

  session.setAttribute("SESSION_TEST_VARIABLE", String.valueOf(count));
%>


<body bgcolor=white>
  <table columns=1>
 
  </table>
  <table columns=2>
 <tr><td><font color=blue>The sessionId is:  </font></td><td><%=session.getId() %></td>
 <tr><td><font color=blue>The sessionObj is:   </font></td><td><%=session %></td>
 <tr><td><font color=blue>The nodeId is:  </font></td><td><%=nodeId %></td>
 <tr><td><font color=blue>The server hostName is:  </font></td><td><%=hostName %></td>
 <tr><td><font color=blue>Sticky Session Test, number request akan bertambah jika sticky berjalan</font></td>
 <tr><td><font color=blue># of requests placed on session:  </font></td><td><%=count %></td>
  </table>



</p>
<a href=" <%=getURL%> ">Klik disini untuk refresh/re-set date </a> </p>
<a href=" <%=baseURL%> ">Klik disini untuk menuju baseURL </a> </p>
<a href=" <%=baseURL%>get.jsp ">Klik mentest session replication </a> </p>

<a href=" http://<%=IP.getHostAddress() %>:8080/SessionReplication/ClusterTestServlet " target="_blank">ClusterTestServlet</a> </p>
<a href=" http://<%=IP.getHostAddress() %>:8080/SessionReplication/ServerEchoServlet " target="_blank">ServerEchoServlet</a> </p>
<a href=" http://<%=IP.getHostAddress() %>:8080/SessionReplication/SessionReplicationTest " target="_blank">SessionReplicationTest</a> </p>

 </body>
 </html>
