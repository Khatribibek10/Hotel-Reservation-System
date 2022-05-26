<%@page import="com.OnlineHotel.database.DatabaseConnection"%>
<%@page import="java.sql.Statement"%>
<!doctype html>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/bootstrap.css" rel='stylesheet' type='text/css' />
        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.js"></script>
        <title>Vehicles Avaliable!</title>
        <style>

        </style>
    </head>  
    <body>
        <%@include file="navbarUser.jsp" %>

        <main role="main">
            <div class="album  ">
                <div class="container">
                    <h2 class="text-center p-3 text-secondary">Avaliable Rooms</h2>

                    <div class="row">   
                        <%
                            Connection cn = DatabaseConnection.getConnection();
                            Statement stmt = cn.createStatement();
                            ResultSet rs = stmt.executeQuery("select * from rooms where status = 1");
                            while (rs.next()) {
                        %>
                        <div class="col-md-4 ">
                            <div class="card mb-4  text-secondary  ">

                                <img class="card-img-top"  src="../images/backgrounds.jpg" alt="Card image cap">
                                <div class="card-body px-3 py-3">


                                    <%
                                        int id = rs.getInt("id");
                                        String room_number = rs.getString("room_number");
                                    %>
                                    Room Number: <%= room_number%><br>

                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-sm  btn-outline-secondary mt-2"><a href="roombook.jsp" class="text-decoration-none text-secondary">Book Now</a></button>
                                        </div>
                                    </div>



                                </div>
                            </div>

                        </div>
                        <%
                            }
                        %>
                    </div>

                </div>
            </div>

        </main>


        <div class="mt-3">     
            <%@include file="footer.jsp"%>
        </div>

    </body>
</html>