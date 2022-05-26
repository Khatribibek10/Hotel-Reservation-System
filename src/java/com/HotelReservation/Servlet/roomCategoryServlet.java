package com.HotelReservation.Servlet;

import java.io.IOException;
import java.nio.file.Paths;

import com.HotelReservation.database.DatabaseConnection;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadImage")
@MultipartConfig(maxFileSize = 16177216)

public class roomCategoryServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        try {

            Connection cn = DatabaseConnection.getConnection();
            String name = request.getParameter("name");
            Part part = request.getPart("image");

            String insertQuery = "INSERT INTO room_category(categories_name, cover_img) values(?,?)";
            PreparedStatement stmt = cn.prepareStatement(insertQuery);
            InputStream is = part.getInputStream();
            stmt.setString(1, name);
           
            stmt.setBlob(2, is);
            stmt.execute();

//            RequestDispatcher rddd = request.getRequestDispatcher("userview/roomcategory.jsp");
//            out.println("<h1> Category added Sucessfully</h1>");
//            rddd.forward(request, response);
            response.sendRedirect("admin/roomcategory.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
