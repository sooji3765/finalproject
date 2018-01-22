package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/alarm")
public class AlarmController {

	@RequestMapping(value = "/mainAlarm.do")
	public String mainAlarm() {
		
		
		return "/alarm/mainAlarm";
	}
		
}
