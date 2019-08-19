package com.example.eleme.dao;

import com.example.eleme.pojo.Friend;

public interface FriendMapper {
    int deleteByPrimaryKey(String id);

    int insert(Friend record);

    int insertSelective(Friend record);

    Friend selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Friend record);

    int updateByPrimaryKey(Friend record);
    
   
}