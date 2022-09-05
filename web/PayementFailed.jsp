
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.HotelReservation.database.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Failed</title>
    </head>
    <style>
        .navbar a{
            color: white;
        }
        .navbar .mid{
            margin-left: 330px;
        }
        .center{
            margin: auto;
            width: 50%;
            border: 3px solid none;
            padding: 10px;
        }
        .img-center{
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 50%;
        }
        table tr td{
            border: 1px solid;
            padding:5px;
        }
    </style>
    <body style="background-image:url('images/13.jpg'); background-repeat: no-repeat; background-size: cover; ">
        <jsp:include page="navbarUser.jsp"/>
        <%
            Connection conn = DatabaseConnection.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = null;
        %>
        <%
            Object u_id = session.getAttribute("s_id");
        %>
        <%
            int dbroom_id = 0;
            int dbuser_id = 0;
            int db_reservation_id = 0;
            Connection cn = DatabaseConnection.getConnection();
            Statement stmt = cn.createStatement();
            ResultSet rss = stmt.executeQuery("select * from reservation join users where reservation.user_id = users.id and reservation.user_id = '" + u_id + "' order by reservation.id desc limit 1");
            while (rss.next()) {
                db_reservation_id = rss.getInt("reservation.id");
                dbroom_id = rss.getInt("reservation.room_id");
                dbuser_id = rss.getInt("reservation.user_id");

        %>       
        <% }
            stmt.executeUpdate("DELETE FROM reservation where id ='" + db_reservation_id + "'");
            System.out.println("Booking is deleted due to payment failure");
        %>
        <div class="center mt-4" style=" margin-bottom:25px;">
            <!--<img src="assets/img/success.png" class="img-center" height="300px;" alt=""/>-->         
            <div class="center bg-danger text-light" style="width: 500px;">                
                <img src="images/paypal.jpg" class="img-center" style="width: 50%">
                <h4 class="text-center text-light mt-2">Booking Failed</h4>                

                <h5 class="text-center text-light mt-2 p-3">Dear user your booking is failed due to unsuccessful payment, please try again.</h5>  

                <button class="btn text-light mt-2" onclick="index.jsp" style="background-color:#222D32; margin-left: 75px; border-radius: 30px; width:340px; "> Home </button>                                          
            </div>

        </div>
        <div class="footer">
            <jsp:include page="footer.jsp"/>

        </div>
    </body>
</html>