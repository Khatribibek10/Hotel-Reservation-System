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
        <title>User Edit</title>
        <style>
            .control-label{
                color:black;
            }
            .form-group > input{
                width: 100%;
            }
            /* Chrome, Safari, Edge, Opera */
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
                    <div class="col-11 mt-3 px-5 ">
                        <%                            String userid = request.getParameter("id");
                            int id = Integer.parseInt(userid);
                            System.out.println(id);
                            Connection cn = DatabaseConnection.getConnection();
                            String query = "select * from users where id  = '" + id + "'";
                            PreparedStatement stmt = cn.prepareStatement(query);
                            ResultSet rs = stmt.executeQuery(query);
                            while (rs.next()) {
                                String name = rs.getString("name");
                                String email = rs.getString("email");
                                String contact = rs.getString("contact");

                        %>
                        <form action="../EditUserServlet" name="myForm" method="post" onSubmit="return validationForm();">
                            <div class="card">
                                <div class="card-header">
                                    User Edit Form
                                </div>
                                <div class="card-body">
                                    <input type="hidden" name="id" value="<%= id%>">
                                    <div class="form-group">
                                        <label class="control-label">Name</label>
                                        <input type="text" class="form-control" id="fullName" autocomplete="off" name="name" value="<%= name%>" onkeyup ="fullNameValidate()" required>
                                        <span id="fullNameMsg">${nameMsg}</span>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Email</label>
                                        <input type="email" class="form-control" id="email" autocomplete="off" name="email" value="<%= email%>" onkeyup="emailValidate()" required>
                                        <span id="emailMsg">${emailMsg}</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Contact</label>
                                        <input type="number" class="form-control" id="phone" autocomplete="off" name="contact" value="<%= contact%>" maxlength="10"  onKeyPress="if (this.value.length == 10)
                                                    return false;" onkeyup="phoneValidate()"required>
                                        <span id="phoneMsg">${phoneMsg}</span>
                                    </div>

                                </div>
                                <div id="error">
                                    <span id="errorMsg">${error}</span>
                                </div>

                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <button id="signup_btn" class="btn btn-sm btn-primary col-sm-3 offset-md-3" type="submit"> Update</button>

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



        <script src="../js/formValidation.js" type="text/javascript"></script>
    </body>
</html>