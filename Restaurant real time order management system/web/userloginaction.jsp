<%@page import="java.util.ArrayList"%>
<%@ page import ="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login Action</title>
    </head>
    <body>
       
<%
    String email = request.getParameter("email");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rms_project","root", "root");
    Statement st = con.createStatement();
    System.out.println("sneha " +email+" " +pwd);
    ResultSet rs;
    rs = st.executeQuery("select * from user where email='" + email + "' and pass='" + pwd + "'");
    //ResultSet rs2= st.executeQuery("select * from user where email='" + userid + "'");


    //out.println(name);
    if (rs.next()) {
      String un =rs.getString("fname");
      //String email =rs.getString("email");
        session.setAttribute("userid", un);
        session.setAttribute("email", email);
        
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("userloginsuccess.jsp");
    } else {
        %>
        <script>

    alert("Wrong Username or password.");
     window.location.href = "userlogin.jsp";
</script>
<%
    }
%>
<%
    st = con.createStatement();
    
    rs = st.executeQuery("select * from table_reservation");
    ArrayList<ArrayList<String>> tables=new ArrayList<ArrayList<String>>();
    int i=0;
    while(rs.next()){
        ArrayList<String> tempList = new ArrayList<String>();
        tempList.add(String.valueOf(rs.getInt("reserve_id")));
        tempList.add(rs.getString("no_of_guest"));
        tempList.add(rs.getString("availability"));
        tables.add(tempList);
    }
    
    session.setAttribute("tables", tables);
%>
    </body>
</html>