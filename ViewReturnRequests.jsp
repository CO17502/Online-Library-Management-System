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
    
    <title>My JSP 'ViewReturnRequests.jsp' starting page</title>
    
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
    String msg=request.getParameter("v");
      if(msg==null)
      {
        msg=" ";
      }%>
      <div><center><font color="red"><%=msg%></font></center></div>
   <% try
    {
     Class.forName("com.mysql.jdbc.Driver");
     Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
     String query="select * from returnrequests order by returnrequestdate,returnrequesttime";
     PreparedStatement ps= conn.prepareStatement(query);
     ResultSet rs=ps.executeQuery();%>
     <table border="3px">
        <tr>
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
           <th>Return Request</th>
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
       out.println("<tr>"+"<td>"+studentid+"</td>");
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
      String query3="Select returnrequestdate,returnrequesttime from returnrequests where bookid=?";
      PreparedStatement ps3= conn.prepareStatement(query3);
      ps3.setString(1, bookid);
      ResultSet rs3=ps3.executeQuery();
      while(rs3.next())
      {
       out.println("<td>"+rs3.getString(1)+"</td>");
       out.println("<td>"+rs3.getString(2)+"</td>");
      } 
     String query4="Select sno from issuerecord where issuestatus='issued' and bookid=?";
     PreparedStatement ps4= conn.prepareStatement(query4);
     ps4.setString(1, bookid);
     ResultSet rs4=ps4.executeQuery();
     if(rs4.next())
     {
     System.out.println("hey");
      int issueno=rs4.getInt(1);
      out.println("<td>"+"<a href=ReturnBook.jsp?v="+issueno+"><button>"+"Approve"+"</button></a>"+"</td>"+"</tr>");
     }
    }
    %></table>
    <%conn.close();
    }
    catch(Exception e)
    {
     out.println(e.getMessage());
    }
     %>
  </body>
</html>
