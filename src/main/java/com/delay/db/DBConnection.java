
package com.delay.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/delay_analysis_system",
                "root",
                "8985844247@");

            System.out.println("Database Connected Successfully");

        } catch(Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}
