package com.ateam.checkMon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

	@RequestMapping("/index.do")
	public ModelAndView index(
			@CookieValue(value="E_RPWD",required=false)String E_RPWD,
			@CookieValue(value="M_RPWD",required=false)String M_RPWD
			){
		ModelAndView mav = new ModelAndView();
	
		mav.setViewName("index");
		return mav;
	}
}
