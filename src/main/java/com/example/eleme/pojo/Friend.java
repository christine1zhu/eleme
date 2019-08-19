package com.example.eleme.pojo;

public class Friend {
    private String id;

    private String my_friend_id;

    private String my_user_id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getMy_friend_id() {
        return my_friend_id;
    }

    public void setMy_friend_id(String my_friend_id) {
        this.my_friend_id = my_friend_id == null ? null : my_friend_id.trim();
    }

    public String getMy_user_id() {
        return my_user_id;
    }

    public void setMy_user_id(String my_user_id) {
        this.my_user_id = my_user_id == null ? null : my_user_id.trim();
    }
}