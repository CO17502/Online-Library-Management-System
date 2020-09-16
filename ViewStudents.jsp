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
    
    <title> CCET | Chandigarh | View Students</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- latest compiled and minified css -->
        <link rel="stylesheet" href="bootstrap/bootstrap_/css/bootstrap.min.css" type="text/css">
        
        <!-- linking Stylesheet-->
        <link rel="stylesheet" href="style/Index.css" type="text/css">

        
        <!--jquery Library -->
        <script type="text/javascript" src="bootstrap/bootstrap_/js/jquery-3.3.1.min.js">
        </script>
        
        <!-- latest compiled and minified JavaScript -->
        <script type="text/javascript" src="bootstrap/bootstrap_/js/bootstrap.min.js">
        </script>
        <meta name="viewport" content="width=device-width , initial-scale=1"> 
       
        <script type="text/javascript" src="script/navbar.js"></script>
	

  </head>
  
  <body  onresize="ReSzNav(),checkLogo()" onload="resolvePanel(),checkLogo()">

    <div id="bgimg" style='background-image:url("images/13.jpg");'></div>

<center><h1 id="pageName" style="color: red;">Students Registered</h1></center>


<div id="mainTab">

<div class="data-table">
<div class="loginlog">
	<fieldset>

    <%
    try
    {
      Class.forName("com.mysql.jdbc.Driver");
       //System.out.println("Driver Statement executed");
       
       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
       //System.out.println("Connection statement executed");
       if(conn.isClosed())
			{
				System.out.println("Not Connected");
			}
			else
			{
				System.out.println("Connected");
			}
	   
       String query="select * from studentrecord";
       PreparedStatement ps=conn.prepareStatement(query);
       ResultSet rs = ps.executeQuery();%>
       <table class="table table-bordered">
       <tr class="warning">
        <td>Roll Number</td>
        <td>Name</td>
        <td>Branch</td>
        <td>Semester</td>
        <td>Contact Number</td>
        <td>Email Address</td>
        <td>Address</td>
       </tr>
       <%  while(rs.next())
       {
        String studentid;
        studentid=rs.getString(1);
        out.println("<tr class='active'>"+"<td>"+studentid+"</td>");
        out.println("<td>"+rs.getString(2)+"</td>");
        out.println("<td>"+rs.getString(3)+"</td>");
        out.println("<td>"+rs.getString(4)+"</td>");
        out.println("<td>"+rs.getString(5)+"</td>");
        out.println("<td>"+rs.getString(6)+"</td>");
        out.println("<td>"+rs.getString(7)+"</td></tr>");
        out.println("<tr class='active'></tr>");
       }%>
       </table>
     <%}
     catch(Exception e)
     {
      out.println(e.getMessage());
     }
     %>
	 </fieldset><br/><br/><br/>
</div></div></div>
	 
	 
  </body>
</html>
