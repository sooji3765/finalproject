package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/alarm")
public class BookMarkController {

	@RequestMapping(value = "/bookmarkMain.do")
	public String bookmarkMain() {
		
		return "/bookmark/bookmarkMain";
	}
}
