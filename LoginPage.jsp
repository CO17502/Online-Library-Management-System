<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
		<base href="<%=basePath%>">
		
		<title> CCET | Chandigarh | Admin Login </title>
		
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
		
		
		<script>
			
			function validate(){
				if(document.login.username.value=="")
				{
					alert("Enter the username");
					login.username.focus();
					return false;
				}

				if(document.login.password.value=="")
				{
					alert("Enter the Password");
					login.password.focus();
					return false;
				}
				}
		</script>
        
    </head>
	<body  onresize="ReSzNav(),checkLogo()" onload="resolvePanel(),checkLogo()">
		<%  String msg=request.getParameter("b");
    	if(msg==null)
    	{
    		msg=" ";
    	}
     %>
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
		<center><h1 id="pageName" style="color: white;">THE LIBRARY</h1></center>

		<div id="mainTab">
			<div id="leftImage">
				<center><img src="images/11.png" id="clglogo"></center>
			</div>
			<div class="rightOptions" id="rightOptions">
				<div class="loginlog">
					<fieldset>
						<form action="login.jsp" method="POST" name="login">          
							<center><h1><b>LOGIN</b></h1></center>
							<table>
							<tr><td colspan=2><center><font color="red"><%=msg%></font></center></td></tr></table>
							<center>
								<div class="form-group">
									<input type="text" class="form-control" name="username" placeholder="Enter Your Username" id="formselect">
								</div>
								<div class="form-group">
									<input type="password" class="form-control" name="password" placeholder="Enter Your Password" id="password" value="" id="formselect">
								</div>
								<input type="submit" name="submit" value="Login" class="btn btn-primary submit" onclick="validate()">
								<br/>
								</center>
    	
						</form>
						<a href="LoginAs.jsp"><button class="btn btn-danger"><span class="glyphicon glyphicon-arrow-left"></span>  Back</button></a>
							
					</fieldset>
				</div>
			</div>	
		</div>
		
		<div id="err"><div id="errbox" onclick="hideErr()"></div></div>
		
		<div class="ftr">   
       		Copyright © CCET Degree Wing. All Rights Reserved | Contact Us: +91 90000 00000
        </div>
	</body>
</html>
