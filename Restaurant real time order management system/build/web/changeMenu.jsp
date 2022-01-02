
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
            String food_name = (String)request.getParameter("food_name");
            String food_price = (String)request.getParameter("price");
            String food_description = (String)request.getParameter("food_description");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rms_project","root", "root");
            Statement st = con.createStatement();
            st.executeUpdate("insert into food(food_name,food_price,food_description) values('"+food_name+"',"+food_price+",'"+food_description+"');");
            ResultSet rs = st.executeQuery("select * from food;");
        ArrayList<ArrayList<String>> menu = new ArrayList<ArrayList<String>>();
        while(rs.next()){
            ArrayList<String> temp = new ArrayList<String>();
            temp.add(String.valueOf(rs.getInt("id")));
            temp.add(rs.getString("food_name"));
            temp.add(rs.getString("food_price"));
            temp.add(rs.getString("food_description"));
            menu.add(temp);
        }
        session.setAttribute("menu", menu);
        response.sendRedirect("adminloginsuccess.jsp");
            %>
    </body>
</html>
