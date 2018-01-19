package com.project.refri;

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

}
