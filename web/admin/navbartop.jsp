<!doctype html>
<html lang="en">
    <head>
        <%@include file="head.jsp" %>
        <title>navbartop</title>
    </head>
    <body >

        <div class="header" style="background-color: #222D32; ">
            <div class="container">
                <div class="left-navbar left">
                    <p style="color: white;">Online Hotel Reservation</p>
                </div>
                <%
                    Object session_name = session.getAttribute("s_name");
                %>

                <div class="right-navbar" style="float: right;">
                    
                    <a href="../logout.jsp"  style="text-decoration: none;"><p style="color: white; " ><b>Welcome, &nbsp;</b> <%= session_name%></p></a>
                </div>

            </div>
        </div>

        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
    </body>
</html>