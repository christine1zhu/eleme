package com.example.eleme.service.model;

import java.util.List;

import com.example.eleme.pojo.User;

public interface IUserService {
	public User selectByUsername(String loginName);

	public int updateUserById(User record);
	
	public List<User> queryfriend(String my_id);
	
	public User findUserById(String Id);
}
