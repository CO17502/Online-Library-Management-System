
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
    
    <title>ViewbyStudentidProcess.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<link rel="stylesheet" href="bootstrap/bootstrap_/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="style/Index.css" type="text/css">
        <script type="text/javascript" src="bootstrap/bootstrap_/js/jquery-3.3.1.min.js">
        </script>
        <script type="text/javascript" src="bootstrap/bootstrap_/js/bootstrap.min.js">
        </script>
        <meta name="viewport" content="width=device-width , initial-scale=1"> 
        <script type="text/javascript" src="script/navbar.js"></script>  


 </head>
  
  <body  onresize="ReSzNav(),checkLogo()" onload="resolvePanel(),checkLogo()">

    <div id="bgimg" style='background-image:url("images/13.jpg");'></div>
<%String studentid=request.getParameter("searchid");
     %>
<center><h1 id="pageName" style="color: red;">Viewing Books Returned By <%=studentid %></h1></center>


<div id="mainTab">

<div class="data-table">
<div class="loginlog">
	<fieldset>

  <%
    try
   {
    Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
	String query="select * from returnrecord where studentid=? order by issuedate desc";
	PreparedStatement ps= conn.prepareStatement(query);
	ps.setString(1, studentid);
    ResultSet rs=ps.executeQuery();
    Boolean sign=rs.next();%>
    <table class="table table-bordered">
       <tr class="warning">
				      
					  <th>Book ID</th>
					  <th>Book Title</th>
					  <th>Author</th>
					  <th>Book Type</th>
					  <th>Book Department</th>
					  <th>Issue Date</th>
					  <th>Due Date</th>
					  <th>Return Date</th>
					  <th>Fine</th>
					  <th>Status</th>
				</tr>
     <% 
     while(rs.next())
     {
      String bookid=rs.getString(2);
      String query2="Select * from bookrecord where bookid=?";
      PreparedStatement ps2= conn.prepareStatement(query2);
      ps2.setString(1, bookid);
      ResultSet rs2=ps2.executeQuery();
      while(rs2.next())
      {
       out.println("<tr class='active'><td>"+bookid+"</td>");
	     out.println("<td>"+rs2.getString(2)+"</td>");
	     out.println("<td>"+rs2.getString(3)+"</td>");
	     out.println("<td>"+rs2.getString(4)+"</td>");
	     out.println("<td>"+rs2.getString(5)+"</td>");
	     out.println("<td>"+rs.getString(4)+"</td>");
	     out.println("<td>"+rs.getString(5)+"</td>");
	     out.println("<td>"+rs.getString(6)+"</td>");
	     out.println("<td>"+rs.getInt(7)+"</td>");
	     out.println("<td>"+"Returned"+"</td>"+"</tr>");
	     out.println("<tr class='active'></tr>");
	  }
      
      
     }if(sign==false)
		 	{
		 	String msg="No results found!";
		 	response.sendRedirect("ViewbyStudentid.jsp?b="+msg);
		 	}
     %>					 
	 </table>
   <%
   conn.close();
   }
   catch(Exception e)
   {
    out.println(e.getMessage());
   }
    %>
    </fieldset><br/>
    <a href="ViewbyStudentid.jsp"><button class="btn btn-danger btn-lg active">Back</button></a><br/>
    </h3><br/><br/>
</div></div></div>
  </body>
</html>
