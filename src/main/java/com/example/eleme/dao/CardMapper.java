package com.example.eleme.dao;

import java.util.List;

import com.example.eleme.pojo.Card;

public interface CardMapper {
    int insert(Card record);

    int insertSelective(Card record);
    
    List<Card> selectall();
}