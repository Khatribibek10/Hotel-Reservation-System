<%-- 
    Document   : roomdelete
    Created on : Mar 10, 2022, 2:16:17 PM
    Author     : khatr
--%>

<%@page import="java.sql.Statement"%>
<%@page import="com.HotelReservation.database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String userid = request.getParameter("id");
            int id = Integer.parseInt(userid);
            Connection conn = DatabaseConnection.getConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("delete from rooms where id= '" + id + "'");
            
            response.sendRedirect("rooms.jsp");
            
        %>
    </body>
</html>
