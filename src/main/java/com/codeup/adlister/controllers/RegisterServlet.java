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

        // validate input
        boolean inputHasErrors = DaoFactory.getUsersDao().isAlreadyRegisteredUsername(username)
                || DaoFactory.getUsersDao().isAlreadyRegisteredEmail(email)
                || (!password.equals(passwordConfirmation));

        // displays different error messages if inputHasErrors
        if (DaoFactory.getUsersDao().isAlreadyRegisteredUsername(username)) {
            request.getSession().setAttribute("errorMessageUsername", "- Username \'" + username + "\' is already taken.");
        }
        if (DaoFactory.getUsersDao().isAlreadyRegisteredEmail(email)) {
            request.getSession().setAttribute("errorMessageEmail", "- Email address \'" + email + "\' is already registered with an active account.");
        }
        if ((!password.equals(passwordConfirmation))) {
                    request.getSession().setAttribute("errorMessagePassword", "- Passwords do not match.");
        }
        if (inputHasErrors) {
            request.getSession().setAttribute("inputHasErrors", true);
            request.getSession().setAttribute("stickyUser", username);
            request.getSession().setAttribute("stickyEmail", email);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        }
        else {
            request.getSession().setAttribute("inputHasErrors", false);
            User user = new User(username, email, hashPassword);
            DaoFactory.getUsersDao().insert(user);
            request.getSession().setAttribute("loginMessage", "Registration successful! \n Please login to your new account");
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
    }
}
