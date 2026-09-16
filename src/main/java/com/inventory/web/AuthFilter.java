package com.inventory.web;


import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebFilter(urlPatterns = {
"/dashboard",
"/products",
"/add-product",
"/edit-product",
"/delete-product",
"/low-stock"
})


public class AuthFilter implements Filter {



public void doFilter(
ServletRequest request,
ServletResponse response,
FilterChain chain)

throws IOException, ServletException {



HttpServletRequest req =
(HttpServletRequest)request;



HttpServletResponse res =
(HttpServletResponse)response;



HttpSession session =
req.getSession(false);



if(session == null ||
session.getAttribute("username")==null){


res.sendRedirect("index.html");


}
else{


chain.doFilter(request,response);


}



}


}