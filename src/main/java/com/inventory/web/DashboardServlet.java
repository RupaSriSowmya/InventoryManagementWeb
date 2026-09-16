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
import jakarta.servlet.http.HttpSession;



@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {


    private static final long serialVersionUID = 1L;



    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {



        // checking session

        HttpSession session =
                request.getSession(false);



        if(session == null ||
           session.getAttribute("username") == null){


            response.sendRedirect("index.html");

            return;

        }



        ProductDAO dao =
                new ProductDAO();



        List<Product> products =
                dao.viewProducts();



        int totalProducts =
                products.size();



        int inStock = 0;

        int lowStock = 0;



        for(Product product : products){


            if(product.getQuantity() <= 5){

                lowStock++;

            }
            else{

                inStock++;

            }

        }



        request.setAttribute(
                "products",
                products
        );



        request.setAttribute(
                "totalProducts",
                totalProducts
        );



        request.setAttribute(
                "inStock",
                inStock
        );



        request.setAttribute(
                "lowStock",
                lowStock
        );



        request.getRequestDispatcher(
                "dashboard.jsp"
        )
        .forward(request,response);


    }



}