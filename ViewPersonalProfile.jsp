<%@ page language="java" import="java.util.*,java.sql.*,java.util.Calendar,java.text.SimpleDateFormat" pageEncoding="ISO-8859-1"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ViewPersonalProfile.jsp' starting page</title>
    
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

  <script type="text/javascript">
	 function validate()
	 {
	   
       if(document.studentreg.student_name.value=="")
       {
        alert("Enter the Name");
        studentreg.student_name.focus();
        return false;
       }
       if(document.studentreg.student_branch.value=="")
       {
        alert("Enter the Branch");
        studentreg.student_branch.focus();
        return false;
       }  
       if(document.studentreg.student_semester.value=="")
       {
        alert("Enter the Semester");
        studentreg.student_semester.focus();
        return false;
       } 
       var student_semester=studentreg.student_semester.value;
       if(student_semester!="")
       {
        var digit = /^[0-9]+$/;
        if(!student_semester.match(digit)) 
        {
         alert('Enter only digits in semester');
         studentreg.student_semester.focus();
         return false;
        } 
        var dig = /^\d{1}$/;
        if(!student_semester.match(dig)) 
        {
         alert('Enter 1 digit semester');
         studentreg.student_semester.focus();
         return false;
        } 
       }
       if(document.studentreg.student_phone.value=="")
       {
        alert("Enter the Contact Number");
        studentreg.student_phone.focus();
        return false;
       } 
       var student_phone=studentreg.student_phone.value;
       if(studentphone!="")
       {
        var digit = /^[0-9]+$/;
        if(!student_phone.match(digit)) 
        {
         alert('Enter only digits in Contact Number');
         studentreg.student_phone.focus();
         return false;
        } 
        var dig = /^\d{10}$/;
        if(!student_phone.match(dig)) 
        {
         alert('Enter 10 digit Contact Number');
         studentreg.student_phone.focus();
         return false;
        } 
       }
       if(document.studentreg.student_email.value=="")
       {
        alert("Enter the E-Mail");
        studentreg.student_email.focus();
        return false;
       }
       var student_email=studentreg.student_email.value;
       var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
       if(!student_email.match(reg)) 
       {
       alert('Invalid Email Address');
       studentreg.student_email.focus();
       return false;
       }
       if(document.studentreg.student_address.value=="")
       {
        alert("Enter the Address");
        studentreg.student_address.focus();
        return false;
       }
      }
	</script>
  
  </head>
  
  <body  onresize="ReSzNav(),checkLogo()" onload="resolvePanel(),checkLogo()">
<div id="bgimg" style='background-image:url("images/13.jpg");'></div>

<center><h1 id="pageName" style="color: red;">Your Profile</h1></center>


<div id="mainTab">

<div class="data-table">
<div class="loginlog">
	<fieldset>
	
	 <% 
     String studentid=session.getAttribute("userid").toString(); 
     try 
     { 
       Class.forName("com.mysql.jdbc.Driver"); 
	   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root"); 
	   String query="Select * from studentrecord where studentid=?"; 
	   PreparedStatement ps=conn.prepareStatement(query); 
	   ps.setString(1, studentid); 
	   ResultSet rs=ps.executeQuery(); 
       while(rs.next()) 
       { 
        /*String studentname=rs.getString(2); 
        String studentbranch=rs.getString(3); 
        String studentsemester=rs.getString(4); 
        String studentphone=rs.getString(5); 
        String studentemail=rs.getString(6); 
        String studentaddress=rs.getString(7); */
       //}
       %>
       <form action="UpdateStudentProcess.jsp" name="studentreg" method="post">
       <table class="table table-bordered">
        <tr class="warning">
         <td>Roll Number</td>
         <td><%=studentid %></td>
        </tr>
        <tr class='active'>
         <td>Student Name</td>
         <td><input class="form-control" type="text" name="student_name" value="<%=rs.getString(2)%>"/></td>
        </tr>
        <tr class='active'>
         <td>Branch</td>
         <td><input class="form-control" type="text" name="student_branch" value="<%=rs.getString(3)%>"/></td>
        </tr>
        <tr class='active'>
         <td>Semester</td>
         <td><input class="form-control" type="text" name="student_semester" value="<%=rs.getString(4)%>"/></td>
        </tr>
        <tr class='active'>
         <td>Contact Number</td>
         <td><input class="form-control" type="text" name="student_phone" value="<%=rs.getString(5)%>"/></td>
        </tr>
        <tr class='active'>
         <td>Email</td>
         <td><input class="form-control" type="text" name="student_email" value="<%=rs.getString(6)%>"/></td>
        </tr>
        <tr class='active'>
         <td>Address</td>
         <td><input class="form-control" type="text" name="student_address" value="<%=rs.getString(7)%>"/></td>
        </tr>
        <tr class='active'>
        <td colspan="2"><input class="form-control" style="background-color: blue; color: white;" type="submit" value="Submit" onclick="return validate()" /></td>
        </tr>
       </table>
       </form>
       <%}
       conn.close();
     }
     catch(Exception e)
     {
      out.println(e.getMessage());
     } 
    %>
    </fieldset></div></div></div>
  </body>
</html>
