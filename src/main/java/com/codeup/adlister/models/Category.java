package com.codeup.adlister.models;

public class Category {
    private int catId;
    private int adId;

    public Category(int adId, int catId){
        this.catId = catId;
        this.adId = adId;
    }

    public int getAdId() {
        return adId;
    }

    public int getCatId() {
        return catId;
    }

    public void setAdId(int adId) {
        this.adId = adId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }
}
