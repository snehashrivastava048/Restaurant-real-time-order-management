<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

  <title>Restaurant Management System</title>
 
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

.rectangle{
    width:1080px;
    height:150px;
    background:#352f2f;
	position: absolute;
}
.rectangle2{
    width:100%;
    height:50px;
    background:#574f4f;
	position: relative;
	bottom: -8px;
	border-radius: 0px
}
.logo{
	position: relative;
	top: -5px;
        height: 80px;
        bottom: -15px;
	padding: 15px 75px;
        margin: -15px;
}
.menu{
	position: relative;
	top: -41px;
	display: block;
	font-size: 20px;
	
	
	font-family: arial;
	text-decoration: none;
}

.menu ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    
}

.menu li {
    float: left;
}

.menu li a {
    display: block;
    color: white;
    text-align: center;
    padding: 12px;
    text-decoration: none;
	border-radius: 15px
}

.menu li a:hover {
    background-color: #bd7f1c;
}
      

.signin a{
                  position: relative;
                  top: -170px;
	left: 880px;
	
	font-size: 16px;
	color: white;
	
	font-family: arial;
	text-decoration: none;
}
.signup a{
                  position: relative;
                  top: -188px;
	left: 940px;
	
	font-size: 16px;
	color: white;
	
	font-family: arial;
	text-decoration: none;
}
.logout{
        position: relative;
    top: 0;
    left: 0;
    text-align: center;
    width: fit-content;
    color: white;
}
.logout a{
                  
	
	font-size: 16px;
	color: #e52e33;
	
	font-family: arial;
	text-decoration: none;
}

.bodyBackground {
	
	position: relative;
	top:-80px;
	
	
	max-width: 1080px;
	
}
.bodyBackground2 {
	
	

	
	
	max-width: 1080px;
	
}

.websiteFooter {
	
	position: relative;
	background-color: #e8eeef;
	width: 100%;
	height: 140px;
	border-radius: 8px;
	top: 0px;
	
	
}

.copyright{
	
	position: absolute;
	
	
	font-family: arial;
	font-size: 13px;
	top: 110px;
	left: 310px;
	
	
}



div.terms_1{
	position: absolute;
	width: 150px;
	height:28px;
	font-family: arial;
	font-size: 14px;
	
	background-color:#3498db;
	color:white;
	
	text-align: center;
	line-height: 28px;
	border: 1px #d2d2d2 solid;
	border-radius:4px;
	
	top: 50px;
	left: 750px;
}

div.terms_2{
	position: absolute;
	width: 150px;
	height:28px;
	font-family: arial;
	font-size: 14px;
	
	background-color:#3498db;
	color:white;
	left: 200px;
	text-align: center;
	line-height: 28px;
	border: 1px #d2d2d2 solid;
	border-radius:4px;
	top: 50px;
	left: 590px;
}

div.terms_3{
	position: absolute;
	width: 150px;
	height:28px;
	font-family: arial;
	font-size: 15px;
	
	background-color:#3498db;
	color:white;
	border: 1px #d2d2d2 solid;
	text-align: center;
	line-height: 28px;
	border-radius:4px;
	top: 50px;
	left: 430px;
	
}

#footerText:hover {
	
	background-color:#ffffff;
	color:#3498db;
	border: 1px #d2d2d2 solid;
	font-weight: bold;
	
}

#foo_1{
	position:absolute;
	top: 20px;
	left: 60px;
}#foo_2{
	position:absolute;
	top: 20px;
	left: 105px;
}

#foo_3{
	position:absolute;
	top: 20px;
	left: 150px;
}

#foo_4{
	position:absolute;
	top: 20px;
	left: 195px;
}

#foo_5{
	position:absolute;
	top: 58px;
	left: 83px;
}

#foo_6{
	position:absolute;
	top: 58px;
	left: 125px;
}

#foo_7{
	position:absolute;
	top: 58px;
	left: 171px;
}
img[name="slide"]{
 position: relative;
    top: -20px
;
    left: -90px
;
    max-width: 1080px
;   
}
table{
    width: 100%;
    text-align: center;
    margin:auto;
}
</style>
 
				   
 </head>

 <body style="background-image:url('indeximg/bg1.jpg');background-size: cover;"> 
<div class="bgcentre">


<br>

<div class="head">

<div class="rectangle"></div>

<div class ="logo"> <img src="indeximg/Logo2.png"></div>
<center><div class="rectangle2"></div></center>

<div class="menu"> 

<ul>
  <li><a class="active" href="index.jsp">Home</a></li>
 
  
  
  <%
            if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) { %>
                <li><a href="userlogin.jsp">Sign In</a></li>
                <li><a href="register.jsp">Sign Up</a></li>
         
        <%} else {
        %>     
        <li class="logout" style="margin:1%;">
        Welcome <%=session.getAttribute("userid")%>
        <a href='userlogout.jsp' style="display:inline;">Log out</a>
        
        </li>
        
        <br> 
     <%
            }
        %>			
