<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Log Out</title>
    
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
    	String userid=session.getAttribute("userid").toString();
    
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
			String query="update logindetails set status='logged out' where username=?";
			PreparedStatement ps= con.prepareStatement(query);
			ps.setString(1,userid);
			int rs=ps.executeUpdate();
			if(rs>0){
		 		session.invalidate();
    			response.sendRedirect("LoginAs.jsp");
     		}
		 	else{
		 		out.println("<h4>Logout Not Done! Try Again</h4>");
		 	}
		 	con.close();
		 }
		 catch(Exception e)
		 	{
		 		out.println(e.getMessage());
		 	}	
    %>
  </body>
</html>
