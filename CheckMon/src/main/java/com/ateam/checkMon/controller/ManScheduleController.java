package com.ateam.checkMon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManScheduleController {
	
	/**근무시간 템플릿 관리 관련*/
	
	//근무시간 템플릿 관리 페이지 이동
	@RequestMapping("/hourTemplateList.do")
	public String goHourTemplateList() {
		return "man/schedule/hourTemplateList";
	}
	
	
	/**스케줄 관리 관련*/
	
	//스케줄 페이지 이동
	@RequestMapping("/scheduleMonthList.do")
	public String goScheduleMonthList() {
		return "man/schedule/scheduleMonthList";
	}
	
	
	
	/**휴가 요청 관련*/
	
	//휴가 요청 페이지 이동
	
}
