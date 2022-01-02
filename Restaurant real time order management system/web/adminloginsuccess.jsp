<%-- 
    Document   : adminloginsuccess
    Created on : Mar 22, 2018, 4:31:46 PM
    Author     : WorkSpace
--%>
<%@page import="model.Order" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Order" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login Success</title>
        
        
         <style>
             
             body {
  
  
background-color: #f5f5f5;


  
  
}

.bgcentre{
	max-width: 1080px;
    margin: auto;
	padding: 10px;
}

.htext01{
	font-size: 25px;
	font-weight:bold;
	font-family: arial;
	color: #007dc1;
	text-decoration: none;
	margin-bottom: 10px;
	padding: 0px;
	
}
.admin{
	float: right;
	position:relative;
	top: -45px;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding: 10px;
	text-decoration:none;
	
}
.cp{
	font-size: 30px;
	font-weight:bold;
	font-family: arial;
	color: white;
	background-color: #1e1e1e;
	text-decoration: none;
	
	padding: 10px;
	
}

.menu{
	
	
	background-color: #3d3d3d;
	width: 200px;
	height: 600px;
	display: inline-block;
	position: absolute;
	
}

.dash{
	
	
	background-color: white;
	width: 880px;
	min-height: 600px;
	position: relative;
	left: 200px;
	
}

.floating-box {
    display: inline-block;
    width: 175px;
    height: 90px;
    margin: 10px;
    
}

.dashtext{
	font-size: 25px;
	font-weight:bold;
	font-family: arial;
	
	text-decoration: none;
	
	padding: 10px;
	
}

.logog {
	position: relative;
	 top:300px;
	 float: right;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 200px;
    
}

.dropdown-content a {
    padding: 5px 10px;
    text-decoration: none;
    display: block;
	
	font-size: 15px;
	color: black;
	font-weight:bold;
	font-family: arial;
	
}

.dropdown-content a:hover {
    background-color: #f1f1f1;
    
}

.navbar ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    
    float: left;
    font-size: 18px;
    
    height: 500px;
    overflow: hidden;
    line-height: 35px;
}

.navbar ul li {
    display: block;
    color: white;
    
    text-decoration: none;
    text-align: left;
    padding-left: 15px;
	
	font-weight:bold;
	font-family: arial;
}

.navbar ul li:hover .dropdown-content {
    display: block;
	font-size: 15px;
	color: black;
	font-weight:bold;
	font-family: arial;
	text-decoration: none;
}


.dropbtn, .dropbtn2, .dropbtn3, .dropbtn4, .dropbtn5 {
    background-color: #3d3d3d;
    color: white;
    padding: 14px;
    font-size: 18px;
    border: none;
    cursor: pointer;
	width: 200px;
	text-align: left;
	font-weight:bold;
	font-family: arial;
}

