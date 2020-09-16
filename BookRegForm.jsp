<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
    <base href="<%=basePath%>">
    
    <title> CCET | Chandigarh | Book Registration</title>
    
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
          function validate()
          {
            if(document.bookreg.bookid.value=="")
            {
              alert("Enter the Book ID");
              bookreg.bookid.focus();
              return false;
            }
            if(document.bookreg.booktitle.value=="")
            {
              alert("Enter the Book Title");
              bookreg.booktitle.focus();
              return false;
            }
            if(document.bookreg.bookauthor.value=="")
            {
              alert("Enter the Book Author Name");
              bookreg.bookauthor.focus();
              return false;
            }
            if(document.bookreg.booktype.value=="")
            {
              alert("Enter the Book Type");
              bookreg.booktype.focus();
              return false;
            }
            if(document.bookreg.bookdepartment.value=="")
            {
              alert("Enter the Book Department");
              bookreg.bookdepartment.focus();
              return false;
            }
           
            if(document.bookreg.bookedition.value=="")
            {
              alert("Enter the Book Edition");
              bookreg.bookedition.focus();
              return false;
            }
            var bookedition=bookreg.bookedition.value;
            if(bookedition!="")
            {
              var digit = /^[0-9]+$/;
              if(!bookedition.match(digit)) 
              {
                alert('Enter only digits in Edition');
                bookreg.bookedition.focus();
                return false;
              }
            }

            if(document.bookreg.publishername.value=="")
            {
              alert("Enter the Publisher Name");
              bookreg.publishername.focus();
              return false;
            }

          }
        </script>
    
  </head>
  <body  onresize="ReSzNav(),checkLogo()" onload="resolvePanel(),checkLogo()">
  
    <div id="bgimg" style='background-image:url("images/3.jpg");'></div>

    <center><h1 id="pageName" style="color: white;">THE GENERIES</h1></center>
    <div id="mainTab">
      <div id="leftImage">
        <center><img src="images/11.png" id="clglogo"></center>
      </div>
      <div class="rightOptions" id="rightOptions">
        <div class="loginlog">
          <fieldset>
            <form action="BookReg.jsp" method="POST" name="bookreg">          
              <center><h1><b>Book Registration</b></h1></center>
              
              <center>
                <div class="form-group">
                  <input type="text" class="form-control" name="bookid" placeholder="Book ID" id="formselect">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="booktitle" placeholder="Book Title" id="formselect">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="bookauthor" placeholder="Author" id="formselect">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="booktype" placeholder="Book Type" id="formselect">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="bookdepartment" placeholder="Book Department" id="formselect">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="bookedition" placeholder="Edition" id="formselect">
                </div>
                <div>
                  <h3><b style="color: red;">Publisher Details</b></h3>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="publishername" placeholder="Publisher Name" id="formselect">
                </div>
                
                <input type="submit" name="submit" value="Submit" class="btn btn-primary submit" onclick="return validate()">
                <input type="reset" name="reset" value="Reset" class="btn btn-danger"/>
              </center>
              
              </form>
          </fieldset>
        </div>
      </div>  
    </div>
    
    
       </body>
       </html>
