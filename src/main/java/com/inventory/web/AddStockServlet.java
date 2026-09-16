package com.inventory.web;

import java.io.IOException;

import com.inventoryy.ProductDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/add-stock")
public class AddStockServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        int amount = Integer.parseInt(request.getParameter("amount"));

        ProductDAO dao = new ProductDAO();

        dao.addStock(id, amount);

        response.sendRedirect("products");
    }
}