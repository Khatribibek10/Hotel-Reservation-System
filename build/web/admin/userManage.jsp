

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.HotelReservation.database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <%@include file="head.jsp" %>
        <title>User Manage</title>
    </head>
    <body>
        <div><!-- navbartop start -->
            <%@include file="navbartop.jsp" %>
        </div><!-- navbartop ends -->

        <div class="row">
            <div class="col-3">
                <%@include file="sidenavbar.jsp" %>
            </div>
            <div class="col-1">

            </div><!-- comment -->
            <div class="col-8">

                <div class="card">
                    <div class="card-body">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">Name</th>
                                    <th class="text-center">Email</th>
                                    <th class="text-center">Contact</th>
                                    <th class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%    
                                    int total = 0;
                                    int start = 0, count = 5;
                                    int pgno = request.getParameter("pgno") == null?0:Integer.parseInt(request.getParameter("pgno"));
                                    start = pgno * count;
                                    Connection cn = DatabaseConnection.getConnection();
                                    String query = "select * from users limit ?,?";
                                    PreparedStatement stmt = cn.prepareStatement(query);
                                    stmt.setInt(1, start);
                                    stmt.setInt(2, count);
                                    
                                    ResultSet rs = stmt.executeQuery();
                                    while (rs.next()) {
                                        
                                %>

                                <%
                                    int id = rs.getInt("id");
                                    String name = rs.getString("name");
                                    String contact = rs.getString("contact");
                                    String email = rs.getString("email");

                                %>


                                <tr>
                                    <td><%= id%></td>
                                    <td><%= name%></td>
                                    <td><%= email%></td>
                                    <td><%= contact%></td>
                                    <td>
                                        <a href="updateForm.jsp?id=<%=rs.getInt("id")%>" class="btn btn-primary">Edit</a>
                                        <a href="userdelete.jsp?id=<%=rs.getInt("id")%>" class="btn btn-danger">DELETE</a>
                                    </td>

                                </tr>

                                <% } %>
                                <%
                                    String sql1 = "select count(*) from users";
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
                                            <a href="userManage.jsp?pgno=<%= i%>" class="btn btn-info active" > Page<%= i + 1%></a>
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



        </div>


        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
    </body>
</html>