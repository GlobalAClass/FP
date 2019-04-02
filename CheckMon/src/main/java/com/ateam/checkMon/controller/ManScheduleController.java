package com.ateam.checkMon.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.checkMon.hourTemplate.model.HourTemplateDAO;
import com.ateam.checkMon.hourTemplate.model.HourTemplateDTO;

@Controller
public class ManScheduleController {
	
	@Autowired
	private HourTemplateDAO hdao;
	
	/**근무시간 템플릿 관리 관련*/
	
	//근무시간 템플릿 관리 페이지 이동
	@RequestMapping("/hourTemplateList.do")
	public ModelAndView goHourTemplateList(
			@RequestParam(value="cp",defaultValue="1")int cp
			) {
		
		int totalcnt = hdao.templateListSize();
		int listsize = 5;
		int pagesize = 5;
		
		List<HourTemplateDTO> list = hdao.getTemplateList(listsize, cp);
		
		String paging = com.ateam.checkMon.page.PageModule.getMakePage("hourTemplateList.do", totalcnt, listsize, pagesize, cp);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list",list);
		mav.addObject("paging",paging);
		mav.setViewName("man/schedule/hourTemplateList");
		
		return mav;
	}
	
	//근무 시간 템플릿 추가하기
	@RequestMapping(value="hourTemplateAdd.do",method=RequestMethod.POST)
	public ModelAndView addTemplate(HourTemplateDTO hdto) {
		int res = hdao.addTemplate(hdto);
		
		String msg = res>0?"":"템플릿 추가에 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("loc","hourTemplateList.do");
		mav.setViewName("cmjson");
		
		return mav;
	}
	
	//근무 시간 템플릿 삭제
	@RequestMapping(value="hourTemplateDel.do",method=RequestMethod.POST)
	public ModelAndView delTemplate(
			@RequestParam(value="hour_template_ix")int hour_template_ix) {
		
		//System.out.println("cont1 ix="+ix);
		int res = hdao.delTemplate(hour_template_ix);
		
		String msg = res>0?"":"템플릿 삭제에 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("loc","hourTemplateList.do");
		mav.setViewName("cmjson");
		
		return mav;
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
