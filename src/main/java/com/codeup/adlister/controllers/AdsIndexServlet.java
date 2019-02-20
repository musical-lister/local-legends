package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String searchString = request.getParameter("search");

        if (searchString==null || searchString.isEmpty()) {
        request.setAttribute("ads", DaoFactory.getAdsDao().all());
        request.getSession().setAttribute("searchMessage", "Viewing all ads");
        } else {
            request.setAttribute("ads", DaoFactory.getAdsDao().searchAds(searchString));
            request.getSession().setAttribute("searchMessage", "Searching ads for \'" + searchString + "\'");
            if (DaoFactory.getAdsDao().searchAds(searchString).isEmpty()) {
                request.getSession().setAttribute("searchMessage", "No matching results for \'"+searchString+"\'");
            }
        }
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }
}
