package com.codeup.adlister.controllers;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.LogoutServlet", urlPatterns = "/logout")
public class LogoutServlet extends HttpServlet {
    public static boolean loggedIn = false;
    public static boolean loggedOut = true;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().removeAttribute("user");
        request.getSession().invalidate();
        loggedOut = true;
        loggedIn = false;
        response.sendRedirect("/login");
    }
}
