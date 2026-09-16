package com.inventory.web;


import java.io.IOException;

import com.inventoryy.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebServlet("/login")
public class LoginServlet extends HttpServlet {



private static final long serialVersionUID = 1L;



protected void doPost(
        HttpServletRequest request,
        HttpServletResponse response)

        throws ServletException, IOException {



String username =
request.getParameter("username");



String password =
request.getParameter("password");



UserDAO dao =
new UserDAO();



boolean valid =
dao.validateUser(username,password);



if(valid){



HttpSession session =
request.getSession();



session.setAttribute(
"username",
username
);



response.sendRedirect("dashboard");



}
else{


response.sendRedirect(
"index.html?error=true"
);


}



}



}