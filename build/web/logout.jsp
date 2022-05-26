<%-- 
    Document   : logout.jsp
    Created on : Mar 11, 2022, 7:17:41 PM
    Author     : khatr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <% 
            session.invalidate();
            response.sendRedirect("index.jsp");
        %>
        
    </body>
</html>
