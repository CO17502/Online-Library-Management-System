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
    
    <title> CCET | Chandigarh | Student Registration Details</title>
    
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

  <script type="text/javascript">
   fuction displayconfirmation()
   {
    alert('Data is successfully inserted!');
   }
  </script>
  </head>
  
  <body  onresize="ReSzNav(),checkLogo()" onload="resolvePanel(),checkLogo()">
<div id="HdNav" onclick="comNav()"></div>
        <div class="NvBrCnt" id="NvBrCnt">
            <ul class="NvBr">
                <li class="NvBrLt" id="HmBtn">
                    <a href="home.jsp" id="active"><span class="glyphicon glyphicon-home"></span> Home</a>
                </li>
                <li class="NvBrRt" id="NvHd">
                    <span class="glyphicon glyphicon-align-justify" onclick="expNav()"></span>
                </li>
                
                <li class="NvBrRt">
                    <a href="AboutUs.jsp"><span class="glyphicon glyphicon-align-justify"></span> About Us</a>
                </li>
                <li class="NvBrRt">
                    <a href="ContactUs.jsp"><span class="glyphicon glyphicon-earphone"></span> Contact Us</a>
                </li>
            </ul>
        </div>
   
   <div id="bgimg" style='background-image:url("images/6.jpg");'></div>
   <br/><br/>
  <center><h1 style="color: white;">
   
     <% 
      String studentid=request.getParameter("studentid");
      String studentname=request.getParameter("studentname");
      String studentbranch=request.getParameter("studentbranch");
      String studentsemester=request.getParameter("studentsemester");
      String studentphone=request.getParameter("studentphone");
      String studentemail=request.getParameter("studentemail");
      String studentaddress=request.getParameter("studentaddress");
         
      
      try
      {
       //System.out.println("Hello");
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
	   
       String query="insert into studentrecord values(?,?,?,?,?,?,?)";
       PreparedStatement ps=conn.prepareStatement(query);
       ps.setString(1, studentid);
       ps.setString(2, studentname);
       ps.setString(3, studentbranch);
       ps.setString(4, studentsemester);
       ps.setString(5, studentphone);
       ps.setString(6, studentemail);
       ps.setString(7, studentaddress);
       int i=ps.executeUpdate();
       if(i>0)
       {
        out.println("<p style='color: white;'>Data successfully inserted!</p>");
        out.println("<center><div id='banner_content'><a href=StudentLoginDetails.jsp?v="+studentid+" class='btn btn-danger btn-lg active'> Enter Login Details </a></div></center>");     
       }
       else
       {
        out.println("<p style='color: white;'>Query not executed</p>");
       }
       }
      catch(Exception e)
      {
       out.println("<p style='color: white;'>"+e.getMessage()+"</p>");
      }
      
     %>
     </h1></center>
         <div class="ftr">   
       		Copyright © CCET Degree Wing. All Rights Reserved | Contact Us: +91 90000 00000
        </div>
  </body>
</html>
