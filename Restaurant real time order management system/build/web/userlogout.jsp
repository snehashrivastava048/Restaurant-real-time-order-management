
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
        session.setAttribute("userid", null);
        session.setAttribute("email", null);
        session.setAttribute("item", null);
session.setAttribute("quantity", null);
session.setAttribute("price", null);
        session.invalidate();
        
        response.sendRedirect("index.jsp");
        %>
    </body>
</html>
