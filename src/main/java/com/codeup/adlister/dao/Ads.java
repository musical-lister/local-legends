package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.sql.SQLException;
import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    // lists a filtered ad
    List<Ad> filterByUser(long usr);
    // search function for ads
    List<Ad> searchAds(String searchTerm);

    Ad singleAd (long adId) throws SQLException;
}
