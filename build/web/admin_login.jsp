<%-- 
    Document   : Login
    Created on : Mar 9, 2022, 12:25:37 PM
    Author     : khatr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Login</title>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <%@include file="head.jsp" %>
    </head>
    <body>
        <div>
            <%@include file="navbarUser.jsp" %>
        </div>

        <div class="container mt-4 mb-2">
            <div class="row">
                <div class="col-lg-3 col-md-2"></div>
                <div class="col-lg-6 col-md-8 login-box bg-grey">
                    <div class="col-lg-12 login-key">
                        <i class="fa fa-user" aria-hidden="true"></i>
                    </div>
                    <div class="col-lg-12 login-title">
                        Admin Login Form
                    </div>

                    <div class="col-lg-12 login-form px-4">
                        <div class="col-lg-12 login-form">
                            <form action="AdminLoginServlet" method="post">
                                <div class="form-group">
                                    <label class="form-control-label">Email</label>
                                    <input type="email" name="u_email" id="email" autocomplete="off" class="form-control" placeholder="abc@gmail.com" onkeyup="emailValidate()" required />
                                    <span id="emailMsg"></span>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label">PASSWORD</label>
                                    <input type="password" id="password"  name="u_password"autocomplete="off" class="form-control" placeholder="*******" onkeyup="passValidate()" required/>
                                    <span id="passMsg"></span>
                                </div>

                                <div class="col-lg-12 loginbttm">
                                    <div class="col-lg-6 login-btm login-text">
                                        <!-- Error Message -->
                                        <span style="color: red;">${error}</span>
                                    </div>
                                    <div class="col login-button">
                                        <button type="submit" id="signup_btn" class="btn btn-info btn-md login-button">LOGIN</button>
                                    </div>
                                </div>

                                <div class="col-lg-6 alternative mb-4 ">
                                    <a href="Login.jsp" style="color:white; font-weight: bold;text-decoration:none">Login as User</a>
                                </div>
                            </form>
                        </div>
                    </div>                    
                </div>
            </div>
        </div>

        <div style="margin-top: 30px;">
            <%@include file="footer.jsp" %>
        </div>
        
        



<script src="js/formValidation.js" type="text/javascript"></script>
    </body>
</html>
