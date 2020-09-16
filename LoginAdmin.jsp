<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>CCET | Chandigarh | Admin</title>
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
  <style>
  .container{
  height: 230px;
  width: 100%;
  background-color: purple;
  }
  .carousel-caption{
      top: 6%;
      background-color: rgba(255, 0, 0, 0.3);
      height: 150px;
    }
    #myCarousel{
    height: 150px;
    }
    
    .btn{ 
    	background-color: rgba(0,0,255,0.5);
    }
    .carousel-inner{
    	height: 200px;
    }
	.vertical-menu {
  		bottom: 5%;
  		width: 20%;
  		height: 350px;
  		margin-bottom: 100px;
  		opacity:1;
 		overflow-y: auto;
	}

	.vertical-menu a {
		background-color: #eee;
  		color: black;
  		display: block;
  		padding: 12px;
  		text-decoration: none;
	}

	.vertical-menu a:hover {
  		background-color: blue;
	}

</style>
  
  <script>
  	function option1(){document.getElementById('option').src="SearchAdmin.jsp";}
  	function option2(){document.getElementById('option').src="ViewRequests.jsp";}
  	function option3(){document.getElementById('option').src="ViewIssueReturnRecord.jsp";}
  	function option6(){document.getElementById('option').src="ViewDueBooks.jsp";}
  	function option4(){document.getElementById('option').src="ViewStudents.jsp";}
  	function option5(){document.getElementById('option').src="ViewReturnRequests.jsp";}
  	function option7(){document.getElementById('option').src="BookRegForm.jsp";}
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

<div class="container">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
    	<!-- Indicators -->
    	<ol class="carousel-indicators">
      		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      		<li data-target="#myCarousel" data-slide-to="1"></li>
      		<li data-target="#myCarousel" data-slide-to="2"></li>
    	</ol>

    		<!-- Wrapper for slides -->
    		<div class="carousel-inner">

      			<div class="item active">
        			<img src="images/4.jpg" style="width:100%;">
        			<div class="carousel-caption">
          				<h4 style="color: white;"><b>Hello Admin</b></h4>
        			</div>
      			</div>

      			<div class="item">
        			<img src="images/3.jpg" style="width:100%;">
        			<div class="carousel-caption">
          				<h4 style="color: white;"><b>Hello Admin</b></h4>
        			</div>
      			</div>
    
      			<div class="item">
        			<img src="images/4.jpg" style="width:100%;">
        			<div class="carousel-caption">
          				<h4 style="color: white;"><b>Hello Admin</b></h4>
      				</div>
    			</div>

    		<!-- Left and right controls -->
    		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
      			<span class="glyphicon glyphicon-chevron-left"></span>
      			<span class="sr-only">Previous</span>
    		</a>
    		<a class="right carousel-control" href="#myCarousel" data-slide="next">
      			<span class="glyphicon glyphicon-chevron-right"></span>
      			<span class="sr-only">Next</span>
    		</a>
  		</div>
	</div>
</div>

  <div id="bgimg" style='background-image:url("images/14.jpg"); opacity:0.5;'></div>
   
<div class="vertical-menu" style="display: inline-block;">
    <h4><a class="btn btn-primary" onclick="option1()"><b>Search</b></a></h4>
    <br/>
    <h4><a class="btn btn-primary" onclick="option2()"><b>View Issue Requests</b></a></h4>
    <br/>
    <h4><a class="btn btn-primary" onclick="option3()"><b>View Previous Records</b></a></h4>
    <br/>
    <h4><a class="btn btn-primary" onclick="option5()"><b>View Return Request</b></a></h4>
    <br/>
    <h4><a class="btn btn-primary" onclick="option6()"><b>View Due Books</b></a></h4>
    <br/>
    <h4><a class="btn btn-primary" onclick="option4()"><b>View Registered Students</b></a></h4>
    <br/>
    <h4><a class="btn btn-primary" onclick="option7()"><b>Add New Book</b></a></h4>
    <br/>
    <br/><br/>
</div>

	
	<div style="display: inline-block; width: 78%; margin-bottom: 20px; overflow-x:scroll;"><iframe id="option" src="" height=80% width=120% frameborder="1"></iframe></div>
	    <div style="width: 100px;"> </div>
       <div class="ftr">   
          Copyright © CCET Degree Wing. All Rights Reserved | Contact Us: +91 90000 00000
        </div>
  </body>
</html>
