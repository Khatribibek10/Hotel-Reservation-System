package com.HotelReservation.Servlet;

import com.HotelReservation.database.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("full_name");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
//        String nameRegex = "([a-z A-Z])";
        String emailRegex = "/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$/";
        if (name.isEmpty() || email.isEmpty() || contact.isEmpty()) {
            request.setAttribute("error", "Field is Empty");
            RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
            rd.include(request, response);
        }  else if (email.matches(emailRegex)) {
            request.setAttribute("emailMsg", "Invalid email format");
            RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
            rd.include(request, response);

        } else if (!contact.matches("((98)|(97))[0-9]{8}")) {
            request.setAttribute("phoneMsg", "Invalid format");
            RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
            rd.include(request, response);
        } else if (email.indexOf('@') <= 4) {
            request.setAttribute("emailMsg", " '@' position is invalid");
            RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
            rd.include(request, response);
        } else {
            Connection cn = DatabaseConnection.getConnection();
            String updateQuery = "UPDATE users SET name=?, contact=? where email=?";
            PreparedStatement stmt;
            try {
                stmt = cn.prepareStatement(updateQuery);
                stmt.setString(1, name);
                stmt.setString(2, contact);
                stmt.setString(3, email);
                stmt.execute();
                HttpSession session = request.getSession();
                session.setAttribute("s_name", name);
                response.sendRedirect("profile.jsp");

            } catch (SQLException ex) {
                Logger.getLogger(UpdateProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

}
