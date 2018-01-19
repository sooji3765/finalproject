package com.project.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mybatis.UserMapper;

@Service
public class UserServicsImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public void insert(User user) {
		// TODO Auto-generated method stub
		userMapper.insert(user);
	}

	@Override
	public String checkMember(String id) {
		// TODO Auto-generated method stub
		return userMapper.checkMember(id);
	}

	@Override
	public User selectUser(String id) {
		// TODO Auto-generated method stub
		return userMapper.selectUser(id);
	}

	@Override
	public void modifyUser(User user) {
		
		userMapper.modifyUser(user);		
	}

}
