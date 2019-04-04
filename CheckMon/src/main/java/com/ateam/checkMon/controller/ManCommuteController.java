package com.ateam.checkMon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManCommuteController {

	@RequestMapping("/commuteApplyAllList.do")
	public ModelAndView commuteApplyAllList() {
		ModelAndView mav=new ModelAndView();
		
		
		mav.setViewName("man/commute/commuteApplyAllList");
		return mav;
	}
	
}
