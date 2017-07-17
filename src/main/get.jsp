 <html>
 <body>
 <h1>Get Time from session yang sebelumnya di set</h1>

<h2> Samakan hasilnya dengan value yang sudah di simpan </h2>

<%
     System.out.println( "Getting date now" );
%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java"  %>
<%
  String getURL=request.getRequestURL().toString();
%>

Date ini diambil dari session pada server yang sebelumnya di set <b> <font color="red"> <%= session.getAttribute("current.time") %> </font> </b>  </p>
<input type="button" value="Close this window" onclick="self.close()">

 </body>
 </html>




