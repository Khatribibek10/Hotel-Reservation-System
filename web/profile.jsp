<%-- 
    Document   : PayementFailed.jsp
    Created on : Mar 19, 2022, 2:22:54 PM
    Author     : khatr
--%>


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
        <title>User Profile</title>
        <style>
            body {

                background-repeat: no-repeat;
                background-size: cover;
            }
            .box-shadow {
                box-shadow: 0 .25rem .75rem rgba(0, 0, 0, .05);
            }

        </style>
    </head>
    <body>
        <%
            Object user_id = session.getAttribute("s_id");
        %>

        <style>


        </style>
        <%
            Connection cn = DatabaseConnection.getConnection();
        %>
        <div><%@include file="navbarUser.jsp" %></div>

        <div class="album ">
            <div class="container ">


                <div class="row " style="width:400px; float: left; margin-top: 100px;">
                    <div class="col">
                        <div class="card bg-light mb-2">
                            <%
                                Statement stmt = cn.createStatement();
                                ResultSet rs = stmt.executeQuery("select * from users where id = '" + user_id + "'");
                                while (rs.next()) {
                                    String user_name = rs.getString("name");
                                    String contact = rs.getString("contact");
                                    String email = rs.getString("email");
                            %>
                            <form action="UpdateProfileServlet" method="post">
                                <div class="row m-4">
                                    <div class="col">
                                        <label>Full Name</label>
                                        <input type="text" class="form-control" id="fullName" autocomplete="off" name="full_name" value="<%= user_name%>" onkeyup ="fullNameValidate()" required>
                                        <span id="fullNameMsg" style="color:red;">${nameMsg}</span>
                                    </div>
                                    <div class="col">
                                        <label>Contact</label>
                                        <input type="text" class="form-control" id="phone" autocomplete="off"  onkeypress="return isNumberKey(event)" name="contact" value="<%= contact%>" onkeyup="phoneValidate()" maxlength="10" required>
                                        <span id="phoneMsg" style="color:red;">${phoneMsg}</span>
                                    </div>
                                </div>
                                <div class="row m-4">

                                    <div class="col">
                                        <label>Email</label>
                                        <input type="text" class="form-control" name="email" value="<%= email%>"  required readonly/>
                                        

                                    </div>
                                </div>
                                        
                                        <div id="error">
                                            <span id="errorMsg" style="color:red;">${error}</span>
                                        </div>
                                <div class="">
                                    <div class="btn-group px-6 ">

                                        <button type="submit" id="signup_btn" class="btn px-3 btn-secondary" style="margin-left: 35px;">Update</button>
                                    </div>
                                </div>

                            </form>
                            <% }%>

                        </div>
                    </div>

                </div><!-- profile div ends -->

                <div class="row " style="width:800px; float: right; margin-top: 100px;">
                    <div class="col">
                        <div class="card bg-light mb-2">
                            <h3 class="font-weight-bold text-center" >Recent Booking</h3>
                            <table class="table">
                                <thead class="thead-dark" style="background-color: grey;">
                                    <tr>
                                        <th scope="col">Room Number</th>
                                        <th scope="col">CheckIn Date</th>
                                        <th scope="col">CheckOut Date</th>
                                        <th scope="col">Total Price</th>
                                        <th scope="col">Total Days</th>
                                        <th scope="col">Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        String query = "select * from reservation join users on reservation.user_id = users.id join rooms on reservation.room_id=rooms.id where users.id = '" + user_id + "' group by reservation.id order by reservation.id desc";
                                        PreparedStatement pstmt = cn.prepareStatement(query);
                                        ResultSet rss = pstmt.executeQuery(query);
                                        while (rss.next()) {
                                            String room_number = rss.getString("rooms.room_number");
                                            String price = rss.getString("reservation.total_price");
                                            String datein = rss.getString("reservation.date_in");
                                            String dateout = rss.getString("reservation.date_out");
                                            String total_days = rss.getString("reservation.total_days");
                                            int status = rss.getInt("reservation.status");

                                    %>
                                    <tr>
                                        <td class="text-center"><%= room_number%></td>
                                        <td class="text-center"><%= datein%></td>
                                        <td class="text-center"><%= dateout%></td>
                                        <td class="text-center"><%= price%></td>
                                        <td class="text-center"><%= total_days%></td>
                                        <td class="text-center">
                                            <% if (status == 0) {%>
                                            <span class="btn btn-warning bg-light">Pending</span>
                                            <% } else if (status == 1) {%>
                                            <span class="btn btn-success bg-gradient">Accepted</span>

                                            <%} else if (status == 2) {%>
                                            <span class="btn btn-danger">Checkout</span>
                                            <%} else {%>
                                            <span class="btn btn-danger">Rejected</span>
                                            <% } %>
                                        </td>
                                    </tr>

                                    <% }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>

       

 <script src="js/formValidation.js" type="text/javascript"></script>
    </body>
</html>

