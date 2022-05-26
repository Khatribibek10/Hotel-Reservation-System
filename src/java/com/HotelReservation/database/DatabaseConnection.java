
package com.HotelReservation.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
public static Connection getConnection() {
        Connection cn = null;
        String url;
        String con;
        try {
            if (cn == null) {
                url = "jdbc:mysql://localhost:3306/project_sixth_semester";
                con = "com.mysql.jdbc.Driver";
                Class.forName(con);
                cn = DriverManager.getConnection(url, "root", "");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return cn;
    }
    
}
