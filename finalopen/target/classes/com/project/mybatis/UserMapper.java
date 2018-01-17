package com.project.mybatis;

import com.project.user.User;

public interface UserMapper {
	
	public void insert(User user);
	public String checkMember(String id);
	public User selectUser(String id);
	public void modifyUser(User user);

}
