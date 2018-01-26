package com.project.user;

public interface UserService {
	
	public void insert(User user);
	public String checkMember(String id);
	public User selectUser(String id);
	public void modifyUser(User user);
	public String checkRef(String id);
}
