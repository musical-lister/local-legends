package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getSession().removeAttribute("validAttempt");
        request.getSession().setAttribute("loginMessage", "Please Login");
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = DaoFactory.getUsersDao().findByUsername(username);

        // checks if the username is already taken
        boolean userRegistered = DaoFactory.getUsersDao().isAlreadyRegisteredUsername(username);

        boolean validAttempt = (user != null) && (userRegistered) && (Password.check(password, user.getPassword()));

        // determines if login is successful
        if (!validAttempt) {
            request.setAttribute("stickyUser", username);
            request.getSession().setAttribute("validAttempt", false);
            request.getSession().setAttribute("errorMessageLogin", "Either username or password is incorrect. Please try again.");
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("validAttempt", true);
            request.getSession().setAttribute("user", user);
            response.sendRedirect("/profile");
        }
    }
}
