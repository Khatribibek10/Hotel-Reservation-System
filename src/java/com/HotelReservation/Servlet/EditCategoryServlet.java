package com.HotelReservation.Servlet;

import com.HotelReservation.database.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditCategoryServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection cn = DatabaseConnection.getConnection();
        String u_id = request.getParameter("id");
        int id = Integer.parseInt(u_id);
        String name = request.getParameter("name");
        String price = request.getParameter("price");
//        Blob img = request.getParameter("image");
        String query = "update room_category set categories_name = ?, price = ? where id = '" + id + "'";
        PreparedStatement preparedStmt;
        try {
            preparedStmt = cn.prepareStatement(query);
            preparedStmt.setString(1, name);
            preparedStmt.setString(2, price);
            preparedStmt.executeUpdate();
            response.sendRedirect("admin/roomcategory.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(EditCategoryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        // execute the java preparedstatement
    }

}
