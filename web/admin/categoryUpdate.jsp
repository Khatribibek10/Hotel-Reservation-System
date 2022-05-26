<%-- 
    Document   : roomcategory
    Created on : Feb 26, 2022, 3:05:25 PM
    Author     : khatr
--%>


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
        <title>Category Update</title>
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
                    <div class="col-11 mt-3 px-5 ">
                        <%
                            String userid = request.getParameter("id");
                            int id = Integer.parseInt(userid);
                            System.out.println(id);
                            Connection cn = DatabaseConnection.getConnection();
                            String query = "select * from room_category where id  = '" + id + "'";
                            PreparedStatement stmt = cn.prepareStatement(query);
                            ResultSet rs = stmt.executeQuery(query);
                            while (rs.next()) {
                                String category = rs.getString("categories_name");
                                int price = rs.getInt("price");
                                Blob img = rs.getBlob("cover_img");

                        %>
                        <form action="../EditCategoryServlet" name="myForm" method="post" onSubmit="return validationForm();">
                            <div class="card">
                                <div class="card-header">
                                    Category Edit Form
                                </div>
                                <div class="card-body">
                                    <input type="hidden" name="id" value="<%= id%>">
                                    <div class="form-group">
                                        <label class="control-label">Category Name</label>
                                        <input type="text" class="form-control" name="name" value="<%= category%>" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Price</label>
                                        <input type="text" class="form-control" name="price" value="<%= price%>" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label">Image</label>
                                        <input type="file" class="form-control" name="image" value="<%= img%>"  required>
                                    </div>

                                </div>

                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <button class="btn btn-sm btn-primary col-sm-3 offset-md-3" type="submit"> Update</button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <% }%>
                    </div>
                    <!-- FORM Panel -->
                </div>


            </div>
        </div>



        <script type="text/javascript">
            function validationForm() {
                let a = document.forms['myForm']["name"].value;
                let c = document.forms['myForm']["price"].value;
                let d = document.forms['myForm']["image"].value;


                if (a === "" || c === "" || d === "") {
                    alert("Fields must be filled out");
                    return false;
                }

            }
        </script>
    </body>
</html>