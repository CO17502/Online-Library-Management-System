<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Search Processing</title>
    
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
  
  <a href="SearchStudent.jsp"><button class="btn btn-danger">Back</button></a><br/>
 	<center><h4> <font>Choose Book</font><br/>
		<%
			String search=request.getParameter("search");
			try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
			if(search.equals("title")){
			String query="select distinct booktitle from library.searchtable";
			PreparedStatement ps= con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			int i=1;
				out.print("<form action='SearchProcessStudent1.jsp'><select name='item'>");
				while(rs.next()){
					out.print("<option name='item"+i+"'>"+rs.getString(1)+"</option>");
				}
				out.print("</select><br/><br/><input type='submit' class='btn btn-lg btn-primary' value='Search' ></form>");
				
			}
			if(search.equals("author")){
				String query="select distinct bookauthor from library.searchtable";
				PreparedStatement ps= con.prepareStatement(query);
				ResultSet rs=ps.executeQuery();
				int i=1;
				out.print("<form action='SearchProcessStudent1.jsp'><select name='item'>");
				while(rs.next()){
					out.print("<option name='item"+i+"'>"+rs.getString(1)+"</option>");
				}
				out.print("</select><br/><br/><input type='submit' class='btn btn-lg btn-primary' value='Search' ></form>");
			}
			if(search.equals("type")){
				String query="select distinct booktype from library.searchtable";
			PreparedStatement ps= con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			int i=1;
				out.print("<form action='SearchProcessStudent1.jsp'><select name='item'>");
				while(rs.next()){
					out.print("<option name='item"+i+"'>"+rs.getString(1)+"</option>");
				}
				out.print("</select><br/><br/><input type='submit' class='btn btn-lg btn-primary' value='Search' ></form>");
			}
			if(search.equals("department")){
				String query="select distinct bookdepartment from library.searchtable";
			PreparedStatement ps= con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			int i=1;
				out.print("<form action='SearchProcessStudent1.jsp'><select name='item'>");
				while(rs.next()){
					out.print("<option name='item"+i+"'>"+rs.getString(1)+"</option>");
				}
				out.print("</select><br/><br/><input type='submit' class='btn btn-lg btn-primary' value='Search' ></form>");
			}
			if(search.equals("publisher")){
				String query="select distinct publishername from library.searchtable";
			PreparedStatement ps= con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			int i=1;
				out.print("<form action='SearchProcessStudent1.jsp'><select name='item'>");
			
				while(rs.next()){
					out.print("<option name='item"+i+"'>"+rs.getString(1)+"</option>");
					i++;
				}
				out.print("</select><br/><br/><input type='submit' class='btn btn-lg btn-primary' value='Search' ></form>");
			}
			con.close();
		 	}
		 	catch(Exception e)
		 	{
		 		out.println(e.getMessage());
		 	}
		
		 %>
		 </h4>    
</center>

  </body>
</html>
