package com.HotelReservation.Servlet;

import com.HotelReservation.database.DatabaseConnection;
import com.HotelReservation.helper.EmailSender;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MailSenderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            Connection conn = DatabaseConnection.getConnection();

            String userid = request.getParameter("id");
            int id = Integer.parseInt(userid);

            Statement stmt;

            try {
                stmt = conn.createStatement();

                String query = "select * from reservation join users on reservation.user_id = users.id join rooms on reservation.room_id = rooms.id join room_category on rooms.category_id = room_category.id where reservation.id = '" + id + "'";
                PreparedStatement preparedstmt;
                preparedstmt = conn.prepareStatement(query);
                ResultSet rs = preparedstmt.executeQuery();
                while (rs.next()) {
                    String email = rs.getString("users.email");
                    String fullName = rs.getString("users.name");
                    String roomNo = rs.getString("rooms.room_number");
                    int totalPrice = rs.getInt("reservation.total_price");
                    int totalDays = rs.getInt("reservation.total_days");
                    String datein = rs.getString("reservation.date_in");
                    String dateout = rs.getString("reservation.date_out");
                    String category = rs.getString("room_category.categories_name");
                    final String emailSubject = "Booking accepted!!!";
                    final String emailMessage = "<p>Hi <b>" + fullName + "</b>,</p><br/>Your Room <b>" + roomNo + "</b>("+category+") have been successfully booked for <b>" + totalDays + "</b> days at <b>Rs." + totalPrice + "</b>. Your Check in date is <b>" + datein + "</b> after 12PM and Check out date is <b>" + dateout + "</b> before 11:30 AM. ";
                    boolean status = EmailSender.sendMail(email, emailSubject, emailMessage);
                    if (status == true) {
                        stmt.executeUpdate("update reservation, rooms set reservation.status = 1, rooms.status = 0 where reservation.room_id = rooms.id  and reservation.id= '" + id + "'");
                        response.sendRedirect("admin/reservation.jsp");
                    }

                }

            } catch (SQLException ex) {
                Logger.getLogger(MailSenderServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

}
