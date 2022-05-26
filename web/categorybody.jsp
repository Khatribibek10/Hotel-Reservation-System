<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="com.HotelReservation.database.DatabaseConnection"%>
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
        <!--<img src="image/logo.jpg" alt=""/>-->
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Rooms Category</title>
        <style>

        </style>
    </head>  
    <body>
        <main role="main">
            <div class="album  ">
                <div class="container">
                    <h2 class="text-center p-3 text-secondary">Avaliable Room Categories</h2>
                    <!--<a href="categoryRoom.jsp" style="text-decoration:none;">-->
                    <div class="row">   
                        <%
                            Connection cn = DatabaseConnection.getConnection();
                            Statement stmt = cn.createStatement();
                            ResultSet rs = stmt.executeQuery("select * from room_category");
                            while (rs.next()) {
                        %>
                        <%
                            int id = rs.getInt("id");
                            String categories_name = rs.getString("categories_name");
                            Blob image = rs.getBlob(3);
                            byte imgData[] = image.getBytes(1, (int) image.length());
                            String encodedImage = Base64.getEncoder().encodeToString(imgData);
                            String pic = "data:image/jpg;base64," + encodedImage;
                            //                                        

                        %>

                        <div class="col-md-4 ">
                            <div class="card mb-4  text-secondary  ">
                                <form action="categoryRoom.jsp">
                                    <input type="hidden" name="category_id" value="<%= id%>"/>
                                    <img class="card-img-top"  src="<%= pic%>" height="150px;" width="200px;" alt="Card image cap">
                                    <div class="card-body px-3 py-3">
                                        <b>Category:</b> &nbsp;<%= categories_name%><br>

                                        <input class="btn btn-primary" type="submit" value="View"/>
                                    </div>
                                </form>
                            </div>

                        </div>

                        <%
                            }
                        %>
                    </div>
                    <!--</a>-->

                </div>
            </div>

        </main>



        <%--<jsp:include page="footer.jsp"/>--%>
    </body>
</html>