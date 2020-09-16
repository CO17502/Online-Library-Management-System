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
    
    <title>login (process)</title>
    
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
			String name=request.getParameter("username");
			String password=request.getParameter("password");
			
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
		 		String query="select * from logindetails where username=? and password=?";
		 		PreparedStatement ps= con.prepareStatement(query);
		 		ps.setString(1,name);
		 		ps.setString(2,password);
		 		ResultSet rs=ps.executeQuery();
		 		if(rs.next())
		 		{
		 			session.setAttribute("userid",name);
		 			
					String query1="update logindetails set status='logged in' where username=? and password=?";
		 			PreparedStatement ps1= con.prepareStatement(query1);
		 			
		 			ps1.setString(1,name);
		 			ps1.setString(2,password);
		 			int rs1=ps1.executeUpdate();
		 			if(rs1>0){
		 				response.sendRedirect("LoginAdmin.jsp");
		 			}
		 			else{
		 				out.println("<h4>Login Not Done! Try Again</h4>");
		 			}
		 		}
		 		else
		 		{
		 			String msg="Username or password is wrong";
		 			response.sendRedirect("LoginPage.jsp?b="+msg);

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
