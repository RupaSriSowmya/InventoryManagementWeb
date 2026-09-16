package com.inventoryy;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/inventory_db";

    private static final String USERNAME = "root";

    private static final String PASSWORD =
            System.getenv("DB_PASSWORD");

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(
                    URL,
                    USERNAME,
                    PASSWORD
            );

        } catch (Exception e) {

            System.out.println(
                    "Database connection failed!"
            );

            System.out.println(
                    "Error: " + e.getMessage()
            );

            return null;
        }
    }
}