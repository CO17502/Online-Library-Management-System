<!DOCTYPE html>
<html lang="en">
<head>
  <title> CCET | Chandigarh | Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap/bootstrap_/css/bootstrap.min.css" type="text/css">
  <script type="text/javascript" src="bootstrap/bootstrap_/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="bootstrap/bootstrap_/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="style/Index.css" type="text/css"/>
  <script type="text/javascript" src="script/navbar.js"></script>
  <style>
    .carousel-caption{
      top: 30%;
      background-color: rgba(255, 0, 0, 0.3);
      height: 50%;
    }
  </style>
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
          <h1><b>Welcome to Library</b></h1>
          <h3><b>Login as: </b></h3>
          <br/><br/>
            <div>
               <button><a class="btn btn-theme btn-md btn-min-block" href="LoginPage.jsp"><b>Admin</b></a></button>
               <button><a class="btn btn-theme btn-md btn-min-block" href="LoginPageStudent.jsp"><b>Student</b></a></button>
            </div>
        </div>
      </div>

      <div class="item">
        <img src="images/4.jpg" style="width:100%;">
        <div class="carousel-caption">
          <h1><b>Welcome to Library</b></h1>
          <h3><b>Login as: </b></h3>
          <br/><br/>
            <div>
                              <button><a class="btn btn-theme btn-md btn-min-block" href="LoginPage.jsp"><b>Admin</b></a></button>
                              <button><a class="btn btn-theme btn-md btn-min-block" href="LoginPageStudent.jsp"><b>Student</b></a></button>
                            </div>
        </div>
      </div>
    
      <div class="item">
        <img src="images/4.jpg" alt="New York" style="width:100%;">
        <div class="carousel-caption">
          <h1><b>Welcome to Library</b></h1>
          <h3><b>Login as: </b></h3>
          <br/><br/>
            <div>
                              <button><a class="btn btn-theme btn-md btn-min-block" href="LoginPage.jsp"><b>Admin</b></a></button>
                              <button><a class="btn btn-theme btn-md btn-min-block" href="LoginPageStudent.jsp"><b>Student</b></a></button>
                            </div>
        </div>
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
<div class="ftr">
            Copyright © CCET Degree Wing. All Rights Reserved | Contact Us: +91 90000 00000
        </div>
</body>
</html>

