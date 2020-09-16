<%@ page language="java" import="java.util.*,java.sql.*,java.util.Calendar,java.text.SimpleDateFormat" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ViewPersonalPending.jsp' starting page</title>
    
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
	

  </head>
  
  <body  onresize="ReSzNav(),checkLogo()" onload="resolvePanel(),checkLogo()">

    <div id="bgimg" style='background-image:url("images/13.jpg");'></div>
	<center><h1 id="pageName" style="color: red;">Books Pending(to be returned)</h1></center>
	
	<a href="ViewPersonalissue.jsp"><button class="btn btn-danger btn-lg active">Back</button></a><br/>
    

	<div id="mainTab">
	  <div class="data-table">
		<div class="loginlog">
	       <fieldset>

    <%
    String currentuser=session.getAttribute("userid").toString();
    String msg=request.getParameter("v");
      if(msg==null)
      {
        msg=" ";
      }%>
      <div><center><font color="red"><%=msg%></font></center></div>
   <% 
     try
     {
      Class.forName("com.mysql.jdbc.Driver");
	  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
	  String query="select * from issuerecord where issuestatus='issued' and studentid=? order by duedate";
      PreparedStatement ps= conn.prepareStatement(query);
      ps.setString(1, currentuser);
      ResultSet rs=ps.executeQuery();
      %>
    
    <table class="table table-bordered">
       <tr class="warning">
				
				 <th>Book ID</th>
					<th>Book Title</th>
					<th>Author</th>
					<th>Book Type</th>
					<th>Book Department</th>
					<th>Issue Date</th>
					<th>Due Date</th>
					<th>Status</th>
					<th>Return Book</th>
				</tr>
	<%
      while(rs.next())
      {
       String bookid=rs.getString(2);
       out.println("<tr class='active'><td>"+bookid+"</td>");
       String query1="Select * from bookrecord where bookid = ? ";
       PreparedStatement ps1= conn.prepareStatement(query1);
       ps1.setString(1, bookid);
       ResultSet rs1=ps1.executeQuery();
       if(rs1.next())
       {
        out.println("<td>"+rs1.getString(2)+"</td>");
	    out.println("<td>"+rs1.getString(3)+"</td>");
	    out.println("<td>"+rs1.getString(4)+"</td>");
	    out.println("<td>"+rs1.getString(5)+"</td>");
	   }
	   String query2="Select sno,issuedate,duedate from issuerecord where bookid=? and issuestatus='issued' ";
       PreparedStatement ps2= conn.prepareStatement(query2);
       ps2.setString(1, bookid);
       ResultSet rs2=ps2.executeQuery();
       if(rs2.next())
       {
        int sno=rs2.getInt(1);
        out.println("<td>"+rs2.getString(2)+"</td>");
	    out.println("<td>"+rs2.getString(3)+"</td>");
	    out.println("<td>"+"Return Pending"+"</td>");
	    out.println("<td>"+"<a href=RequestReturn.jsp?v="+bookid+"><button>"+"Request Return"+"</button></a>"+"</td>"+"</tr>");
       out.println("<tr class='active'></tr>");
	 
	}
      }%>
	</table>
	<% 
     conn.close();
    }
    catch(Exception e)
    {
     out.println(e.getMessage());
    }
     %>
     </fieldset>
   </div>
   </div>
   </div>
  </body>
</html>
