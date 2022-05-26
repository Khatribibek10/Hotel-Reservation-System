<html>
    <head>
        <style>
            .banner{
                width:auto;
                height: auto;
                margin: 250px;
                padding: 25px;
                margin-bottom: 0;
            }
        </style>
    </head>
    <body>
        <div>
            <jsp:include page="navbarUser.jsp"/>
        </div>

        <div class="banner">
            <jsp:include page="banner.jsp"/>
        </div>

<!--        <div class="banner">
            <%--<jsp:include page="categorybody.jsp"/>--%>
        </div>-->

        <jsp:include page="footer.jsp"/>
    </body>
</html>