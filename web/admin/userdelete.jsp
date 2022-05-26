<%-- 
    Document   : userdelete
    Created on : Mar 10, 2022, 2:08:35 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String userid = request.getParameter("id");
            int id = Integer.parseInt(userid);
            Connection conn = DatabaseConnection.getConnection();
            Statement stmtt = conn.createStatement();
            stmtt.executeUpdate("delete  from reservation where user_id='"+id+"' ");
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("delete from users where id= '" + id + "' ");
            response.sendRedirect("userManage.jsp");

        %>
    </body>
</html>
