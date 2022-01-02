
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <%
            try{
  Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rms_project","root","root");
  out.println("Inserting records into the table...");
  String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String pwd2 = request.getParameter("password");
    String email2 = request.getParameter("email");
  PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?,?);");
    
    
ps.setString(3, fname);
ps.setString(4, lname);
ps.setString(2, pwd2);
ps.setString(1, email2);


int i=ps.executeUpdate();
if(i>0)
//out.print("Well done "+fname+" you are successfully registered...");

con.close();
response.sendRedirect("userlogin.jsp");
     }
     catch (Exception e)
   {out.println("An account already exist using this email.");
            System.out.println("sneha "+e);}
            %>
        

    </body>
</html>