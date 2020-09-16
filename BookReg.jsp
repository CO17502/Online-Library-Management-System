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
    
    <title>'BookReg.jsp'</title>
    
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

 <div id="bgimg" style='background-image:url("images/5.jpg");'></div>
    <br/><br/>
  <center><h1>
    <% 
      String bookid=request.getParameter("bookid");
      String booktitle=request.getParameter("booktitle");
      String bookauthor=request.getParameter("bookauthor");
      String booktype=request.getParameter("booktype");
      String bookdepartment=request.getParameter("bookdepartment");
      String bookedition=request.getParameter("bookedition");
      String publishername=request.getParameter("publishername");
      String status="available";
      //System.out.println("Hi");
      
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
	   
       String query="insert into bookrecord values(?,?,?,?,?,?,?,?)";
       //System.out.println("a");
       PreparedStatement ps=conn.prepareStatement(query);
       //System.out.println("b");
       ps.setString(1, bookid);
       ps.setString(2, booktitle);
       ps.setString(3, bookauthor);
       ps.setString(4, booktype);
       ps.setString(5, bookdepartment);
        ps.setString(6, bookedition);
       ps.setString(7, publishername);
       ps.setString(8, status);
        int i=ps.executeUpdate();
       System.out.println("c");
       if(i>0)
       {
        out.println("<p style='color: white;'>Book Data successfully inserted!</p>");
         }
       else
       {
        out.println("<p style='color: white;'>Book Data Cannot be Inserted.</p>");
        }
       }
      catch(Exception e)
      {
       out.println("<p style='color: white;'>"+e.getMessage()+"</p>");
       }
      %>
      </h1></center>
      
      <div id="err"><div id="errbox" onclick="hideErr()"></div></div>
		
		<div class="ftr">   
       		Copyright © CCET Degree Wing. All Rights Reserved | Contact Us: +91 90000 00000
        </div>
      
  </body>
</html>