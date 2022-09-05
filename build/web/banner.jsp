<!doctype html>
<html lang="en">
    <head>
        <%@include file="head.jsp" %>
        <title>banner</title>
        <style>
            .maindiv{
                margin: 250px;
                padding: 25px;

            }
            body{
                width: 100%;
                height: 100%;
                background-position: center;
                background-image: url("images/Deluxe King 1.png");
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body class="">

        <form action="availableRooms.jsp" method="post" onsubmit="return validateForm()" name="myForm">
            <div class=" row maindiv bg-secondary px-4">

                <div class="col-4  ">
                    <div>
                        <label><b class="text-white">Check In Date</b></label>
                    </div>
                    <input type="date" class="form-control"  name="check_in" id="check_in"   required/>
                    <span id="checkin"></span>
                </div>
                <div class="col-4">
                    <div>
                        <label><b class="text-white">Check Out Date</b></label>
                    </div>
                    <input type="date" class="form-control " name="check_out" id="check_out"  required />
                    <span id="checkout"></span>
                </div>

                <div class="col-2 mt-3 px-5 btn">
                    <input type="submit"  class="btn bg-primary text-white" value="Search Availability" />
                </div>

            </div>
        </form>

        <script type="text/javascript">

            function validateForm() {
                const currentDate = new Date();
                var checkDate = currentDate.setDate(currentDate.getDate() - 1);
                var arrivalDate = new Date(document.getElementById('check_in').value);
                var depatureDate = new Date(document.getElementById('check_out').value);
                if (depatureDate <= arrivalDate) {
                    displayMsg("Your checkin and check out date is invalid", "checkout", "red");
                    return false;
                } else if (arrivalDate < checkDate) {
                    displayMsg("Your checkin date is less than current date", "checkin", "red");
                    return false;
                }
            }

            $(function () {
                var dtToday = new Date();

                var month = dtToday.getMonth() + 1;
                var day = dtToday.getDate();
                var year = dtToday.getFullYear();
                if (month < 10)
                    month = '0' + month.toString();
                if (day < 10)
                    day = '0' + day.toString();

                var maxDate = year + '-' + month + '-' + day;
                $('#check_in').attr('min', maxDate);
                $('#check_out').attr('min', maxDate);
            });



        </script>
        <script src="js/formValidation.js" type="text/javascript"></script>
    </body>
</html>