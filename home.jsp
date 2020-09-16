<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
		<base href="<%=basePath%>">
    
        <title> CCET | Chandigarh</title> 
		
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

    <body onresize="ReSzNav()">
        <div id="HdNav" onclick="comNav()">hello</div>
        <div class="NvBrCnt" id="NvBrCnt" style="">
            <ul class="NvBr">
                <li class="NvBrLt" id="HmBtn">
                    <a href="home.jsp" id="active"><span class="glyphicon glyphicon-home"></span> Home</a>
                </li>
                <li class="NvBrRt" id="NvHd">
                    <span class="glyphicon glyphicon-align-justify" onclick="expNav()"></span>
                </li>
                <li class="NvBrRt">
					<a href="LoginAs.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a>
                </li>
                <li class="NvBrRt">
					<a href="StudentRegForm.jsp"><span class="glyphicon glyphicon-align-justify"></span> Sign Up</a>
				</li>
                <li class="NvBrRt">
                    <a href="AboutUs.jsp"><span class="glyphicon glyphicon-align-justify"></span> About Us</a>
                </li>
                <li class="NvBrRt">
                    <a href="ContactUs.jsp"><span class="glyphicon glyphicon-earphone"></span> Contact Us</a>
                </li>
            </ul>
        </div>
         <div id="bgimg" style='background-image:url("images/1.jpg");'></div>
            <center><h1 id="pageName"><a href="developers.jsp">THE LIBRARY</a></h1></center>
            <center>
                <div id="banner_content">
                    <a href="SearchDropdown.jsp" class="btn btn-danger btn-lg active"> Book Center - Search <span class="glyphicon glyphicon-search"></span></a>     
                </div>
            </center>
        <div class="ftr">
            Copyright © CCET Degree Wing. All Rights Reserved | Contact Us: +91 90000 00000
        </div>
    </body>
</html>