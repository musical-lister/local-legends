package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "controllers.DeleteAdServlet", urlPatterns = "/ads/delete")
public class DeleteAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long deleteID = Long.parseLong(request.getParameter("AdID"));
        System.out.println(deleteID);
        try {
            DaoFactory.getAdsDao().deleteAd(deleteID);
            response.sendRedirect("/profile");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
