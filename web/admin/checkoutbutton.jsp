<%-- 
    Document   : checkoutbutton
    Created on : Mar 15, 2022, 11:24:18 PM
    Author     : khatr
--%>

<%@page import="com.HotelReservation.database.DatabaseConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check out</title>
    </head>
    <body>
        <%
            String reservation_id = request.getParameter("id");
            int id = Integer.parseInt(reservation_id);
            Connection conn = DatabaseConnection.getConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("update reservation, rooms set reservation.status = 2, rooms.status = 1 where reservation.room_id = rooms.id  and reservation.id= '" + id + "'");
            
            response.sendRedirect("booked.jsp");
            
        %>
    </body>
</html>
