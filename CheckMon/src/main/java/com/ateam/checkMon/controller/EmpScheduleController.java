package com.ateam.checkMon.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.checkMon.schedule.model.ScheduleDAO;
import com.ateam.checkMon.schedule.model.ScheduleDTO;
import com.ateam.checkMon.vacation.model.VacationDAO;

@Controller
public class EmpScheduleController {
	
	@Autowired
	private ScheduleDAO sdao;
	
	@Autowired
	private VacationDAO vdao;
	
	@RequestMapping(value="/scheduleList.do")
	public String goScheduleList() {
		return "emp/schedule/scheduleList";
	}
	
	//본인 스케줄 목록 가져오는 메소드
	@RequestMapping(value="/getScheduleEmp.do",method=RequestMethod.POST)
	public ModelAndView getScheduleAll(
				@RequestParam(value="year")String year,
				@RequestParam(value="month")String month,
				@RequestParam(value="date")String date,
				HttpSession session
			) {
		
		int emp_ix = (Integer)session.getAttribute("emp_ix");
		
		List<ScheduleDTO> list = sdao.getScheduleEmp(emp_ix, year, month, date);
				
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("cmjson");
		
		return mav;
	}
	
	//휴가 신청하는 메소드
	@RequestMapping(value="/applyVacation.do",method=RequestMethod.POST)
	public ModelAndView applyVacation(
				@RequestParam(value="schedule_ix")int schedule_ix,
				@RequestParam(value="v_reason_main")String v_reason_main,
				@RequestParam(value="v_reason_detail")String v_reason_detail,
				HttpSession session
			) {
		
		int emp_ix = (Integer)session.getAttribute("emp_ix");
		
		int res = vdao.applyVacation(schedule_ix,emp_ix,v_reason_main,v_reason_detail);
	
		String msg = res<0?"휴가 요청 실패":"";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("cmjson");
		
		return mav;
	}

}
