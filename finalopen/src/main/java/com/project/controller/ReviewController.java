package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.review.Review;
import com.project.review.ReviewService;



@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	//리뷰 목록
	@RequestMapping(value="/reviewMain.do")
	public ModelAndView reviewMain() {
		List<Review> review = (List<Review>) reviewService.selectAll();

		ModelAndView view = new ModelAndView();
		view.setViewName("/review/reviewMain");
		view.addObject("review",review);
		
		return view;
	}
	
	//리뷰 하나
	@RequestMapping(value="/reviewOne.do")
	public ModelAndView reviewOne(String title) {
		
		ModelAndView view = new ModelAndView();
		Review review = new Review();
		view.setViewName("/review/reviewOne");
		
		reviewService.selectOne(title);
		
		view.addObject(review);
		
		return view;
	}
	
	
	@RequestMapping(value="/reviewForm.do")
	public String reviewForm() {
		
		return "/review/reviewForm";
	}
	
	@RequestMapping(value="/reviewPro.do",method = RequestMethod.POST)
	public String reviewPro(HttpSession session, String title, String content, String image, String url,String password ) {
		
		Review review = new Review();
		String id = (String) session.getAttribute("memId");
		
		review.setM_id(id);
		review.setRe_title(title);
		review.setRe_content(content);
		review.setRe_image(image);
		review.setRe_blog_url(url);
		review.setRe_password(password);
		
		reviewService.insertReview(review);
		
		
		return "redicit:reviewMain.do";
	}
	
	@RequestMapping(value="/reviewCheckPw.do")
	public String reviewCheckPw() {
		return "/review/reviewChekPw";
	}
	
	
	@RequestMapping(value="/reviewModify.do")
	public String reviewModify() {
		
		return "/review/reviewModify";
	}
	
	
	
}
