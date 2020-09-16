<%@ page language="java" import="java.util.*,java.sql.*,java.util.Calendar,java.text.SimpleDateFormat" pageEncoding="ISO-8859-1"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ViewProfile.jsp' starting page</title>
    
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
  
  <body>
  <div id="bgimg" style='background-image:url("images/6.jpg");'></div>
   <br/><br/>
  
 <center><div id='banner_content'><h3>
<%
     String studentid=session.getAttribute("userid").toString(); 
    String msg=request.getParameter("v");
      if(msg==null)
      {
        msg=" ";
      }%>
      <div><center><font color="red"><%=msg%></font></center></div>
          <%
            try
            {
             Class.forName("com.mysql.jdbc.Driver"); 
	   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root"); 
	   String query="Select * from studentrecord where studentid=?"; 
	   PreparedStatement ps=conn.prepareStatement(query); 
	   ps.setString(1, studentid); 
	   ResultSet rs=ps.executeQuery(); 
       while(rs.next()) 
       { 
        String studentname=rs.getString(2); 
        String studentbranch=rs.getString(3); 
        String studentsemester=rs.getString(4); 
        String studentphone=rs.getString(5); 
        String studentemail=rs.getString(6); 
        String studentaddress=rs.getString(7); 
       }
      }
            catch(Exception e)
            {
             out.println(e.getMessage());
            }
           %>
         <a href="ViewPersonalProfile.jsp"><button class='btn btn-danger btn-lg active'>Update</button></a>
         </h3>
    </div>
    </center>
    
  </body>
</html>
