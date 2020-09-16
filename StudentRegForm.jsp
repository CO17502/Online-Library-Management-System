<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
 <head>
    <base href="<%=basePath%>">
	<title> CCET | Chandigarh | Student Registration</title>
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
	<script type="text/javascript">
	 function validate()
	 {
	   if(document.studentreg.studentid.value=="")
       {
        alert("Enter the Roll Number");
        studentreg.studentid.focus();
        return false;
       }
       if(document.studentreg.studentname.value=="")
       {
        alert("Enter the Name");
        studentreg.studentname.focus();
        return false;
       }
       if(document.studentreg.studentbranch.value=="")
       {
        alert("Enter the Branch");
        studentreg.studentbranch.focus();
        return false;
       }  
       if(document.studentreg.studentsemester.value=="")
       {
        alert("Enter the Semester");
        studentreg.studentsemester.focus();
        return false;
       } 
       
       if(document.studentreg.studentphone.value=="")
       {
        alert("Enter the Contact Number");
        studentreg.studentphone.focus();
        return false;
       } 
       var studentphone=studentreg.studentphone.value;
       if(studentphone!="")
       {
        var digit = /^[0-9]+$/;
        if(!studentphone.match(digit)) 
        {
         alert('Enter only digits in Contact Number');
         studentreg.studentphone.focus();
         return false;
        } 
        var dig = /^\d{10}$/;
        if(!studentphone.match(dig)) 
        {
         alert('Enter 10 digit Contact Number');
         studentreg.studentphone.focus();
         return false;
        } 
       }
       if(document.studentreg.studentemail.value=="")
       {
        alert("Enter the E-Mail");
        studentreg.studentemail.focus();
        return false;
       }
       var studentemail=studentreg.studentemail.value;
       var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
       if(!studentemail.match(reg)) 
       {
       alert('Invalid Email Address');
       studentreg.studentemail.focus();
       return false;
       }
       if(document.studentreg.studentaddress.value=="")
       {
        alert("Enter the Address");
        studentreg.studentaddress.focus();
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

<center><h1 id="pageName" style="color: white;">THE LIBRARY</h1></center>


<div id="mainTab">
<div id="leftImage"><center>
	<img src="images/11.png" id="clglogo"></center>
</div>
<div class="rightOptions" id="rightOptions">
<div class="loginlog">
	<fieldset>
	<form name="studentreg" action="StudentReg.jsp" method="POST">          
        	<center><h1><b>Student Registration</b></h1></center>
        	<center>
            <div class="form-group">
              	<input type="text" class="form-control" name="studentid" id="formselect" placeholder="Roll Number ">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="studentname" id="formselect" placeholder="Name ">
	     	</div>
			<div class="form-group">
                <input type="text" class="form-control" name="studentbranch" id="formselect" placeholder="Branch">
	     	</div>
			<div class="form-group">
                <input type="text" class="form-control" name="studentsemester" id="formselect" placeholder="Semester ">
	     	</div>
			<div class="form-group">
                <input type="text" class="form-control" name="studentphone" id="formselect" placeholder="Contact Number">
	     	</div>
			<div class="form-group">
                <input type="text" class="form-control" name="studentemail" id="formselect" placeholder="Email Address">
	     	</div>
			<div class="form-group">
                <input type="text" class="form-control" name="studentaddress" id="formselect" placeholder="Address ">
	     	</div>
			<input type="submit" name="submit" value="Submit" class="btn btn-primary submit" onclick="return validate()">
			<input type="reset" name="reset" class="btn btn-danger" value="Reset"/>				
			</center>
    	
	</form>
	</fieldset>
</div>
</div>	
</div>
        <div class="ftr">   
       		Copyright © CCET Degree Wing. All Rights Reserved | Contact Us: +91 90000 00000
        </div>
	</body>
</html>
