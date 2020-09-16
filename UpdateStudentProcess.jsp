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
    
    <title>My JSP 'UpdateStudentProcess.jsp' starting page</title>
    
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
<div id="HdNav" onclick="comNav()"></div>
        <div class="NvBrCnt" id="NvBrCnt">
            <ul class="NvBr">
                <li class="NvBrLt" id="HmBtn">
                    <a href="home.jsp" id="active">Home</a>
                </li>
                <li class="NvBrRt" id="NvHd">
                    <span class="glyphicon glyphicon-align-justify" onclick="expNav()"></span>
                </li>
				<li class="NvBrRt">
                    <a href="LogOut.jsp"><span class="glyphicon glyphicon-log-out"></span> LogOut</a>
                </li>
                <li class="NvBrRt">
                    <a href="AboutUs.jsp"><span class="glyphicon glyphicon-align-justify"></span> About Us</a>
                </li>
                <li class="NvBrRt">
                    <a href="ContactUs.jsp"><span class="glyphicon glyphicon-earphone"></span> Contact Us</a>
                </li>
				
            </ul>
        </div>

    <div id="bgimg" style='background-image:url("images/13.jpg");'></div>

    <%
     String studentid=session.getAttribute("userid").toString(); 
     try
     {
      
      String studentname = request.getParameter("student_name");
      String studentbranch = request.getParameter("student_branch");
      String studentsemester = request.getParameter("student_semester");
      String studentphone = request.getParameter("student_phone");
      String studentemail = request.getParameter("student_email");
      String studentaddress = request.getParameter("student_address");
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
		String query="update studentrecord set studentname=?,studentbranch=?,studentsemester=?,studentphone=?,studentemail=?,studentaddress=? where studentid=?";
		PreparedStatement ps=conn.prepareStatement(query);
		ps.setString(1, studentname);
		ps.setString(2, studentbranch);
		ps.setString(3, studentsemester);
		ps.setString(4, studentphone);
		ps.setString(5, studentemail);
		ps.setString(6, studentaddress);
		ps.setString(7, studentid);
		int r=ps.executeUpdate();
		if(r>0)
		{
		 System.out.println("<center><h1 id='pageName' style='color: red;'>Successfully Updated!</h1></center>");
		 Thread.sleep(2000);
		 String msg="Successfully Updated!";
		 response.sendRedirect("ViewProfile.jsp?v="+msg);
		}
     }
     catch(Exception e)
     {
      out.println(e.getLocalizedMessage());
     }
     %>
     <div id="err"><div id="errbox" onclick="hideErr()"></div></div>
        <div class="ftr">   
       		Copyright © CCET Degree Wing. All Rights Reserved | Contact Us: +91 90000 00000
        </div>
  </body>
</html>
