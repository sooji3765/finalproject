package com.project.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.user.User;
import com.project.user.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * home.do 는 테스트 용 입니다. 
	 */
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	// 로그인
	@RequestMapping(value = "/login.do")
	public String login() {
			
		return "login";
	}
	
	//메인
	@RequestMapping(value = "/main.do")
	public String main() {
		
		return "main";
	
	}
	 
	//로그인 하기전 체크
	@RequestMapping(value = "/logincheck.do")
	public String logincheck(String id, String nickname, String image,String type, HttpSession session) {
		System.out.println("===>> "+id);
		String redirectURI ="";
		
		session.setAttribute("memId", id);
		session.setAttribute("image", image);
		session.setAttribute("nickname", nickname);
		User user = new User();
		
		// DB에 저장된 USER 이면  main으로
		if(id.equals(userService.checkMember(id))){
			redirectURI = "redirect:main.do";	
		}else {
			System.out.println("===>> "+user);
			user.setM_id(id);
			user.setM_nickname(nickname);
			user.setM_logintype(type);
			user.setM_profile(image);
			user.setR_num("2");
			
			userService.insert(user);
			
			redirectURI ="redirect:main.do";
		}
		return redirectURI;
	}
	

}
