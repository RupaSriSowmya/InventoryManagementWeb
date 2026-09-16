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

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO dao = new ProductDAO();

        List<Product> products = dao.viewProducts();

        request.setAttribute("products", products);

        request.getRequestDispatcher("products.jsp")
               .forward(request, response);
    }
}