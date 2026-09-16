package com.inventory.web;

import java.io.IOException;

import com.inventoryy.Product;
import com.inventoryy.ProductDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/add-product")
public class AddProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Product product = new Product();

        product.setName(name);
        product.setCategory(category);
        product.setPrice(price);
        product.setQuantity(quantity);

        ProductDAO dao = new ProductDAO();

        dao.addProduct(product);

        response.sendRedirect("products");
    }
}