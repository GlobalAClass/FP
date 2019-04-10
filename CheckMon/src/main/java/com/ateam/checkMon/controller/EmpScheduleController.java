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

import com.ateam.checkMon.member.model.EmpDTO;
import com.ateam.checkMon.schedule.model.ScheduleDAO;
import com.ateam.checkMon.schedule.model.ScheduleDTO;
import com.ateam.checkMon.substitute.model.SubstituteDAO;
import com.ateam.checkMon.vacation.model.VacationDAO;

@Controller
public class EmpScheduleController {
	
	@Autowired
	private ScheduleDAO sdao;
	
	@Autowired
	private SubstituteDAO tdao;
	
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
		
		List<HashMap<String, Object>> list_s = tdao.getSubstituteList(emp_ix);
				
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("list_s",list_s);
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
		
		HashMap<String, String> map = vdao.getVacationDate(schedule_ix);
		String v_date = map.get("S_YEAR")+"년 "+map.get("S_MONTH")+"월 "+map.get("S_DAY")+"일";
		String v_time = map.get("S_START_TIME")+" - "+map.get("S_END_TIME");
		
		int res = vdao.applyVacation(schedule_ix,emp_ix,v_reason_main,v_reason_detail,v_date,v_time);
	
		String msg = res<0?"휴가 요청 실패":"";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("cmjson");
		
		return mav;
	}
	
	//대리근무 요청 승인하는 메소드
	@RequestMapping(value="/agreeSubstitute.do",method=RequestMethod.POST)
	public ModelAndView agreeSubstitute(
				@RequestParam(value="substitute_req_ix")int substitute_req_ix,
				@RequestParam(value="sub_date")String sub_date,
				@RequestParam(value="sub_time")String sub_time,
				HttpSession session
			) {
		
		int emp_ix = (Integer)session.getAttribute("emp_ix");
		
		//1. 승인한 대리 근무 요청 처리 상태 변경 - 승인
		int res1 = tdao.updateSubReq(substitute_req_ix);
		
		//2. 해당 스케줄을 본인 스케줄에 추가하기
		int man_ix=tdao.getManSubIX(emp_ix);
		String s_year = sub_date.substring(0,4);
		String s_month = sub_date.substring(5,7);
		String s_day = sub_date.substring(8,10);
		String s_start_time = sub_time.substring(0, 5);
		String s_end_time = sub_time.substring(8,13);
		
		ScheduleDTO dto = new ScheduleDTO(emp_ix, man_ix, s_year, s_month, s_day, s_start_time, s_end_time);
		
		int res2 = tdao.insertSubSchedule(dto);
		
		//3. 휴가테이블 정보 변경 - 대리 근무자 인덱스, 휴가 처리 진행 상황
		int res3 = tdao.updateVacationInfo(emp_ix,substitute_req_ix);
				
		//4. 승인한 대리근무와 동일한 대리근무 신청 가지고 있는 관계 테이블 삭제
		int res4 = tdao.deleteSubEmps(substitute_req_ix,emp_ix);
		
		//5. 기존 근무자의 스케줄 제거
		int res5 = tdao.deleteEmpSchedule(substitute_req_ix);
		
		String msg = res1<0 && res2<0 && res3<0 && res4<0 && res5<0?"대리 근무 승인 실패":"";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("cmjson");
		
		return mav;
	}
	
	//대리근무 요청 거절하는 메소드
	
	/*---------------------------------------------------------------------*/
	//휴가 신청 목록 리스트 페이지에서 사용되는 메소드
	//휴가 신청 목록 가져오는 메소드
	@RequestMapping(value="/vacationListEmp.do",method=RequestMethod.GET)
	public ModelAndView getScheduleAll(
			@RequestParam(value="cp",defaultValue="1")int cp,
				HttpSession session
			) {
		
		int emp_ix = (Integer)session.getAttribute("emp_ix");
		
		int totalcnt = vdao.vacationListEmpSize(emp_ix);
		int listsize = 5;
		int pagesize = 5;
		
		List<HashMap<String,Object>> list = vdao.getVacationListEmp(listsize, cp, emp_ix);
		
		String paging = com.ateam.checkMon.page.PageModule.getMakePage("vacationListEmp.do", totalcnt, listsize, pagesize, cp);
				
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("paging",paging);
		mav.setViewName("emp/schedule/vacationList");
		
		return mav;
	}
	
	//휴가 날짜에 대리 근무 해준 근무자 이름, 전화번호 가져오는 메소드
	@RequestMapping(value="/getSubstituteEmp.do",method=RequestMethod.GET)
	public ModelAndView getSubstituteEmp(
			@RequestParam(value="emp_ix")int emp_ix
			) {
		
		HashMap<String, String> map = vdao.getSubstituteEmp(emp_ix);
		
		String name = map.get("E_NAME");
		String tel = map.get("E_TEL");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("name",name);
		mav.addObject("tel",tel);
		mav.setViewName("cmjson");
		
		return mav;
	}

}
