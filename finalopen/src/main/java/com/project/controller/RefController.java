package com.project.controller;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/ref/*")
public class RefController {
	@Autowired
	//private SqlMapClientTemplate sqlMap = null;
	
	@RequestMapping("mainRef.do")
	public String mainRef() {
		return "/ref/mainRef";
	}
	@RequestMapping("newRef.do")
	public String newRef() {
		return "/ref/newRef";
	}
	@RequestMapping("result.do")
	public String result() {
		return "/ref/result";
	}

	


}
