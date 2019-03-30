package com.ateam.checkMon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManEmpRunController {

	//직원 관리 페이지 - (직원승인, 직원목록, 직원검색)
	@RequestMapping("/empReqRunList.do")
	public String checkQR() {
		return "man/empRun/empReqRunList";
	}
	
	
	
}
