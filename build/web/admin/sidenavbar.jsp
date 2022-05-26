<%-- 
    Document   : sidenavbar
    Created on : Feb 26, 2022, 2:13:37 PM
    Author     : khatr
--%>

<html lang="en">
    <head>
       <%@include file="head.jsp" %>
        <title>sidenavbar</title>
        <style>
            .nav-link{
                color: white;
                text-weight:bold;
                margin: 20px;
            }
        </style>
    </head>
    <body>
        
        <ul class="header flex-column" style="height:100vh; background-color:#222D32;">
<!--            <li class="nav-item">
                <a class="nav-link active" href="home.jsp">Home</a>
            </li>-->
            <li class="nav-item">
                <a class="nav-link" href="reservation.jsp">Reservation</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="booked.jsp">Booked</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="checkout.jsp">Check Out</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="roomcategory.jsp">Room Category List</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="rooms.jsp">Rooms</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="userManage.jsp">User Manage</a>
            </li>
            
        </ul>


        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
    </body>
</html>