.dropbtn:hover, .dropbtn:focus {
    background-color: #dd5046;
}

 .dropbtn2:hover, .dropbtn2:focus {
    background-color: #3cbc61;
}

 .dropbtn3:hover, .dropbtn3:focus {
    background-color: #f59f46;
}

 .dropbtn4:hover, .dropbtn4:focus {
    background-color: #797eda;
}

 .dropbtn5:hover, .dropbtn5:focus {
    background-color: #4f90e0;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 200px;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown a:hover {background-color: #ddd}

.show {display:block;}

             
        </style>
        <script>
            function myFunction(tab){
                if(tab == "menu"){
                    document.getElementById("orders").style.display = "none";
                    document.getElementById("menu").style.display = "block";
                }
                else{
                     document.getElementById("menu").style.display = "none";
                    document.getElementById("orders").style.display = "block";
                }
            }
            </script>
    </head>
    <body>
<div class="cp">Dashboard </div>

<div class="admin">
     
    <a href='adminlogout.jsp'  style="color: #e14938; text-decoration: none;">Admin Logout</a> 

</div>



<div class="menu"> 
    <div class="dropdown">
    <button onclick="myFunction('orders')" class="dropbtn">Orders</button>

      <br>
      <button onclick="myFunction('menu')" class="dropbtn2">Menu</button>

    </div>
</div>
<div class="dash"> 
    <center style="padding: 25px;">
        <div id="orders">
     <%
            if ((session.getAttribute("adn") == null) || (session.getAttribute("adn") == "")) {
        %>
     <a style="font-size: 15px; color: #1e1e1e; font-family: arial; text-decoration: none;">HI! You are not logged in</a> <br/>
        <a style="font-size: 20px; color: #dd5046; font-family: arial; text-decoration: none;" href="adminlogin.jsp">Please  Login</a>
     <% }else{
            ArrayList<Order> orderList = (ArrayList<Order>)session.getAttribute("orders");
            %>
            <script>
                function changeStatus(selected_option){
                    var order_id = selected_option.name;
                    console.log(order_id);
                    var form = document.getElementById("statusForm"+order_id);
                    form.lastElementChild.value = selected_option.value;
                    form.submit();
                }
                function openDetails(_this){
                    var order_id = _this.name;
                    var details = document.getElementById("details"+order_id);
                    console.log(details);
                    details.style.display = "contents";
                }
                function closeDetails(_this){
                    var order_id = _this.name;
                    var details = document.getElementById("details"+order_id);
                    details.style.display = "none";
                }
                </script>
            <table id="orders">
                <tr>
                    <th>Customer</th>
                    <th>Date Time</th>
                    <th>Bill Amount</th>
                    <th>Status</th>
                    <th></th>
                </tr>
            <%
            for(Order o: orderList){
                String []order_ids = o.order_id.split(" ");
                String order_id = order_ids[0]+","+order_ids[1];
                System.out.println("Status:: "+o.status);
             %>
             <tr>
                <td><%= o.user %></td>
                <td><%= o.order_id %></td>
                <td><%= o.price %></td>
                <td>
                     <select onchange="changeStatus(this)" name=<%= order_id %> <% if(o.status.equals("paid")) %><%= "disabled" %>>
                         <option value="pending" <% if(o.status.equals("pending")) %><%= "selected" %><% else %><%= "" %>>pending</option>
                         <option value="delivered" <% if(o.status.equals("delivered")) %><%= "selected" %><% else %><%= "" %>>delivered</option>
                         <option value="paid" <% if(o.status.equals("paid")) %><%= "selected" %><% else %><%= ""%>>paid</option>
                     </select>
                     <form hiddne="true" method="post" id=<%= "statusForm"+order_id%> action="changeOrder.jsp">
                         <input hidden="true" name="order_id" value=<%=order_id%>>
                         <input hidden="true" name="email" value=<%= o.email %>>
                         <input hidden="true" name="status" value="">
                         
                     </form>
                 </td>
                 <td><button onclick="openDetails(this)" name=<%= order_id %>>Details</button></td>
             </tr>
             <tr id=<%= "details"+order_id %> style="display:none;">
                 <td colspan="5">
                <table style="width: 100%;
                        text-align: center;">
                    <tr>
                        <th>Dish</th>
                        <th>Price</th>
                        <th>Quantity</th>
                    </tr>
                    <%
                        for(ArrayList<String> food_item: o.food_items){
                        %>
                        <tr>
                            <td><%= food_item.get(0) %></td>
                            <td><%= food_item.get(1) %></td>
                            <td><%= food_item.get(2) %></td>
                        </tr>
                    <%}%>
                </table>
                    <button style="display: block; margin:auto;" onclick="closeDetails(this)" name=<%= order_id %>>Close</button></td>
             </tr>
             
             <%
            }
            %>
            </table>
<%
}%>
        </div>
        <div id="menu" style="display:none;">
            <script>
                function showForm(){
                    document.getElementById("addMenu").style.display = "block";
                }
                function closeForm(){
                    document.getElementById("addMenu").style.display = "none";
                }
            </script>
            MENU
            <table style="background-color: white; padding: 2%; border-radius:5px;">
                <tr>
                    <th>
                        Sr No.
                    </th>
                    <th>
                        Dish
                    </th>
                    <th>Price</th>
                    <th>
                        Description
                    </th>
                </tr>
                <%
                    ArrayList<ArrayList<String>> menu = (ArrayList<ArrayList<String>>)session.getAttribute("menu");
                    if(menu != null){for(ArrayList<String> item: menu){
                %><tr>
                    <td><%= item.get(0) %></td>
                    <td><%= item.get(1) %></td>
                    <td><%= item.get(2) %></td>
                    <td><%= item.get(3) %></td>
                </tr>
                    <%}}
                    %>
            </table> 
            <button onclick="showForm()">Add Dish</button>
            <br><br>
            <div id="addMenu" style="display:none;">
                <form method="post" action="changeMenu.jsp">
                    <label>Dish Name</label>
                    <input name="food_name">
                    <br>
                    <br>
                    <label>Price</label>
                    <input name="price">
                    <br><br>
                    <label>Description</label>
                    <input name="food_description">
                    <br><br>
                    <input type="submit" value="submit">
                </form>
                <br>
                <button onclick="closeForm()">Close</button>
            </div>
        </div>
    </center>
</div>
    </body>
</html>
