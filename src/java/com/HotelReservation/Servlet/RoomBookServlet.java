package com.HotelReservation.Servlet;

import com.HotelReservation.database.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.time.temporal.ChronoUnit;

public class RoomBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            Connection cn = DatabaseConnection.getConnection();
            String u_id = request.getParameter("u_id");
            int id = Integer.parseInt(u_id);

            String roomid = request.getParameter("room_id");
            int room_id = Integer.parseInt(roomid);

            int total_price = Integer.parseInt(request.getParameter("total_price"));

            String arrivalDate = request.getParameter("arrival_date");
            String depatureDate = request.getParameter("depature_date");

            int total_days = Integer.parseInt(request.getParameter("total_days"));
            
            String insertQuery = "insert into reservation(room_id,date_in, date_out, user_id, total_days, total_price) values(?,?,?,?,?,?)";
            PreparedStatement stmt = cn.prepareStatement(insertQuery);
            stmt.setInt(1, room_id);
            stmt.setString(2, arrivalDate);
            stmt.setString(3, depatureDate);
            stmt.setInt(4, id);
            stmt.setInt(5, total_days);
            stmt.setInt(6, total_price);
            stmt.execute();

            response.sendRedirect("paypal.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
