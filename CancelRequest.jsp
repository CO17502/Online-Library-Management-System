<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CancelRequest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
     String bookid=request.getParameter("v");
     try
     {
      Class.forName("com.mysql.jdbc.Driver");
	  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
	  String query="delete from issuerequeststudent where bookid=?";
	  PreparedStatement ps=conn.prepareStatement(query);
      ps.setString(1, bookid);
      int r=ps.executeUpdate();
      if(r>0)
      {
       String query1="update bookrecord set bookstatus='available' where bookid=?";
       PreparedStatement ps1=conn.prepareStatement(query1);
       ps1.setString(1, bookid);
       int r1=ps1.executeUpdate();
       if(r1>0)
       {String msg="Request Deleted!";
     
       response.sendRedirect("ViewPersonalReq.jsp?a="+msg);
       }
      }
     }
     catch(Exception e)
     {
      out.println(e.getMessage());
     }
     %>
  </body>
</html>
