package com.codeup.adlister.models;

public class Category {
    private long catId;
    private String name;

    public Category(long catId, String Category){
        this.catId = catId;
        this.name = Category;
    }

    public String getName() {
        return name;
    }

    public long getCatId() {
        return catId;
    }

    public void setName(String Category) {
        this.name = Category;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }
}
