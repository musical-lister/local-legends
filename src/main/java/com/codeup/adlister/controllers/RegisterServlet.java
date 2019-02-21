package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import jdk.nashorn.internal.ir.RuntimeNode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("inputHasErrors");
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        String hashPassword = Password.hash(password);
        boolean userAlreadyExists = DaoFactory.getUsersDao().isAlreadyRegisteredUsername(username);
        boolean emailAlreadyRegistered = DaoFactory.getUsersDao().isAlreadyRegisteredEmail(email);
        boolean passwordsMatch = password.equals(passwordConfirmation);

        // "if" statements are independent from one another so that each error message displays individually
        if (userAlreadyExists) {request.setAttribute("errorMessageUsername", "Username \'" + username + "\' is already taken.");}
        if (emailAlreadyRegistered) {request.setAttribute("errorMessageEmail", "Email address \'" + email + "\' is already registered with an active account.");}
        if (!passwordsMatch) {request.setAttribute("errorMessagePassword", "Passwords do not match.");}

        // validate input
        boolean inputHasErrors = userAlreadyExists || emailAlreadyRegistered || !passwordsMatch;

        if (inputHasErrors) {
            request.setAttribute("stickyUser", username);
            request.setAttribute("stickyEmail", email);
            request.getSession().setAttribute("inputHasErrors", true);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        } else {
            User user = new User(username, email, hashPassword);
            DaoFactory.getUsersDao().insert(user);
            request.getSession().setAttribute("inputHasErrors", false);
            request.getSession().setAttribute("loginMessage", "Registration Successful! Please login to your new account.");
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
    }
}
