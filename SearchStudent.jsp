<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title> CCET | Chandigarh | Search</title>
    
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
        function func()
        {
          if(document.frm.search.value=="")
          {
           alert("Enter Book Title or Subject or Department or Author Name or Publisher Name to search.");
           frm.search.focus();
           return false;}
        }
  </script>

  </head>
  
  <body>
   
      <jsp:include page="header.jsp"></jsp:include>
 <div style="height: 50px;"></div>
      
     <div>
      <br/>
      <center>
        <form name="frm" action="SearchProcessStudent.jsp" method="Post">
          <div class="form-group">
            <div><h3 style="color: black;">Search</h3></div>
            
          <h4><select style="top:50px; color: black;" name="search">
          	<option value="title"/>Book Title</option>
          	<option class="form-control" value="author"/>Book Author</option>
          	<option class="form-control" value="type"/>Book Type</option>
          	<option class="form-control" value="department"/>Book Department</option>
          	<option class="form-control" value="publisher"/>Book Publisher</option>
          </select></h4><br/>
          <div><input class="btn btn-primary" type="submit" name="btn" value="Search" onclick="return func()"></div>
        </div>
      </form>
      </center>
        
     </div>
  </body>
</html>

