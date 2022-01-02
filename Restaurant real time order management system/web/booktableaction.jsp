<%-- 
    Document   : booktableaction
    Created on : Nov 12, 2021, 12:30:45 AM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String email = (String)session.getAttribute("email");
            int id = Integer.parseInt(request.getParameter("id"));
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rms_project","root", "root");
            Statement st = con.createStatement();
            ResultSet rs;
            st.executeUpdate("update table_reservation set email='"+email+"', availability='O' where reserve_id="+id+"");
            rs = st.executeQuery("select * from food");
            
            ArrayList<ArrayList<String>> menu=new ArrayList<ArrayList<String>>();

            while(rs.next()){
                ArrayList<String> tempList = new ArrayList<String>();
                tempList.add(String.valueOf(rs.getInt("id")));
                tempList.add(rs.getString("food_name"));
                tempList.add(String.valueOf(rs.getFloat("food_price")));
                tempList.add(rs.getString("food_description"));
                menu.add(tempList);
            }
    
            session.setAttribute("menu", menu);
            
            response.sendRedirect("http://localhost:8080/Restaurant_real_time_order_management_system/");
        %>
    </body>
</html>
