package com.HotelReservation.Servlet;

import com.HotelReservation.database.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            Connection cn = DatabaseConnection.getConnection();
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            String password = request.getParameter("password");
            String cpassword = request.getParameter("confirm");
            String emailRegex = "/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$/";

            int secret_key = 8;
            String encrypt = getEncryptedValue(password, secret_key);
            System.out.println("Orignal_value:" + password);
            System.out.println("encrypted value:" + encrypt);

            if (name.isEmpty() || email.isEmpty() || contact.isEmpty() || password.isEmpty() || cpassword.isEmpty()) {
                out.print("error");
            } else if (email.matches(emailRegex)) {
                out.print("error");

            }   else if (!contact.matches("((98)|(97))[0-9]{8}")) {
                out.print("error");
            } else if (email.indexOf('@') <= 4) {
                out.print("error");
            } else if (password.length() <= 5 && password.length() > 20) {
                out.print("error");

            } else {
                if (password.equals(cpassword)) {
                    String insertQuery = "INSERT INTO users(name,email,contact,password) values(?,?,?,?)";
                    PreparedStatement stmt = cn.prepareStatement(insertQuery);

                    stmt.setString(1, name);
                    stmt.setString(2, email);
                    stmt.setString(3, contact);
                    stmt.setString(4, encrypt);
                    stmt.execute();

                    out.print("success");
                } else {
                    out.println("error");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private String getEncryptedValue(String password, int secret_key) {
        String encrypt = " ";
        for (int i = 0; i < password.length(); i++) {

            char ch = password.charAt(i);
            ch += secret_key;
            encrypt = encrypt + ch;
        }

        return encrypt;

    }

    private int charAt(int length) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
