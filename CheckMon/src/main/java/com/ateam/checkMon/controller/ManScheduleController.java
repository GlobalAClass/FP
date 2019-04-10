package com.ateam.checkMon.controller;


import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.checkMon.hourTemplate.model.HourTemplateDAO;
import com.ateam.checkMon.hourTemplate.model.HourTemplateDTO;
import com.ateam.checkMon.manEmpRun.model.RunListDTO;
import com.ateam.checkMon.member.model.EmpDTO;
import com.ateam.checkMon.schedule.model.ScheduleDAO;
import com.ateam.checkMon.schedule.model.ScheduleDTO;
import com.ateam.checkMon.vacation.model.VacationDAO;

@Controller
public class ManScheduleController {
	
	@Autowired
	private HourTemplateDAO hdao;
	
	@Autowired
	private ScheduleDAO sdao;
	
	@Autowired
	private VacationDAO vdao;
	
	/**근무시간 템플릿 관리 관련*/
	
	//근무시간 템플릿 관리 페이지 이동
	@RequestMapping(value="/hourTemplateList.do")
	public ModelAndView goHourTemplateList(
			@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession session
			) {
		
		int totalcnt = hdao.templateListSize();
		int listsize = 5;
		int pagesize = 5;
		
		int man_ix = (Integer)session.getAttribute("man_ix");
		
		List<HourTemplateDTO> list = hdao.getTemplateList(listsize, cp, man_ix);
		
		String paging = com.ateam.checkMon.page.PageModule.getMakePage("hourTemplateList.do", totalcnt, listsize, pagesize, cp);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list",list);
		mav.addObject("paging",paging);
		mav.setViewName("man/schedule/hourTemplateList");
		
		return mav;
	}
	
	//근무 시간 템플릿 리스트 모두 가져오기
	@RequestMapping(value="/hourTemplateList.do",method=RequestMethod.POST)
	public ModelAndView getHourTemplateList(
			HttpSession session
			) {
		int man_ix = (Integer)session.getAttribute("man_ix");
		
		List<HourTemplateDTO> list = hdao.getTemplateList(man_ix);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("cmjson");
		
		return mav;
	}
	
