package com.codeup.adlister.controllers;

import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import static com.codeup.adlister.dao.DaoFactory.getAdsDao;

@WebServlet(name = "controllers.ViewAdServlet", urlPatterns = "/ads/show")
public class ViewAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("id")==null){
            response.sendRedirect("/ads");
        }
        long id = Long.parseLong(request.getParameter("id"));
        System.out.println(id);
        try {
            Ad singleAd = getAdsDao().singleAd(id);
            System.out.println(singleAd.getTitle());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        request.getRequestDispatcher("/WEB-INF/ads/adPage.jsp").forward(request, response);
    }
}
