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
    
    <title> CCET | Chandigarh | Update Student Record</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- latest compiled and minified css -->
    <link rel="stylesheet" href="bootstrap/bootstrap_/css/bootstrap.min.css" type="text/css">   
 
	<!-- linking Stylesheet-->   
    <link rel="stylesheet" href="style/Index.css" type="text/css"/>

    <!--jquery Library -->   
    <script type="text/javascript"  src="bootstrap/bootstrap_/js/jquery-3.3.1.min.js">  
    </script>

    <!-- latest compiled and minified JavaScript -->
	<script type="text/javascript" src="bootstrap/bootstrap_/js/bootstrap.min.js">
	</script>
        
	<meta name="viewport" content="width=device-width , initial-scale=1">
  
	<script type="text/javascript" src="script/navbar.js"></script>
	

  </head>
  
  <body  onresize="ReSzNav(),checkLogo()" onload="resolvePanel(),checkLogo()">
    <div id="bgimg" style='background-image:url("images/13.jpg");'></div>
	
	<center><h1 id="pageName" style="color: red;">Student Details</h1></center>


<div id="mainTab">

<div class="data-table">
<div class="loginlog">
	<fieldset>

    <%
     String studentid=request.getParameter("v");
     String studentname=null;
     String studentbranch=null;
     String studentsemester=null;
     String studentphone=null;
     String studentemail=null;
     String studentaddress=null;
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
	   String query="select * from studentrecord where studentid=?";
       PreparedStatement ps=conn.prepareStatement(query);
       ps.setString(1, studentid);
       ResultSet rs = ps.executeQuery();
       if(rs.next())
       {
        studentname=rs.getString(2);
        studentbranch=rs.getString(3);
        studentsemester=rs.getString(4);
        studentphone=rs.getString(5);
        studentemail=rs.getString(6);
        studentaddress=rs.getString(7);%>
		
		<center>
     <form action="UpdateStudentProcess.jsp">
      <table class="table" style="width: 50%;">
       <tr><td style="color:white;"><b>Roll Number</b></td><td style="color:white;"><b><%=studentid%></b>
       <input class="form-control" type="hidden" name="updateid" value="<%=studentid%>"/></td></tr>
       <tr><td style="color:white;"><b>Student Name</b></td>
       <td><input class="form-control" type="text" name="student_name" value="<%=studentname%>"/></td></tr>
       <tr><td style="color:white;"><b>Branch</b></td>
       <td><input class="form-control" type="text" name="student_branch" value="<%=studentbranch%>"/></td></tr>
       <tr><td style="color:white;"><b>Semester</b></td>
       <td><input class="form-control" type="text" name="student_semester" value="<%=studentsemester%>"/></td></tr>
       <tr><td style="color:white;"><b>Contact Number</b></td>
       <td><input class="form-control" type="text" name="student_phone" value="<%=studentphone%>"/></td></tr>
       <tr><td style="color:white;"><b>Email</b></td>
       <td><input class="form-control" type="text" name="student_email" value="<%=studentemail%>"/></td></tr>
       <tr><td style="color:white;"><b>Address</b></td>
       <td><input class="form-control" type="text" name="student_address" value="<%=studentaddress%>"/></td></tr>
       <tr colspan="2"><td><input class="form-control" type="submit" name="submitbtn" value="UPDATE"/></td></tr>
      </table>
     </form>
	 </center>
       <%}
	 }
	 catch(Exception e)
	 {
	  out.println(e.getMessage());
	 } 
     
     %>
     </fieldset>
	 </div></div></div>
	 
	 
  </body>
</html>
