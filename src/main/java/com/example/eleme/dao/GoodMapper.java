package com.example.eleme.dao;

import java.util.List;

import com.example.eleme.pojo.Good;

public interface GoodMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Good record);

	int insertSelective(Good record);

	Good selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Good record);

	int updateByPrimaryKey(Good record);

    List<Good> selectByshopId(String shopid);
}