<!doctype html>
<html lang="en">

    <head>
        <%@include file="head.jsp" %>
        <style>
            .newnav {
                margin-left: 225px;
            }

            .login {
                margin-left: 410px;
            }
        </style>
        <title>Online Hotel Reservation</title>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-secondary px-5 ">

            <div class="container-fluid ">
                <a class="navbar-brand py-2 text-light" href="#">
                    Online Hotel Reservation
                </a>
                <%
                    Object name = session.getAttribute("s_name");
                    if (name == null) {
                %>


                <div class="collapse navbar-collapse  newnav">
                    <div class="div-first float-left">
                        <div class="navbar-nav  ">

                            <a class="nav-link active text-light px-4" aria-current="page" href="index.jsp">Home Page</a>
                            <!--                            <a class="nav-link active text-light px-2" href="roombook.jsp">Book Room</a>-->
                            <!--<a class="nav-link active text-light px-4" href="#">About us</a>--> 
                        </div>
                    </div>
                    <div class="div-second float-right">
                        <div class="navbar-nav  ">
                            <a class="nav-link active text-light px-4 login" href="Login.jsp" >|Login</a>
                            <a class="nav-link active text-light px-4 signup" href="Signup.jsp" >Signup</a>
                        </div>
                    </div>
                    <% } else {%>
                    <div class="div-first float-left">
                        <div class="navbar-nav  ">

                            <a class="nav-link active text-light px-4" aria-current="page" href="index.jsp">Home Page</a>
                            <!--                            <a class="nav-link active text-light px-2" href="roombook.jsp">Book Room</a>-->
                            <!--<a class="nav-link active text-light px-4" href="#">About us</a>--> 
                        </div>
                    </div>
                    <div class="div-second float-right">
                        <div class="navbar-nav  ">
                            <p style="text-decoration: none; color: white;" class="px-5 py-2"><i class="fa fa-user" aria-hidden="true" ></i><a href="profile.jsp" style="text-decoration:none; color: white;"> <b><%= name%></b></a></p>
                            <a href="logout.jsp" style="text-decoration: none; color: white;" class="px-5 py-2">Logout</a>

                        </div>
                    </div>

                    <% }%>
                </div>
            </div>

        </nav>

    </body>

</html>