<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ViewDuebyDate.jsp' starting page</title>
    
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
	

  <script>
        function func()
        {
          if(document.frm.searchdate.value=="")
          {
           alert('Enter Due Date');
           frm.searchdate.focus();
           return false;}
        }
  </script>
  </head>
  
  <body>
  	<div id="bgimg" style='background-image:url("images/6.jpg");'></div>
 	<center>
 		<div id='banner_content'><h3> 
     <%String msg=request.getParameter("b");
      if(msg==null)
      {
        msg=" ";
      }%>
     <b style="color: white;">Enter Date(yyyy/mm/dd)</b>
    
    <div><center><font color="red"><%=msg%></font></center></div>
    
    <form action="ViewDuebyDateProcess.jsp" name="frm" method="post">
    <table><tr><td colspan=2><center><font color="red"><%=msg%></font></center></td></tr></table>
    <div class="form-group">
    	<input type="text" class="form-control" name="searchdate"  /><br></div>
    <input type="Submit" class='btn btn-primary btn-lg active' name="submit" value="submit" onclick="return func()">
    <a href="ViewDueBooks.jsp"><button class="btn btn-danger btn-lg active">Back</button></a><br/>
    </h3>
    </div>
    </center>
  </form>
  </body>
</html>
