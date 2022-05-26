<%-- 
    Document   : Signup
    Created on : Mar 9, 2022, 1:04:38 PM
    Author     : khatr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <%@include file="head.jsp" %>
        <title>Sign up</title>
        <style>
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

        <div>
            <%@include file="navbarUser.jsp" %>
        </div>

        <div class="container mt-5 col-5 " style="background-color: #222D32;">
            <div class="row">
                <div class="col">
                    <h2 class="text-center py-2 " style="color: white;">Registration Form</h2>
                    <form id="register-form" class="form-horizontal" method="POST" action="SignupServlet" onsubmit="return formValidation();">
                        <br>
                        <fieldset>		
                            <div class="form-group m-3">

                                <div class="cols">
                                    <div class="input-group">

                                        <input type="text" class="form-control" name="name" autocomplete="off" id="fullName"  placeholder="Enter your Name" onkeyup ="return fullNameValidate()" required/>
                                        <span id="fullNameMsg"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group m-3">

                                <div class="cols-sm-10">
                                    <div class="input-group">

                                        <input type="email" class="form-control" name="email" autocomplete="off" id="email"  placeholder="Enter your Email" onkeyup="return emailValidate()" required/>
                                        <span id="emailMsg"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group m-3">

                                <div class="cols-sm-10">
                                    <div class="input-group">

                                        <input type="number" class="form-control" name="contact" autocomplete="off"  id="phone" onKeyPress="if (this.value.length == 10)
                                                    return false;"  placeholder="Enter your Contact" maxlength="10" onkeyup=" return phoneValidate()" required/>
                                        <span id="phoneMsg"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group m-3">

                                <div class="cols-sm-10">
                                    <div class="input-group">

                                        <input type="password" class="form-control" name="password" id="password" autocomplete="off" placeholder="Enter your Password" onkeyup=" return passValidate()"required/>
                                        <span id="passMsg">${error}</span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group m-3">

                                <div class="cols-sm-10">
                                    <div class="input-group">

                                        <input type="password" class="form-control" name="confirm" id="confirm" autocomplete="off"  placeholder="Confirm your Password" onkeyup="return pass2Validate()" required/>
                                        <span id="pass2Msg"></span>
                                    </div>
                                </div>
                            </div>
                                    <div class="cols-sm-10">
                                        <span>${error}</span>
                                    </div>

                            <div class="form-group m-3 ">
                                <input  type="submit" id="signup_btn" class="btn btn-info btn-md login-button" value="Register">
                            </div>

                            <div class="alternative m-3">
                                <a href="Login.jsp" class=" text-decoration-none" style="color:white;font-weight: bold;">Already have an account?</a>
                            </div>
                        </fieldset>
                    </form>

                </div>
            </div>
        </div> 

        <div class="mt-5">
            <%@include file="footer.jsp" %>
        </div>

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script>

                                            $(document).ready(function () {

                                                $('#register-form').on('submit', function (event) {
                                                    event.preventDefault();
                                                    let form = new FormData(this);
                                                    $.ajax({
                                                        url: "SignupServlet",
                                                        type: 'POST',
                                                        data: form,
                                                        success: function (data, _, _) {
                                                            if (data.trim() === 'error') {
                                                                swal("Error :(", "There was a problem signing up", "error");
                                                            } else {
                                                                swal("Signup Successful", "success").then((_) => {
                                                                    window.location = "Login.jsp";
                                                                });
                                                            }
                                                        },
                                                        error: function (_, _, _) {
                                                            swal("Error :(", "There was a problem signing up", "error");
                                                        },
                                                        processData: false,
                                                        contentType: false
                                                    });
                                                });
                                            });
        </script>
        <script src="js/formValidation.js" type="text/javascript"></script>
    </body>
</html>
