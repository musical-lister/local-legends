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

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        String hashPassword = Password.hash(password);




        // boolean check1 = Password.check(password, hashPassword);
        // boolean check2 = Password.check(passwordConfirmation, hashPasswordConfirmation);
        // validate input
        boolean inputHasErrors = username.isEmpty()
                || email.isEmpty()
                || password.isEmpty()
                || (!password.equals(passwordConfirmation))
                || DaoFactory.getUsersDao().isAlreadyRegistered(email);


        if (inputHasErrors) {
            request.getSession().setAttribute("errorMessage", "There was an error with your credentials.");
            request.getSession().setAttribute("inputHasErrors", true);
            request.getSession().setAttribute("stickyUser", username);
            request.getSession().setAttribute("stickyEmail", email);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        }
        else {
            request.getSession().setAttribute("inputHasErrors", false);
            User user = new User(username, email, hashPassword);
            DaoFactory.getUsersDao().insert(user);
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
    }
}