</div>
  
</ul>
        <% if ((session.getAttribute("userid") != null) && (session.getAttribute("userid") != "")&&
                ((session.getAttribute("menu") == null) || (session.getAttribute("menu") == ""))){%>
        <div> 
            <table style="background-color: white; padding: 2%; border-radius:5px; opacity: 0.85;">
                <tr>
                    <th>
                        Table No.
                    </th>
                    <th>Seats</th>
                    <th>
                        Availability
                    </th>
                </tr>
                <%
                    ArrayList<ArrayList<String>> tables = (ArrayList<ArrayList<String>>)session.getAttribute("tables");
                    System.out.println("tables: "+tables);
                    for(ArrayList<String> t: tables){
//                        System.out.println("t: "+t.get(2).getClass().getName());
                        %>
                       <tr>
                            <td><%= t.get(0) %></td>
                            <td><%= t.get(1) %></td>
                            <% if(t.get(2).equals("A")){ 
//                                System.out.println(t.get(2));%>
                                <td><button style="background-color: #4CAF50; /* Green */
  border: none;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  background-color: #e7e7e7; color: black;"><a style="color:black; text-decoration: none" href=<%= "/Restaurant_real_time_order_management_system/booktableaction.jsp?id=" + t.get(0)%>>Available</a></button></td>
                                <%}else{%>
                            <td>Occupied</td>
                            <%}%>
                        </tr>
                <%
                    }
                %>
            </table>
        </div>
<%}else if((session.getAttribute("userid") != null) && (session.getAttribute("userid") != "") &&
        (session.getAttribute("menu") != null) && (session.getAttribute("menu") != "")){%>
        <div style="background-color: white; padding: 2%; border-radius:5px; opacity: 0.85;">
            <script>
                var price = 0.00;
                var orderedDishes = [];
                function addDish(id){
                    if(document.getElementById("add"+id).checked == true){
                        var q = prompt("Enter quantity: ");
                        if(q && q > 0){
                            var temp = [];
                            temp.push(id);
                            temp.push(q);
                            orderedDishes.push(temp);
                            document.getElementById("quantity"+id).innerText = q;
                            price += ( Number.parseFloat(document.getElementById("price"+id).innerText) * Number.parseInt(q));
                        }
                        else{
                            document.getElementById("add"+id).checked = false;
                            document.getElementById("quantity"+id).innerText = 0;
                        }
                    }else{
                        // if unchecked then subtract the price of item
                        price -= ( Number.parseFloat(document.getElementById("price"+id).innerText) * document.getElementById("quantity"+id).innerText);
                        orderedDishes = orderedDishes.filter(item=>item[0]!==id);// [1,2,3,4,5]
//                        orderedDishes = orderedDishes.filter(function(item){
//                            if(item[0]!==id){
//                                return true;
//                            }
//                            return false;
//                        });
                        document.getElementById("quantity"+id).innerText = 0;
                    }
                    document.getElementById("final_price").innerText = price;
                    
                    
                    document.getElementById("order").value = orderedDishes;
                }
            </script>
            <table style="padding-left:50px">
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
                    <th>Add</th>
                    <th>Quantity</th>
                </tr>
                <%
                    ArrayList<ArrayList<String>> menu = (ArrayList<ArrayList<String>>)session.getAttribute("menu");
                    System.out.println("menu: "+menu);
                    for(ArrayList<String> dish: menu){
                        %>
                       <tr>
                            <td><%= dish.get(0) %></td>
                            <td><%= dish.get(1) %></td>
                            <td id=<%= "price"+dish.get(0) %>><%= dish.get(2) %></td>
                            <td><%= dish.get(3) %></td>
                            <td><input type="checkbox" onchange=<%= "addDish("+dish.get(0)+");"%> id=<%="add"+dish.get(0)%> /></td>
                            <td><h3 id=<%= "quantity"+dish.get(0) %>>0</h3></td>
                        </tr>
                <%
                    }
                %>
            </table>
            <div style="margin:auto; width:30%;"><h2 style="text-align:center;">Final Price: </h2><h3 style="text-align: center;" id="final_price"></h3></div>
            <div style="margin:auto;">
                <form action="orderfoodaction.jsp" method="post">
                    <input hidden="true" id="order" name="order">
                    <input type="submit" name="submit" value="Confirm Order" style="background-color: #4CAF50; /* Green */
                                                    border: none;
                                                    color: white;
                                                    padding: 16px 32px;
                                                    text-align: center;
                                                    text-decoration: none;
                                                    display: block;
                                                    font-size: 16px;
                                                    margin: 4px 2px;
                                                    transition-duration: 0.4s;
                                                    cursor: pointer;margin:auto;">
                 </form></div>
        </div>
<%}%>
</body>
</html>