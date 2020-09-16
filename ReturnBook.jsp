<%@ page language="java" import="java.util.*,java.util.Date,java.sql.*,java.util.Calendar,java.text.SimpleDateFormat" pageEncoding="ISO-8859-1"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ReturnBook.jsp' starting page</title>
    
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
     int issueno=Integer.parseInt(request.getParameter("v"));
     try
     {
      Class.forName("com.mysql.jdbc.Driver");
	  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
      SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
      Calendar c= Calendar.getInstance();
		//c.setTime(new Date());
	  String returndate=sdf.format(c.getTime());
	  String query="select bookid,studentid,issuedate,duedate from issuerecord where sno =? ";
	  PreparedStatement ps= conn.prepareStatement(query);
      ps.setInt(1, issueno);
      ResultSet rs=ps.executeQuery();
      int fine;
      int perday=1;
      if(rs.next())
      {
       String bookid=rs.getString(1);
       String studentid=rs.getString(2);
       String issuedate=rs.getString(3);
       String duedate=rs.getString(4);
       SimpleDateFormat formatter=new SimpleDateFormat("yyyy/MM/dd"); 
       java.util.Date ddate = new java.util.Date();
       ddate=formatter.parse(duedate);
       java.util.Date rdate = new java.util.Date();
       rdate=formatter.parse(returndate);
  	   long diff = rdate.getTime() - ddate.getTime();
       //long diffSeconds = diff / 1000 % 60;
	   //long diffMinutes = diff / (60 * 1000) % 60;
	   //long diffHours = diff / (60 * 60 * 1000) % 24;
	   int diffDays = (int) (diff / (24 * 60 * 60 * 1000));
	   if(diffDays>0)
	   {
	    fine=diffDays*perday;
	   }
	   else
	   {
	    fine=0;
	   }
	   int sno;
	   String query1="select max(sno) from returnrecord";
	   PreparedStatement ps1=conn.prepareStatement(query1);
	   ResultSet rs1=ps1.executeQuery();
	   if(rs1.next())
	   {
	    sno=rs1.getInt(1);
	   }
	   else
	   {
	    sno=0;
	   }
	   sno=sno+1;
	   String query2="insert into returnrecord values (?,?,?,?,?,?,?)";
	   PreparedStatement ps2=conn.prepareStatement(query2);
	   ps2.setInt(1, sno);
	   ps2.setString(2, bookid);
	   ps2.setString(3, studentid);
	   ps2.setString(4, issuedate);
	   ps2.setString(5, duedate);
	   ps2.setString(6, returndate);
	   ps2.setInt(7, fine);
	   int r=ps2.executeUpdate();
	   
	   if(r>0)
	   {
	   String query3="update issuerecord set issuestatus='returned' where sno = ? ";
	   PreparedStatement ps3=conn.prepareStatement(query3);
	   ps3.setInt(1, issueno);
	   int r1 = ps3.executeUpdate();
	   if(r1>0)
	   {
	    String query4="Update bookrecord set bookstatus='available' where bookid = ? ";
	    PreparedStatement ps4=conn.prepareStatement(query4);
	    ps4.setString(1, bookid);
	    int r2 = ps4.executeUpdate();
	    if(r2>0)
	    {
	     String query5="delete from returnrequests where bookid=?";
	     PreparedStatement ps5=conn.prepareStatement(query5);
	     ps5.setString(1, bookid);
	     int r3 = ps5.executeUpdate();
	     if(r3>0)
	     {%><table border="3px">
	     <tr><th>Fine(in Rs.)</th></tr>
	     <tr><td><%=fine%></td> </tr>
	     <% 
	     String msg="Returned!";
	     out.println("<tr>"+"<td>"+"<a href=ViewReturnRequests.jsp?v="+msg+"><button>"+"Submit"+"</button></a>"+"</td>"+"</tr>");
          }
         }	    
	    }
	   }
	  }
	 
	  %>
	  </table>
    <%
    conn.close();
    }
    catch(Exception e)
    {
     out.println(e.getMessage());
    }
     %>
  </body>
</html>
