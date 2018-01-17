package com.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.user.User;
import com.project.user.UserService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/myPageMain.do")
	public ModelAndView myPageMain(HttpServletRequest request, User user) {
		ModelAndView view = new ModelAndView();
		
		view.setViewName("/myPageMain");
		String id = (String) request.getAttribute("memId");
		user = userService.selectUser(id);
		
		view.addObject(user);
		
		return view;
	}
	
	@RequestMapping(value="/modify.do")
	public String modify() {
		return "modify";
	}
	
	@RequestMapping(value="/modifyPro.do")
	public String modifyPro() {
		
		return "modifyPro";
	}
	
	@RequestMapping(value="/myRef.do")
	public String myRef() {
		
		
		return "myRef";
	}
	
	@RequestMapping(value="/myReview.do")
	public String myReview() {
		
		return "myReview";
	}
	
	
}
