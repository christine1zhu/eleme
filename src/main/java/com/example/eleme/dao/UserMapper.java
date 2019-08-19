package com.example.eleme.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.example.eleme.pojo.User;

public interface UserMapper {

	int deleteByPrimaryKey(String id);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(String id);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);

	User selectByUsername(@Param("Name") String Name);

	int updateById(User record);
	
	List<User> selectFriendUsers(@Param("my_id") String my_id);
	
}