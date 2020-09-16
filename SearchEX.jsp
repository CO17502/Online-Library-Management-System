<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Search Processing Student</title>
    
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
    
  

  </head>
  
  <body>
  <jsp:include page="header.jsp"></jsp:include>
  <div style="height:100px ; width:100%"></div>
  <a href="SearchDropdown.jsp"><button class="btn btn-danger">Back</button></a><br/>
 
		<%	
			String search=request.getParameter("item");
			
			try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
			String Query="select * from ( select * from bookrecord where booktitle like ? or bookauthor like ? or publishername like ? or bookdepartment like ? or booktype like ? ) l where bookstatus='available'";
			PreparedStatement ps= con.prepareStatement(Query);
			ps.setString(1,"%" + search + "%");
			ps.setString(2,"%" + search + "%");
			ps.setString(3,"%" + search + "%");
			ps.setString(4,"%" + search + "%");
			ps.setString(5,"%" + search + "%");
		
			ResultSet rs=ps.executeQuery();
			Boolean sign=rs.next();
			int count=1;
			%>
			<table class="table table-bordered">
				<tr class="warning">
					<th>Book_ID</th>
					<th>Book Title</th>
					<th>Author</th>
					<th>Book Type</th>
					<th>Book Department</th>
					<th>Book Edition</th>
					<th>Publisher Name</th>
					
				</tr>
				<%
				while(rs.next())
		 		{	
						String bookid;
        				bookid=rs.getString(1);
				out.println("<tr class='active'>"+"<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td>"+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(5)+"</td>");
				out.println("<td>"+rs.getString(6)+"</td>");
				out.println("<td>"+rs.getString(7)+"</td></tr>");
				out.println("<tr class='active'></tr>");
				
				count++;
				}
				out.println("<center><h4><font color='red'>"+count+" books found."+"</font></h4></center>");
				 %>
				 </table>
		 		
		 	<%	
		 	if(sign==false)
		 	{
		 	String msg="No results found!";
		 	response.sendRedirect("SearchDropdown.jsp?b="+msg);
		 	}
		 		con.close();
		 	}
		 	catch(Exception e)
		 	{
		 		out.println(e.getMessage());
		 	}

		 %>    


  </body>
</html>
