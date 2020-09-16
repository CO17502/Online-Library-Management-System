<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
		<base href="<%=basePath%>">
		
		<title> CCET | Chandigarh | Contact Us</title>
	
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
        <div class="NvBrCnt" id="NvBrCnt">
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
        
        <div id="bgimg" style='background-image:url("images/2.jpg");'></div>
            
            <center><h1 id="pageName" style="color: red;">THE LIBRARY</h1></center>
            
            <center>
            <h2 style="color: white;"><u>GET IN TOUCH </u></h2><br>
            <div class="contactUsTable">
            <table class="UsTable">
                <tbody>
                    <tr id="row1">
                        <td>Phone</td>
                        <td>+91-172-2750872,<br>
                            +91-172-2750943,<br>
                            +91-172-2750947</td>
                    </tr>
                    <tr id="row0">
                        <td>Fax</td>
                        <td>0172-2750872 </td>
                    </tr>
                    <tr id="row1">
                        <td>Principal </td>
                        <td>principal@ccet.ac.in<br>
                            Any Student Verification/Enquiry mail to be sent at the Academics Email Id.</td>
                    
                    </tr>
                    <tr id="row0">
                        <td>General Inquiry (Academics)</td>
                        <td>academics@ccet.ac.in</td>
                    </tr>
                    <tr id="row1">
                        <td>Admissions Help Desk</td>
                        <td>admission@ccet.ac.in<br>
                            +91 172-2750947</td>
                    </tr>
                    <tr id="row0">
                        <td>Librarian</td>
                        <td>library@ccet.ac.in<br>
                            +91 172-2750479</td>
                    </tr>
                </tbody>
            </table>
            <br/><br/><br/>
            <h2 style="color: white;"><u>View Our Location:</u></h2>
            <br/><br/>
            <div style="width: 100%"><iframe width="100%" height="600" src="https://maps.google.com/maps?width=100%&amp;height=600&amp;hl=en&amp;q=CCET%2C%20Sec-26%2C%20Chandigarh+(CCET%2C%20Chd)&amp;ie=UTF8&amp;t=&amp;z=14&amp;iwloc=B&amp;output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"><a href="https://www.maps.ie/map-my-route/">Map a route</a></iframe></div><br />
        </div>
        </center>

        <div class="ftr">
            <center>
                Copyright © CCET Degree Wing. All Rights Reserved | Contact Us: +91 90000 00000
            </center>
        </div>
    </body>
</html>