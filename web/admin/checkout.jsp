<%-- 
    Document   : checkin
    Created on : Feb 26, 2022, 3:05:25 PM
    Author     : khatr
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.HotelReservation.database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <%@include file="head.jsp" %>
        <title>Checkin</title>
    </head>
    <body>
        <div><!<!-- navbartop start -->
            <%@include file="navbartop.jsp" %>
        </div><!-- navbartop ends -->

        <div class="row">
            <div class="col-3">
                <%@include file="sidenavbar.jsp" %>
            </div>
            <div class="col-9">
                <table class="table table-striped" border='1'>
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Check in Date</th>
                            <th scope="col">Checkout Date</th>
                            <th scope="col">Room Number</th>
                            <th scope="col">Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%     
                            int total = 0;
                            int start = 0, count = 8;
                            int pgno = request.getParameter("pgno") == null ? 0 : Integer.parseInt(request.getParameter("pgno"));
                            start = pgno * count;
                            Connection cn = DatabaseConnection.getConnection();
                            String query = "select * from reservation join users on reservation.user_id = users.id join rooms on reservation.room_id=rooms.id where reservation.status=2";
                            PreparedStatement stmt = cn.prepareStatement(query);
                            ResultSet rs = stmt.executeQuery(query);
                            while (rs.next()) {
                                String name = rs.getString("users.name");
                                String email = rs.getString("users.email");
                                String arrivalDate = rs.getString("reservation.date_in");
                                String depatureDate = rs.getString("reservation.date_out");
                                String room_number = rs.getString("rooms.room_number");
                                int price = rs.getInt("reservation.total_price");

                        %>

                        <tr>
                            <td><%= name%></td>
                            <td><%= email%></td>
                            <td><%= arrivalDate%></td>
                            <td><%= depatureDate%></td>
                            <td><%= room_number%></td>
                            <td>Rs.<%= price%></td>
                        </tr>

                        <%}%>
                        
                        <%
                            String sql1 = "select count(*) from reservation where reservation.status = 2";
                            PreparedStatement smt2 = cn.prepareStatement(sql1);
                            ResultSet rs2 = smt2.executeQuery();

                            if (rs2.next()) {

                                total = rs2.getInt(1);
                            }
                        %>

                        <tr>
                            <th colspan="5">
                                <table width="100%">
                                    <tr>
                                        <% for (int i = 0; i <= total / count; i++) {%>
                                    <a href="checkout.jsp?pgno=<%= i%>" class="btn btn-info active" > Page<%= i + 1%></a>
                                    <% }%>
                                     </tr>
                                </table>
                            </th>
                        </tr>
                    </tbody>
                </table>


            </div>
        </div>
    </body>
</html>