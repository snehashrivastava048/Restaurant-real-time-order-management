
<%@page import="model.Order" %>
<%@page import="java.util.HashMap"%>
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
       <
<%
    String userid = request.getParameter("email");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rms_project","root", "root");
    Statement st = con.createStatement();
    
    ResultSet rs;
    rs = st.executeQuery("select * from admin where admin_email='" + userid + "' and pass='" + pwd + "'");
    //ResultSet rs2= st.executeQuery("select * from user where email='" + userid + "'");
    //out.println(name);
    if (rs.next()) {
        String an =rs.getString("fname");
        session.setAttribute("adn", an);
        
        rs = st.executeQuery("select u.fname, u.lname, u.email, o.order_id, o.status, f.food_name, f.food_price, fo.quantity, o.price  from food f inner join orders_food fo on f.id = fo.food_id inner join orders o on fo.order_id = o.order_id inner join user u on o.user_id = u.email;");
 
        ArrayList<Order> orderList = new ArrayList<Order>();
        if(rs.next()){
            boolean flag = false;
            while(true){ //order_id, price, food_id, food name, food_price, quantity
                Order o = new Order();
                o.email = rs.getString("email");
                o.user = rs.getString("fname") + " " + rs.getString("lname");
                o.order_id = rs.getString("order_id");
                o.status = rs.getString("status");
                o.price = String.valueOf(rs.getDouble("price"));
                ArrayList<ArrayList<String>> food_items = new ArrayList<ArrayList<String>>();
                do{
                    System.out.println("order_id: "+rs.getString("order_id"));
                    if(rs.getString("order_id").equals(o.order_id)){
                        ArrayList<String> temp = new ArrayList<>();
                        temp.add(rs.getString("food_name"));
                        temp.add(rs.getString("food_price"));
                        temp.add(rs.getString("quantity"));
                        food_items.add(temp);   
                    }
                    else{
                        break;
                    }
                    if(!rs.next()){
                        flag = true;
                        break;
                    }
                }while(true);
                o.food_items = food_items;
                orderList.add(o);
                if(flag){
                    break;
                }
            }
        }
        session.setAttribute("orders", orderList);
        
        rs = st.executeQuery("select * from food;");
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
    } else {
        %>
        <script>

    alert("Wrong Username or password.");
     window.location.href = "userlogin.jsp";
</script>
<%
    }
%>
    </body>
</html>
