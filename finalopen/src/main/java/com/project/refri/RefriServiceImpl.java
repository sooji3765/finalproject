package com.project.refri;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mybatis.RefriMapper;
@Service
public class RefriServiceImpl implements RefriService{

	@Autowired
	private RefriMapper refriMapper;

	@Override
	public void create(String id) {
		refriMapper.create(id);
		
	}
	@Override
	public void create_seq(String id) {
		refriMapper.create_seq(id);
		
	}
	
	@Override
	public String selectR_num(String id, String num) {
		return refriMapper.selectR_num(id, num);
	}

	@Override
	public void insertIngre(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		refriMapper.insertIngre(map);
	}

	
	
	

}
