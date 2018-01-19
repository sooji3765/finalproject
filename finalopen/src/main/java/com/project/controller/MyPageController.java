package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public ModelAndView myPageMain(HttpSession session) {
		ModelAndView view = new ModelAndView();
		User user = new User();
		view.setViewName("/myPage/myPageMain");
	
		String id = (String) session.getAttribute("memId");
		System.out.println(id);
		user = userService.selectUser(id);
		
		view.addObject(user);
		
		return view;
	}
	
	@RequestMapping(value="/modify.do")
	public String modify(String rnum) {
		
		return "/myPage/modify";
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
