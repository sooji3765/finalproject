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
import com.project.refri.Refri;

import com.project.refri.RefriService;
import com.project.user.User;
import com.project.user.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;

	@Autowired
	private RefriService refriService;


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
		String redirectURI ="";
		String defaultImage = "/resource/img/profile.png";
		session.setAttribute("memId", id);
		session.setAttribute("image", image);
		session.setAttribute("nickname", nickname);
		User user = new User();
		
		// DB에 저장된 USER 이면  main으로
		if(id.equals(userService.checkMember(id))){
			System.out.println(image);
			
			
			redirectURI = "redirect:/main.do";	
		// 신규회원이면 냉장고 재료 선택 mainRef로
		}else {
			//DB에 새로운 회원 insert
			user.setM_id(id);
			if(image.equals("undefined")) {
				user.setM_profile(defaultImage);
			}

		

			user.setM_nickname(nickname);
			user.setM_logintype(type);
			user.setM_profile(image);

			userService.insert(user);

			refriService.create(id);
			refriService.create_seq(id);
			
			redirectURI ="redirect:/ref/mainRef.do";
		}
		
		user = userService.selectUser(id);
		List<Refri> refrige = (List<Refri>) refriService.selectAll((String)user.getM_ref());
		
		//보관일 계산
		String reg_date = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date now = new Date();
		String today = sdf.format(now);
		
		int todayYear = new Integer(today.substring(0, 4)); // 2017
		int todayMonth = new Integer(today.substring(4, 6)); // 11
		int todayDay = new Integer(today.substring(6, 8)); // 07
		int regYear = 0;
		int regMonth = 0;
		int regDay = 0;
		int count = 0;

		for (int i = 0; i < refrige.size(); i++) {
			// 1. 보관일 변경
			
			reg_date = sdf.format(refrige.get(i).getR_date());

			regYear = new Integer(reg_date.substring(0, 4));
			regMonth = new Integer(reg_date.substring(4, 6));
			regDay = new Integer(reg_date.substring(6, 8));

			// 등록일 == 오늘 : 1일째
			if (todayYear - regYear == 0 && todayMonth - regMonth == 0 && todayDay - regDay == 0) {
				count=0;
			} else { // 등록일이 오늘 이전 : 2,3,4..일째
				/* 년 검사 */
				if(todayYear - regYear > 0){
					count = count + 365;
				}
				if(todayMonth - regMonth > 0){
					/* 달 검사 - 홀수 달이면 30, 짝수 달이면 31 더하기 */
					if (regMonth % 2 == 1) {
						count = count + (30 * (todayMonth - regMonth));
					} else if (regMonth % 2 == 0) {
						count = count + (31 * (todayMonth - regMonth));
					}
				}
				/* 일 검사 */
				if (todayDay - regDay > 0) {
					count = count + (todayDay - regDay);
				}
			}
			refrige.get(i).setR_item_time(count+1);
			
			//DB에 저장
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("r_num", refrige.get(i).getR_num());
			map.put("r_item_time", refrige.get(i).getR_item_time());
			refriService.updateTime(map);
			
			count=0;
			
			
			// 2.신선도 변경
				
			// 냉장고에 있는 재료 가져오기
			// 해당 재료의 권장 보관일 (ingredients 테이블) 가져오기
			// 냉장고안에서의 실 보관일과 권장 보관일 비교
			// 권장 보관일 : 0 -> 실온 혹은 냉장으로 권장보관일 365일과 마찬가지.
		}
		
		return redirectURI;
	}
	

}
