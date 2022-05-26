package com.HotelReservation.Servlet;

import com.HotelReservation.database.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddRoomServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            Connection cn = DatabaseConnection.getConnection();
            String room = request.getParameter("roomNo");
            String category = request.getParameter("category");
            String pricelabel = request.getParameter("price");
            String status = request.getParameter("status");
            String details = request.getParameter("details");
            String insertQuery = "INSERT INTO rooms(category_id,room_number,details,price, status) values(?,?,?,?,?)";
            PreparedStatement stmt = cn.prepareStatement(insertQuery);

            stmt.setString(1, category);
            stmt.setString(2, room);
            stmt.setString(3, details);
            stmt.setString(4, pricelabel);
            stmt.setString(5, status);
            stmt.execute();

            response.sendRedirect("admin/rooms.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
