package com.example.eleme.dao;

import java.util.List;

import com.example.eleme.pojo.Test;

public interface TestMapper {
	
	int insert(Test record);

	int insertSelective(Test record);
	
    List<Test> selectAll();
}