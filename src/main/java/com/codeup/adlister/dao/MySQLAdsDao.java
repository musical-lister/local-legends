package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUsername(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public List<Ad> filterByUser(long usr) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads where user_id = " + usr);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

    // Ads
    public List<Ad> searchAds (String searchTerm) {
        String qry = "SELECT * FROM ads WHERE title LIKE \'%" + searchTerm + "%\'";
        List<Ad> searchResults;
        try {
            PreparedStatement stmt = connection.prepareStatement(qry);
            ResultSet rs = stmt.executeQuery();
            searchResults = createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Could not find any ads with \"" + searchTerm + "\" in the title.", e);
        }
        return searchResults;
    }

    @Override
    public Ad singleAd(long adId) throws SQLException {
        String qry = "SELECT * FROM ads WHERE id = ?";
        PreparedStatement stmt = connection.prepareStatement(qry);
        stmt.setLong(1, adId);
        ResultSet rs = stmt.executeQuery();
        rs.next();
        return extractAd(rs);
    }

    @Override
    public List<Category> fetchCategories() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM categories");
            ResultSet rs = stmt.executeQuery();
            return listCats(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long edit(Ad ad) {
        return null;
    }

    private List<Category> listCats(ResultSet rs) throws SQLException {
        List<Category> cats = new ArrayList<>();
        while (rs.next()) {
            cats.add(extractCategory(rs));
        }
        return cats;
    }


    private Category extractCategory(ResultSet rs) throws SQLException {
        return new Category(
                rs.getLong("id"),
                rs.getString("category")
        );
    }


    @Override
    public void deleteAd (long id) throws SQLException {
        String deleteQuery = "DELETE FROM ads WHERE id = ?";
        PreparedStatement stmt = connection.prepareStatement(deleteQuery);
        stmt.setLong(1, id);
        stmt.executeUpdate();
    }
}
