<%@ page language="java" import="java.util.*,java.sql.*,java.util.Date,java.text.SimpleDateFormat,java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>RequestStudent.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    String currentuser=session.getAttribute("userid").toString();
    System.out.println(currentuser);
      
      String bookid=request.getParameter("v");
      /*String studentname=null;
      String studentbranch=null;
      String studentsemester=null;*/
      try
      {
       int sno;
       SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
		Calendar c= Calendar.getInstance();
		//c.setTime(new Date());
	   String dreq=sdf.format(c.getTime());
       java.util.Date utilDate = new Date();
       java.sql.Date date = new java.sql.Date(utilDate.getTime());
       Calendar cal=Calendar.getInstance();
       Date d=cal.getTime();
       SimpleDateFormat df=new SimpleDateFormat("HH:mm:ss");
       String treq=df.format(date);
	   Class.forName("com.mysql.jdbc.Driver");
	   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
	   String query2="select max(sno) from issuerequeststudent";
	   PreparedStatement ps2=conn.prepareStatement(query2);
	   ResultSet rs=ps2.executeQuery();
	   if(rs.next())
	   {
	    sno=rs.getInt(1);
	   }
	   else
	   {
	    sno=0;
	   }
	   sno=sno+1;
	   String query="insert into issuerequeststudent values (?,?,?,?,?)";
	   PreparedStatement ps=conn.prepareStatement(query);
	   ps.setInt(1,sno);
	   ps.setString(2, bookid);
       ps.setString(3, currentuser);
       ps.setString(4, dreq);
       ps.setString(5, treq);
       int r=ps.executeUpdate();
       String query1="update bookrecord set bookstatus='requested' where bookid=?";
	              PreparedStatement ps1=conn.prepareStatement(query1);
	              ps1.setString(1, bookid);
                 int r1=ps1.executeUpdate();
       if(r>0)
		 		{ 
		 		if(r1>0)
		 		    {String msg="Request Registered!";
		 		    out.println("Request Registered");
		 			response.sendRedirect("SearchStudent.jsp?b="+msg);}
		 			
		 		}
      conn.close();
      }
      catch(Exception e)
      {
       out.println(e.getMessage());
      }
     %>
  </body>
</html>
