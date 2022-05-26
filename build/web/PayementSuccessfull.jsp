<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.HotelReservation.database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection conn = DatabaseConnection.getConnection();
    Statement st = conn.createStatement();
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Sucessfull</title>
    </head>
    <style>
        .navbar a{
            color: white;
        }
        .navbar .mid{
            margin-left: 400px;
        }
     
        .center{
            margin: auto;
            width: 50%;
            border: 3px solid none;
            padding: 10px;
        }
        .img-center{
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 50%;
        }
        table tr td{
            border: 1px solid;
            padding:5px;
        }

    </style>
    <body style="background-image:url('images/13.jpg'); background-repeat: no-repeat; background-size: cover; ">
        <%
            Object u_id = session.getAttribute("s_id");
        %>
        <jsp:include page="navbarUser.jsp"/>
        <div>
            <%
                Connection cn = DatabaseConnection.getConnection();
                Statement stmt = cn.createStatement();
                ResultSet rss = stmt.executeQuery("select * from reservation join users where reservation.user_id = users.id and user_id = '" + u_id + "' order by reservation.id desc limit 1");
                while (rss.next()) {
                    String total_price = rss.getString("reservation.total_price");
                    String check_in = rss.getString("reservation.date_in");
                    String check_out = rss.getString("reservation.date_out");
                    int no_of_days = rss.getInt("reservation.total_days");
                    int price = Integer.parseInt(total_price);
                    String contact = rss.getString("users.contact");
                    String uname = rss.getString("users.name");
            %>


        </div>

        <div class="center mt-4" style=" margin-bottom:25px;">       
            <div class="center bg-success text-light" style="width: 500px;">
                <h4 class="text-center text-light">Payment Recipt</h4>                
                <img src="images/paypal.jpg"  class="img-center" style="width: 50%">
                <table style="width: 400px;" class="text-center text-light center mt-4">                


                    <tr>
                        <td>Name</td>
                        <td><%= uname %></td>
                    </tr>
                    <tr>
                        <td>Contact</td>
                        <td><%= contact%></td>
                    </tr>
                    <tr>
                        <td>Amount</td>
                        <td>Rs.<%= price%></td>                        
                    </tr>
                    <tr>
                        <td>Payment Status</td>
                        <td ><span class="badge badge-primary" style="font-size: 15px;">Successfull</span></td>
                    </tr>
                </table>
                <%
                    }
                %>
                <button class="btn text-light mt-2"  style="background-color:#222D32; margin-left: 75px; border-radius: 30px; width:340px; "> <a href="index.jsp" style="text-decoration:none; color: white;">Home</a>  </button>                                          
            </div>

        </div>
        <div class="footer">
            <jsp:include page="footer.jsp"/>

        </div>
    </body>
</html>