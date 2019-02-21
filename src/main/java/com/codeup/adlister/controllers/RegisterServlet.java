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
        request.getSession().removeAttribute("inputHasErrors");
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        String hashPassword = Password.hash(password);


        // displays individual error messages if inputHasErrors
        // if statements are independent from each other so each message can be displayed per error type
        if (DaoFactory.getUsersDao().isAlreadyRegisteredUsername(username)) {
            request.setAttribute("errorMessageUsername", "Username \'" + username + "\' is already taken.");
        }
        if (DaoFactory.getUsersDao().isAlreadyRegisteredEmail(email)) {
            request.setAttribute("errorMessageEmail", "Email address \'" + email + "\' is already registered with an active account.");
        }
        if ((!password.equals(passwordConfirmation))) {
                    request.setAttribute("errorMessagePassword", "Passwords do not match.");
        }

        // validate input
        boolean inputHasErrors = DaoFactory.getUsersDao().isAlreadyRegisteredUsername(username)
                || DaoFactory.getUsersDao().isAlreadyRegisteredEmail(email)
                || (!password.equals(passwordConfirmation));

        if (inputHasErrors) {
            request.setAttribute("stickyUser", username);
            request.setAttribute("stickyEmail", email);
            request.getSession().setAttribute("inputHasErrors", true);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        }
        else {
            User user = new User(username, email, hashPassword);
            DaoFactory.getUsersDao().insert(user);
            request.getSession().setAttribute("inputHasErrors", false);
            request.removeAttribute("validAttempt");
            request.getSession().setAttribute("loginMessage", "Registration Successful! Please login to your new account.");
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
    }
}
