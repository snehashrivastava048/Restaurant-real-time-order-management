
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  //[[1,2],[2,3],[3,1]]
            String[] encoded_dishes = (String[])request.getParameterValues("order"); //['1,2','2,3','3,1']
            String dishes[][] = new String[encoded_dishes.length][2];
            int i=0;
            for(String el: encoded_dishes){                 
                dishes[i] = el.split(",");//['1','2']
                i++;
            }
            String email = (String)session.getAttribute("email");
            double price = 0;
           
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rms_project","root", "root");
            Statement st = con.createStatement();
            ResultSet rs;
            for(String[] dish:dishes){
                //fetching price of selected dishes
                rs = st.executeQuery("select food_price from food where id="+dish[0]+";");
                rs.next();
                price += rs.getDouble("food_price")*Double.parseDouble(dish[1]);
                
            }
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            String order_id = dateFormat.format(cal.getTime());
            st.executeUpdate("insert into orders(order_id,user_id,price,status) values('"+order_id+"','"+email+"',"+price+",'pending');");
            
            for(String[] dish:dishes){
                st.executeUpdate("insert into orders_food(order_id,food_id,quantity) values('"+order_id+"',"+dish[0]+","+dish[1]+");");
            }
            response.sendRedirect("http://localhost:8080/Restaurant_real_time_order_management_system/");
        %>
    </body>
</html>
