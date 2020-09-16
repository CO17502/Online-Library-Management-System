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
    
    <title> CCET | Chandigarh | Student Login Details</title>
    
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
     String username=request.getParameter("username");
     String password=request.getParameter("student_password");
    
      try
    {
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
      if(conn.isClosed())
		{
			System.out.println("Not Connected");
		}
		else
		{
			System.out.println("Connected");
		}
	   String query="insert into library.logindetailsstudent values(?,?,'logged out')";
       PreparedStatement ps=conn.prepareStatement(query);
       ps.setString(1, username);
       ps.setString(2, password);
       int r = ps.executeUpdate();
       if(r>0)
       {
        out.println("You are registered successfully.");
        response.sendRedirect("home.jsp");
		}
		else{
		out.println("Registeration not done. Try Again");
		response.sendRedirect("StudentLoginDetails.jsp");
		}
	 }
	 catch(Exception e)
	 {
	  out.println(e.getMessage());
	 } 
     
     %>
    
  </body>
</html>
