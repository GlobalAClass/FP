package com.ateam.checkMon.controller;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.checkMon.hourTemplate.model.HourTemplateDAO;
import com.ateam.checkMon.hourTemplate.model.HourTemplateDTO;
import com.ateam.checkMon.schedule.model.ScheduleDAO;
import com.ateam.checkMon.schedule.model.ScheduleDTO;

@Controller
public class ManScheduleController {
	
	@Autowired
	private HourTemplateDAO hdao;
	
	@Autowired
	private ScheduleDAO sdao;
	
	/**근무시간 템플릿 관리 관련*/
	
	//근무시간 템플릿 관리 페이지 이동
	@RequestMapping(value="/hourTemplateList.do")
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
	
	//근무 시간 템플릿 리스트 모두 가져오기
	@RequestMapping(value="/hourTemplateList.do",method=RequestMethod.POST)
	public ModelAndView getHourTemplateList() {
		
		List<HourTemplateDTO> list = hdao.getTemplateList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("cmjson");
		
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
		
		int res = hdao.delTemplate(hour_template_ix);
		
		String msg = res>0?"":"템플릿 삭제에 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("loc","hourTemplateList.do");
		mav.setViewName("cmjson");
		
		return mav;
	}
	
	/*---------------------------------------------------------------------*/
	/**스케줄 관리 관련*/
	
	//스케줄 페이지 이동
	@RequestMapping("/scheduleMonthList.do")
	public String goScheduleMonthList() {
		return "man/schedule/scheduleMonthList";
	}
	
	//스케줄 목록 가져오는 메소드
	@RequestMapping(value="/getScheduleAll.do",method=RequestMethod.GET)
	public ModelAndView getScheduleAll(
				@RequestParam(value="year")String year,
				@RequestParam(value="month")String month
			) {
		
		List<HashMap<String, Object>> list = sdao.getSchedule(year,month);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("cmjson");
		
		return mav;
	}
	
	//스케줄 수정하기
	@RequestMapping(value="/modSchedule.do",method=RequestMethod.POST)
	public ModelAndView modSchedule(
				@RequestParam(value="schedule_ix")int schedule_ix,
				@RequestParam(value="s_start_time")String s_start_time,
				@RequestParam(value="s_end_time")String s_end_time
			) {
		
		int res = sdao.modSchedule(schedule_ix,s_start_time,s_end_time);
		String msg = res>0?"":"스케줄 수정 실패";
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("loc","scheduleMonthList.do");
		mav.setViewName("cmjson");
		
		return mav;
	}
	
	//스케줄 삭제하기
	@RequestMapping(value="/delSchedule.do",method=RequestMethod.POST)
	public ModelAndView delSchedule(
				@RequestParam(value="schedule_ix")int schedule_ix
			) {
		
		int res = sdao.delSchedule(schedule_ix);
		String msg = res>0?"":"스케줄 삭제 실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("loc","scheduleMonthList.do");
		mav.setViewName("cmjson");
		
		return mav;
		
	}
	
	@RequestMapping(value="/addSchedule.do",method=RequestMethod.POST)
	public ModelAndView addSchedule(
				@RequestParam(value="selectTemp")String selectTemp,
				@RequestParam(value="selectEmp")String selectEmp,
				@RequestParam(value="selectDate")String selectDate
			) {
		
		String temp[] = selectTemp.split(",");
		String emp[] = selectEmp.split(",");
		String date[] = selectDate.split(",");
		
		String s_start_time=temp[0];
		String s_end_time=temp[1];
		
		int res=0;
		
		for(int i=0;i<emp.length;i++) {
			for(int j=0;j<date.length;j++) {
				int emp_ix = Integer.parseInt(emp[i]);
				String s_year = date[j].substring(0, 4);
				String s_month = date[j].substring(5, 7);
				String s_day = date[j].substring(8, 10);
				
				ScheduleDTO dto = new ScheduleDTO(emp_ix, s_year, s_month, s_day, s_start_time, s_end_time);
				res = sdao.addSchedule(dto);
			}
		}
		
		String msg = res<0?"스케줄 추가 실패":"";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("cmjson");
		
		return null;
	}
	
	/*---------------------------------------------------------------------*/
	/**휴가 요청 관련*/
	
	//휴가 요청 페이지 이동
	
}
