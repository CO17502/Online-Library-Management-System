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
    
    <title> CCET | Chandigarh | Student Login Details</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="style/Index.css" type="text/css">
	<link rel="stylesheet" href="bootstrap/bootstrap_/css/bootstrap.min.css" type="text/css">
    <script type="text/javascript" src="bootstrap/bootstrap_/js/jquery-3.3.1.min.js"></script>        
    <script type="text/javascript" src="bootstrap/bootstrap_/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="script/navbar.js"></script>

	<script>
		function validate(){
			if(document.login.username.value=="")
				{
					alert("Enter the username");
					login.username.focus();
					return false;
				}

				if(document.login.student_password.value=="")
				{
					alert("Enter the Password");
					login.student_password.focus();
					return false;
				}
				
				if(document.login.student_cnfrmpassword.value=="")
				{
					alert("Enter the Confirm Password");
					login.student_cnfrmpassword.focus();
					return false;
				}
				
				if(document.login.student_password.value!=document.login.student_cnfrmpassword.value)
				{
					alert("Password does not match");
					login.student_password.focus();
      				return false;
				}
				var str1=document.login.student_password.value;
				var str2=document.login.student_cnfrmpassword.value;
				if(str2==str1 && str1.length<7)
                {     
                alert("Password length should be greater than 7");
				login.student_password.focus();
      			return false;        
      			}
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

    <div id="bgimg" style='background-image:url("images/3.jpg");'></div>

	<center><h1 id="pageName" style="color: white;">Student Registration</h1></center>


	<div id="mainTab">
		<div id="leftImage"><center>
			<img src="images/11.png" id="clglogo"></center>
		</div>
		<div class="rightOptions" id="rightOptions">
		
				<div class="loginlog">
					<fieldset>

    <%
     String studentid=request.getParameter("v");
     %>
     <center>
     <h3 style="color:white;">Enter Login Details</h3>
     <form action="StudentLoginDetalsProcess.jsp" method="post" name="login">
      <table class="table" style="width: 50%;"><br/>
       <tr><td style="color:white;"><b>Username</b></td><td><b><input type="text" name="username" value="<%=studentid%>"/></b>
       <tr><td style="color:white;"><b>Password</b></td>
       <td><input class="form-control" type="password" name="student_password"/></td></tr>
       <tr><td style="color:white;"><b>Confirm Password</b></td>
       <td><input class="form-control" type="password" name="student_cnfrmpassword"/></td></tr>
        </table>
       <div><input type="submit" name="submit" value="Submit" class="btn btn-primary submit" onclick="return validate()"></div>
		<br><br>
		<div><input type="reset" name="reset" class="btn btn-danger" value="Reset"/>	</div>	      
       </form>
       </center>
        </fieldset>
	 </div></div></div>
	
	 
	 <div id="err"><div id="errbox" onclick="hideErr()"></div></div>
        <div class="ftr">   
       		Copyright © CCET Degree Wing. All Rights Reserved | Contact Us: +91 90000 00000
        </div>
	</body>

</html>
