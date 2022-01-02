
<%@page import="model.Order"%>
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
            String order_id = (String)request.getParameter("order_id");
            String email = (String)request.getParameter("email");
            String []temp = order_id.split(",");
            order_id = temp[0]+" "+temp[1];
            String status = (String)request.getParameter("status");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rms_project","root", "root");
            Statement st = con.createStatement();
            st.executeUpdate("update orders set status='"+status+"' where order_id='"+order_id+"';");
            System.out.println("1email: "+email+" status: "+status+" abc: "+status.equals("paid"));
            if(status.equals("paid")){
            System.out.println("email: "+email+" status: "+status);
            st.executeUpdate("Update table_reservation set availability='A' where email='"+email+"';");
            }
            ArrayList<Order> orders = (ArrayList<Order>)session.getAttribute("orders");
            for(Order o: orders){
                if(o.order_id.equals(order_id)){
                    o.status = status;
                }
            }
            session.setAttribute("orders", orders);
            response.sendRedirect("adminloginsuccess.jsp");
            %>
    </body>
</html>
