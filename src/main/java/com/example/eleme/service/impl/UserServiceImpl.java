package com.example.eleme.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.example.eleme.dao.UserMapper;
import com.example.eleme.pojo.User;
import com.example.eleme.service.model.IUserService;

@Service
public class UserServiceImpl implements IUserService {
	@Resource
	private UserMapper userMapper;
	
	@Override
	public User selectByUsername(String Name){
		return this.userMapper.selectByUsername(Name);
	}
	@Override
	public int updateUserById(User record){
		return this.userMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<User> queryfriend(String my_id) {
		return this.userMapper.selectFriendUsers(my_id);
	}
	@Override
	public User findUserById(String Id) {
		return this.userMapper.selectByPrimaryKey(Id);
	}}

