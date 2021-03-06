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
    
    <title>ViewRequests.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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

<center><h1 id="pageName" style="color: red;">Issue Requests</h1></center>


<div id="mainTab">

<div class="data-table">
<div class="loginlog">
	<fieldset>

    <%
    String msg=request.getParameter("a");
      if(msg==null)
      {
        msg=" ";
      }%>
      <div><center><font color="red"><%=msg%></font></center></div>
   <% try
    {
     Class.forName("com.mysql.jdbc.Driver");
	 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
	 String query="select * from issuerequeststudent order by requestdate,requesttime";
     PreparedStatement ps= conn.prepareStatement(query);
     ResultSet rs=ps.executeQuery();%>
     <table class="table table-bordered">
				<tr class="warning">
				    <th>Student ID</th>
				    <th>Student Name</th>
				    <th>Student Branch</th>
				    <th>Semester</th>
					<th>Book ID</th>
					<th>Book Title</th>
					<th>Author</th>
					<th>Book Type</th>
					<th>Book Department</th>
					<th>Request Date</th>
					<th>Request Time</th>
					<th>Issue</th>
				</tr>
     <%while(rs.next())
     {
      String studentid=rs.getString(3);
      String query1="Select * from studentrecord where studentid=?";
      PreparedStatement ps1= conn.prepareStatement(query1);
      ps1.setString(1, studentid);
      ResultSet rs1=ps1.executeQuery();
      while(rs1.next())
      {
       out.println("<tr class='active'>"+"<td>"+studentid+"</td>");
	   out.println("<td>"+rs1.getString(2)+"</td>");
	   out.println("<td>"+rs1.getString(3)+"</td>");
	   out.println("<td>"+rs1.getString(4)+"</td>");
      }
      String bookid=rs.getString(2);
      String query2="Select * from bookrecord where bookid=?";
      PreparedStatement ps2= conn.prepareStatement(query2);
      ps2.setString(1, bookid);
      ResultSet rs2=ps2.executeQuery();
      while(rs2.next())
      {
       out.println("<td>"+bookid+"</td>");
	   out.println("<td>"+rs2.getString(2)+"</td>");
	   out.println("<td>"+rs2.getString(3)+"</td>");
	   out.println("<td>"+rs2.getString(4)+"</td>");
	   out.println("<td>"+rs2.getString(5)+"</td>");
	   
      }
      String query3="Select requestdate,requesttime from issuerequeststudent where bookid=?";
      PreparedStatement ps3= conn.prepareStatement(query3);
      ps3.setString(1, bookid);
      ResultSet rs3=ps3.executeQuery();
      while(rs3.next())
      {
       out.println("<td>"+rs3.getString(1)+"</td>");
	   out.println("<td>"+rs3.getString(2)+"</td>");
	   out.println("<td>"+"<a href=IssueBook.jsp?v="+bookid+"><button>"+"Issue"+"</button></a>"+"</td>"+"</tr>");
	   out.println("<tr class='active'></tr>");
      }
     }%></table>
    <%conn.close();
    }
    catch(Exception e)
    {
     out.println(e.getMessage());
    }
     %>
     </fieldset><br/><br/><br/>
</div></div></div>
	 
  </body>
</html>
