
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.HotelReservation.database.DatabaseConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <%@include file="head.jsp" %>
        <style>
            body {

                background-repeat: no-repeat;
                background-size: cover;
            }
            .box-shadow {
                box-shadow: 0 .25rem .75rem rgba(0, 0, 0, .05);
            }
            .album{
                margin-top: 30px;
                margin-left: 380px;
                width: 700px;
            }
        </style>
    </head>
    <body>
        <%
            Object u_id = session.getAttribute("s_id");
            Object uname = session.getAttribute("s_name");
        %>
        <style>
            .navbar{
                background-color: rgb(21, 172, 231);
                height: 70px;

            }
            .navbar a{
                color: white;
            }
            .navbar .mid{
                margin-left: 330px;
            }


        </style>
        <jsp:include page="navbarUser.jsp"/>
        <div class="album ">
            <div class="container ">

                <div class="row ">
                    <div class="col">

                        <div class="card bg-light mb-2">
                            <h2 class="text-center p-3 text-dark">Payment Page</h2>
                            <div class="card-body mb-2">                                

                                <script src="https://www.paypal.com/sdk/js?client-id=AeD38NizM6jf_6ALZ_--wDI9NGt5iuepkYOH9Qv758lV8Ktqo8QZONsmIWtufsPticnH949MTSbP_zHM&currency=USD&disable-funding=credit,card"></script>                  
                            </div>
                            <hr>
                            <div id="paypal-payement-button" style="margin-bottom: 50px;">
                                <h4>Pay with Paypal:</h4>
                            </div>
                            <div>
                                <a href="index.jsp" class="btn btn-primary" style=" border-radius: 20px; text-decoration: none; width: 100%; height: 50px;"><b>Pay Later</b></a>
                            </div>

                        </div> 

                    </div>
                </div>
            </div>

        </div>



        <div style="margin-top: 330px;"> 
            <%@include file="footer.jsp" %>
        </div>
        <script src="js/paypal.js" type="text/javascript"></script>
    </body>
</html>
