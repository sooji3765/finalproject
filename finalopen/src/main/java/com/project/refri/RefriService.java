package com.project.refri;

import java.util.HashMap;

public interface RefriService {
	public void create(String id);
	public void create_seq(String id);
	public String selectR_num(String id, String num);
	public void insertIngre(HashMap<String ,Object> map);
	
	
}
