package com.inventory.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.inventoryy.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/search-product")
public class SearchProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String sql = "SELECT * FROM products WHERE id = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                request.setAttribute("id", rs.getInt("id"));
                request.setAttribute("name", rs.getString("name"));
                request.setAttribute("category", rs.getString("category"));
                request.setAttribute("price", rs.getDouble("price"));
                request.setAttribute("quantity", rs.getInt("quantity"));

            } else {

                request.setAttribute("message", "Product not found!");

            }

            rs.close();

            request.getRequestDispatcher("search-result.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

        }
    }
}