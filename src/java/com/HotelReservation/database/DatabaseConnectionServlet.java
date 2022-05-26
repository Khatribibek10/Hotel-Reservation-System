
package com.HotelReservation.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DatabaseConnectionServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            Connection cn = DatabaseConnection.getConnection();
            if (cn != null) {
                out.print("<h1>Database Connection Success!</h1>");
            } else {
                out.print("<h1>Database Connection Failed!</h1>");
            }
        }
    }
}
