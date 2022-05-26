

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <%@include file="head.jsp" %>
        <title>Dashboard</title>
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
<!--                <div class="row">
                    <div class=" col-4" >
                        <div class="card  " style="max-width: 18rem; margin-top: 40px;background-color: skyblue;">
                            <div class="card-body">
                                <h5 class="card-title">Total Rooms Category</h5>
                                <p class="card-text text-lg-center">3</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-2">

                    </div>

                    <div class=" col-4" >
                        <div class="card  " style="max-width: 18rem; margin-top: 40px; background-color: skyblue;">
                            <div class="card-body">
                                <h5 class="card-title">Total Rooms </h5>
                                <p class="card-text text-lg-center">6</p>
                            </div>
                        </div>
                    </div>
                    
                </div>-->
                
<!--                <div class="row">
                    <div class=" col-4" >
                        <div class="card  " style="max-width: 18rem; margin-top: 40px;background-color: skyblue;">
                            <div class="card-body">
                                <h5 class="card-title">Total Rooms Booked</h5>
                                <p class="card-text text-lg-center">3</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-2">

                    </div>

                    <div class=" col-4" >
                        <div class="card  " style="max-width: 18rem; margin-top: 40px; background-color: skyblue;">
                            <div class="card-body">
                                <h5 class="card-title">Total Available Rooms </h5>
                                <p class="card-text text-lg-center">6</p>
                            </div>
                        </div>
                    </div>
                    
                </div>-->
            </div>



        </div>


        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
    </body>
</html>