	//근무 시간 템플릿 추가하기
	@RequestMapping(value="hourTemplateAdd.do",method=RequestMethod.POST)
	public ModelAndView addTemplate(HourTemplateDTO hdto, HttpSession session) {
		
		int man_ix = (Integer)session.getAttribute("man_ix");
		
		hdto.setMan_ix(man_ix);
		
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
				@RequestParam(value="month")String month,
				HttpSession session
			) {
		
		int man_ix = (Integer)session.getAttribute("man_ix");
		
		List<HashMap<String, Object>> list = sdao.getSchedule(year,month,man_ix);
		
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
				@RequestParam(value="selectDate")String selectDate,
				HttpSession session
			) {
		
		String temp[] = selectTemp.split(",");
		String emp[] = selectEmp.split(",");
		String date[] = selectDate.split(",");
		
		String s_start_time=temp[0];
		String s_end_time=temp[1];
		
		int man_ix = (Integer)session.getAttribute("man_ix");
		
		int res=0;
		
		for(int i=0;i<emp.length;i++) {
			for(int j=0;j<date.length;j++) {
				int emp_ix = Integer.parseInt(emp[i]);
				String s_year = date[j].substring(0, 4);
				String s_month = date[j].substring(5, 7);
				String s_day = date[j].substring(8, 10);
				
				ScheduleDTO dto = new ScheduleDTO(emp_ix, man_ix, s_year, s_month, s_day, s_start_time, s_end_time);
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
	/**휴가 요청 목록 관련*/
	
	//휴가 요청 목록 페이지 이동
	@RequestMapping(value="/vacationList.do")
	public ModelAndView getVacationList(
			@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession session
			) {
		
		
		int listsize = 5;
		int pagesize = 5;
		
		int man_ix = (Integer)session.getAttribute("man_ix");
		
		int totalcnt = vdao.vacationListSize(man_ix);
		
		List<HashMap<String, Object>> list = vdao.getVacationList(listsize, cp, man_ix);
		
		String paging = com.ateam.checkMon.page.PageModule.getMakePage("vacationList.do", totalcnt, listsize, pagesize, cp);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list",list);
		mav.addObject("paging",paging);
		mav.setViewName("man/schedule/vacationList");
		
		return mav;
	}
	
	//휴가 요청 승인 시 대리 근무 가능한 사람들 리스트
	
	@RequestMapping(value="/getRunListSubstitude.do",method=RequestMethod.GET)
	public ModelAndView getRunList(
			@RequestParam(value="subDate")String subDate,
			HttpSession s
			) {
		int man_ix = (Integer) s.getAttribute("man_ix");
		
		String year = subDate.substring(0, 4);
		String month = subDate.substring(5,7);
		String day = subDate.substring(8,10);
		
		List<EmpDTO> list = vdao.getRunList(man_ix, year, month, day);

		String rootpath = s.getServletContext().getRealPath("\\");
		int len = list.size();
		for (int i = 0; i < len; i++) {
			// 근무자 프로필 이미지 list에 set
			File employee = new File(rootpath + "\\assets\\images\\emp\\profile\\" + list.get(i).getEmp_ix());
			File[] files = employee.listFiles();
			String imgpath;
			if (files == null) {
				imgpath = "<img src=assets/images/emp/profile_default.jpg width=35px height=40px>";
			} else {
				imgpath = "<img src=assets/images/emp/profile/" + list.get(i).getEmp_ix() + "\\" + files[0].getName()
						+ " width=35px height=40px>";
			}
			list.get(i).setImgpath(imgpath);
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("data", list);
		mav.setViewName("cmjson");
		return mav;
	}
	
	//휴가 요청 승인 시 수행되는 메소드
		@RequestMapping(value="/agreeVacation.do",method=RequestMethod.POST)
		public ModelAndView agreeVacation(
				@RequestParam(value="vacation_ix")int vacation_ix,
				@RequestParam(value="s_date")String s_date,
				@RequestParam(value="s_time")String s_time,
				@RequestParam(value="emp_ix")String emp_ix
				) {
			
			//1. 휴가 정보 테이블 업데이트 - 휴가 처리 진행상황을 대리 근무자 모집중으로 변경
			int res1 =vdao.updateVacationProg(vacation_ix);
			
			//2. 대리 근무 테이블에 값 넣기
			int next_sub = vdao.getNextSub();
			int res2 =vdao.insertSub(next_sub,vacation_ix,s_date,s_time);
			int res3=0;
			//3. 대리 근무 관계 테이블에 값 넣기
			String emp[] = emp_ix.split(",");
			for(int i=0;i<emp.length;i++) {
				int emp_ix_r = Integer.parseInt(emp[i]);
				res3 = vdao.insertSubReq(next_sub,emp_ix_r);
			}

			String msg = res1>0 && res2>0 && res3>0?"대리 근무를 요청하였습니다.":"대리 근무 요청 처리 실패";
			ModelAndView mav = new ModelAndView();
			mav.addObject("msg",msg);
			mav.setViewName("cmjson");
			return mav;
		}
	
	//휴가 요청 반려 시 수행되는 메소드
	@RequestMapping(value="/denyVacation.do",method=RequestMethod.POST)
	public ModelAndView denyVacation(
			@RequestParam(value="vacation_ix")int vacation_ix,
			@RequestParam(value="deny_reason")String deny_reason
			) {
		
		int res = vdao.denyVacation(vacation_ix,deny_reason);

		String msg = res>0?"휴가 반려 처리되었습니다.":"휴가 반려 처리 실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("cmjson");
		return mav;
	}
	
}
