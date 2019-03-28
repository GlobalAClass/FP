package com.ateam.checkMon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManController {

	@RequestMapping("/manHome.do")
	public String goEmp() {
		return "man/home";
	}
}
