package com.inventory.web;

import java.io.IOException;
import java.util.List;

import com.inventoryy.Product;
import com.inventoryy.ProductDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete-product")
public class DeleteProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Open Delete Confirmation Page
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(
                request.getParameter("id")
        );

        ProductDAO dao = new ProductDAO();

        List<Product> products = dao.viewProducts();

        for (Product product : products) {

            if (product.getId() == id) {

                request.setAttribute(
                        "product",
                        product
                );

                request.getRequestDispatcher(
                        "delete-product.jsp"
                ).forward(request, response);

                return;
            }
        }

        // Product not found
        response.sendRedirect("products");
    }


    // Delete Product after confirmation
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(
                request.getParameter("id")
        );

        ProductDAO dao = new ProductDAO();

        dao.deleteProduct(id);

        response.sendRedirect("products");
    }
}