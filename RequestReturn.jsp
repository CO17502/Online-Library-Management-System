<%@ page language="java" import="java.util.*,java.sql.*,java.util.Calendar,java.text.SimpleDateFormat" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'RequestReturn.jsp' starting page</title>
    
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
    String bookid=request.getParameter("v");
    try
    {
     Class.forName("com.mysql.jdbc.Driver");
	 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
	 int sno;
       String query="select max(sno) from returnrequests";
	   PreparedStatement ps=conn.prepareStatement(query);
	   ResultSet rs=ps.executeQuery();
	   if(rs.next())
	   {
	    sno=rs.getInt(1);
	   }
	   else
	   {
	    sno=0;
	   }
	   sno=sno+1;
	   SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
		Calendar c= Calendar.getInstance();
		//c.setTime(new Date());
	   String dreq=sdf.format(c.getTime());
       java.util.Date utilDate = new java.util.Date();
       java.sql.Date date = new java.sql.Date(utilDate.getTime());
       Calendar cal=Calendar.getInstance();
       java.util.Date d=cal.getTime();
       SimpleDateFormat df=new SimpleDateFormat("HH:mm:ss");
       String treq=df.format(date);
	   String query1="insert into returnrequests values (?,?,?,?,?)";
	   PreparedStatement ps1=conn.prepareStatement(query1);
	   ps1.setInt(1, sno);
	   ps1.setString(2, bookid);
	   ps1.setString(3, currentuser);
	   ps1.setString(4, dreq);
	   ps1.setString(5, treq);
	   int r=ps1.executeUpdate();
	   if(r>0)
	   {
	    
	    String msg="Return Request Sent!";
	    response.sendRedirect("ViewPersonalPending.jsp?v="+msg);
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
