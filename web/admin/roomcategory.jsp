<%-- 
    Document   : roomcategory
    Created on : Feb 26, 2022, 3:05:25 PM
    Author     : khatr
--%>


<%@page import="java.util.Base64"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.HotelReservation.database.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <%@include file="head.jsp" %>
        <title>Room Category</title>
        <style>
            .control-label{
                color:black;
            }
            .form-group > input{
                width: 100%;
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
                        <form action="../roomCategoryServlet" name="myForm" method="post" onSubmit="return validationForm();" enctype="multipart/form-data">
                            <div class="card">
                                <div class="card-header">
                                    Room Category Form
                                </div>
                                <div class="card-body">
                                    <input type="hidden" name="id">
                                    <div class="form-group">
                                        <label class="control-label">Category</label>
                                        <input type="text" class="form-control" onkeyup ="fullNameValidate()" autocomplete="off" id="fullName" name="name" required />
                                        <span id="fullNameMsg"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="image" class="control-label">Image</label>
                                        <input type="file" class="form-control" name="image" required />
                                    </div>
                                    <div class="form-group">
                                        <img src="" alt="" id="cimg">
                                    </div>
                                </div>

                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <button id="signup_btn" class="btn btn-sm btn-primary col-sm-3 offset-md-3" type="submit"> Add</button>
                                            <!--<button class="btn btn-sm btn-default col-sm-3" type="button"> Cancel</button>-->
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
                                            <th class="text-center">Image</th>
                                            <th class="text-center">Room Type</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                                            int total = 0;
                                            int start = 0, count = 3;
                                            int pgno = request.getParameter("pgno") == null ? 0 : Integer.parseInt(request.getParameter("pgno"));
                                            start = pgno * count;
                                            Connection cn = DatabaseConnection.getConnection();
                                            String query = "select * from room_category";
                                            PreparedStatement stmt = cn.prepareStatement(query);
                                            ResultSet rs = stmt.executeQuery(query);
                                            while (rs.next()) {

                                                int id = rs.getInt("id");
                                                String name = rs.getString("categories_name");
                                                Blob image = rs.getBlob(3);
                                                byte imgData[] = image.getBytes(1, (int) image.length());
                                                String encodedImage = Base64.getEncoder().encodeToString(imgData);
                                                String cat_img = "data:image/jpg;base64," + encodedImage;


                                        %>


                                        <tr>


                                            <td class="text-center"><%= id%></td>


                                            <td class="text-center">
                                                <img src="<%= cat_img%>" width="150px;" height="100px;" alt="photo" id="cimg">
                                            </td>
                                            <td class="text-center">
                                                <b><%= name%></b>
                                            </td>
                                            <td class="text-center">
                                                <!--<a href="categoryupdate.jsp?id=<%=rs.getInt("id")%>" class="btn btn-primary">Edit</a>-->
                                                <a href="categorydelete.jsp?id=<%=rs.getInt("id")%>" class="btn btn-danger">DELETE</a>
                                            </td>
                                        </tr>
                                        <%}%>

                                        <%
                                            String sql1 = "select count(*) from room_category ";
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
                                                    <a href="roomcategory.jsp?pgno=<%= i%>" class="btn btn-info active" > Page<%= i + 1%></a>
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

        <script src="../js/formValidation.js" type="text/javascript"></script>
    </body>
</html>