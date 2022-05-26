<%-- 
    Document   : delete
    Created on : Mar 9, 2022, 7:31:50 PM
    Author     : khatr
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.HotelReservation.database.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
    </head>
    <body>
        <%
            String userid = request.getParameter("id");
            int id = Integer.parseInt(userid);
            Connection conn = DatabaseConnection.getConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("delete from room_category where id= '" + id + "'");
            response.sendRedirect("roomcategory.jsp");

        %>
    </body>
</html>