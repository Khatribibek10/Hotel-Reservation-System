<%-- 
    Document   : rooms
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
        <title>Rooms</title>
        <style>
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            /* Firefox */
            input[type=number] {
                -moz-appearance: textfield;
            }
        </style>
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
                <div class="row">
                    <!-- FORM Panel -->
                    <div class="col-md-4">
                        <form action="../AddRoomServlet" id="manage-room" method="post" name="myForm" onSubmit="return validationForm();">
                            <div class="card">
                                <div class="card-header">
                                    Room Form
                                </div>
                                <div class="card-body">
                                    <input type="hidden" name="id">
                                    <div class="form-group">
                                        <label class="control-label" style="color: black">Room Number</label>
                                        <input type="text" class="form-control" placeholder="Please enter in this format Room-XXX" id="room_number"  onkeyup ="roomNumValidate()" autocomplete="off" name="roomNo" style="width: 100%;" required>
                                        <span id="roomNumMsg"></span>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" style="color: black">Price</label>
                                        <input type="number" class="form-control" autocomplete="off" id="price" name="price" onkeyup ="priceValidate()" style="width: 100%;" required>
                                        <span id="priceMsg"></span>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" style="color: black">Details</label>
                                        <!--<input type="textarea" class="form-control" name="details" rows="5" style="width: 100%;">-->
                                        <textarea class="form-control" name="details" autocomplete="off" rows="5" style="width: 100%;" required></textarea>

                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" style="color:black;">Category</label>
                                        <select class="custom-select browser-default" name="category">
                                            <!-- <option value="0">Single</option>-->
                                            <%       
                                                int total = 0;
                                                int start = 0, count = 5;
                                                int pgno = request.getParameter("pgno") == null ? 0 : Integer.parseInt(request.getParameter("pgno"));
                                                start = pgno * count;
                                                Connection cn = DatabaseConnection.getConnection();
                                                String query = "select * from room_category";
                                                PreparedStatement stmt = cn.prepareStatement(query);
                                                ResultSet rs = stmt.executeQuery(query);
                                                while (rs.next()) {
                                            %>
                                            <option value="<%=rs.getInt("id")%>"> <%=rs.getString("categories_name")%> </option>

                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="" class="control-label"style="color: black;">Availability</label>
                                        <select class="custom-select browser-default" name="status">
                                            <option  value="1">Available</option>
                                            <option  value="0">Unavailable</option>

                                        </select>
                                    </div>
                                </div>

                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <input type="submit" id="signup_btn" value="Add" class="btn btn-sm btn-primary col-sm-3 offset-md-3"> 
                                            <!--<input type="submit" value="Cancel" class="btn btn-sm btn-default col-sm-3" type="button" onclick="">-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- FORM Panel -->

                    <!-- Table Panel -->
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th class="text-center">S/N</th>
                                            <th class="text-center">Category Name</th>
                                            <th class="text-center">Room Number</th>
                                            <th class="text-center">Price</th>
                                            <th class="text-center">Status</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%

                                            String queryRoom = "select * from rooms join room_category where rooms.category_id = room_category.id";
                                            stmt = cn.prepareStatement(queryRoom);
                                            rs = stmt.executeQuery(queryRoom);
                                            while (rs.next()) {
                                                int sn = rs.getInt("rooms.id");
//                                                int cat = rs.getInt("id");
                                                String cat = rs.getString("room_category.categories_name");
                                                String room = rs.getString("rooms.room_number");
                                                int status = rs.getInt("rooms.status");
                                                int price = rs.getInt("rooms.price");


                                        %>
                                        <tr>
                                            <td class="text-center"><%= sn%></td>
                                            <td class="text-center"><%= cat%></td>
                                            <td class="text-center"><%= room%></td>
                                            <td class="text-center"><%= price%></td>
                                            <% if (status == 1) { %>
                                            <td class="text-center"><span class="badge badge-success">Available</span></td>
                                            <% } else { %>
                                            <td class="text-center"><span class="badge badge-danger">Unavailable</span></td>

                                            <% }%>

                                            <td class="text-center">                                               
                                                <!--                                                <a href="" class="btn btn-primary" type="submit">Edit</a>-->
                                                <a href="roomdelete.jsp?id=<%=rs.getInt("id")%>" class="btn btn-danger" type="submit">DELETE</a>
                                            </td>
                                        </tr>
                                        <% }%>

                                        <%
                                            String sql1 = "select count(*) from rooms";
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
                                                    <a href="rooms.jsp?pgno=<%= i%>" class="btn btn-info active" > Page<%= i + 1%></a>
                                                    <% }%>
                                        </tr>
                                </table>
                                </th>
                                </tr>
                                </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- Table Panel -->
                </div>
            </div>	


        </div>
    </div>


    <script src="../js/formValidation.js" type="text/javascript"></script>


</body>
</html>