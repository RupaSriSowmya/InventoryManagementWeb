package com.inventory.web;

import java.io.IOException;

import com.inventoryy.Product;
import com.inventoryy.ProductDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/edit-product")
public class EditProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ProductDAO dao = new ProductDAO();

        // Get all products
        for (Product product : dao.viewProducts()) {

            if (product.getId() == id) {

                request.setAttribute("product", product);

                request.getRequestDispatcher("edit-product.jsp")
                       .forward(request, response);

                return;
            }
        }

        response.sendRedirect("products");
    }

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Product product = new Product(
                id,
                name,
                category,
                price,
                quantity
        );

        ProductDAO dao = new ProductDAO();

        dao.updateProduct(product);

        response.sendRedirect("products");
    }
}