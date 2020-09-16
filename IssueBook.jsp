<%@ page language="java" import="java.util.*,java.sql.*,java.util.Calendar,java.text.SimpleDateFormat" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>IssueBook.jsp</title>
    
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
     String bookid=request.getParameter("v");
     try
     {
      Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
    String query="select studentid from issuerequeststudent where bookid=?";
    PreparedStatement ps= conn.prepareStatement(query);
      ps.setString(1, bookid);
      System.out.println("Query 1");
      ResultSet rs=ps.executeQuery();
      if(rs.next())
      {
       String studentid = rs.getString(1);
       SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
    Calendar c= Calendar.getInstance();
    //c.setTime(new Date());
    String issue=sdf.format(c.getTime());
    //System.out.println(output);
    
    c.add(Calendar.DATE,30);
    String due=sdf.format(c.getTime());
    //System.out.println(output1);
       System.out.println("Dates Assigned");
       int sno;
       String query4="select max(sno) from issuerecord";
     PreparedStatement ps4=conn.prepareStatement(query4);
     ResultSet rs1=ps4.executeQuery();
     if(rs1.next())
     {
      sno=rs1.getInt(1);
     }
     else
     {
      sno=0;
     }
     sno=sno+1;
       String query1="insert into issuerecord values (?,?,?,?,?,'issued')";
       PreparedStatement ps1= conn.prepareStatement(query1);
       ps1.setInt(1, sno);
       ps1.setString(2, bookid);
       ps1.setString(3, studentid);
       ps1.setString(4, issue);
       ps1.setString(5, due); 
       int r=ps1.executeUpdate();
       if(r>0)
       {
        String msg="Book Issued!";
        String query2="update bookrecord set bookstatus = 'issued' where bookid=?";
        PreparedStatement ps2= conn.prepareStatement(query2);
        ps2.setString(1, bookid);
        int r1=ps2.executeUpdate();
         String query3="delete from issuerequeststudent where bookid=?";
    PreparedStatement ps3=conn.prepareStatement(query3);
    ps3.setString(1, bookid);
    int r2=ps3.executeUpdate();
    if(r2>0)
    {
     System.out.println("Record Deleted!");
     //Thread.sleep(2000);
     
    }
        response.sendRedirect("ViewRequests.jsp?a="+msg);
       }    
      }
      
     }
     catch(Exception e)
     {out.println(e.getMessage());}
     %>
  </body>
</html>
