package com.ateam.checkMon.controller;

import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.ateam.checkMon.empCommute.model.*;
import com.ateam.checkMon.schedule.model.ScheduleDAO;
import com.ateam.checkMon.schedule.model.ScheduleDTO;

@Controller
public class ManCommuteController {

	@Autowired
	private EmpCommuteDAO mdao;
	@Autowired
	private ScheduleDAO sdao;
	
	//관리자가 근무자들의 오늘 근무상태 및 출퇴근 확인
	@RequestMapping("/dayCommuteList.do")
	public ModelAndView dayCommuteList(@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession session,
			EmpCommuteDTO dto) {
		ModelAndView mav=new ModelAndView();
		int man_ix=(Integer)session.getAttribute("man_ix");
		int totalcnt=mdao.getDayCommuteListSize(man_ix);
		int listsize=5;
		int pagesize=5;
		List<EmpCommuteAllDTO> list=mdao.getDayCommuteList(listsize, cp, man_ix);
		List<ScheduleDTO> slist=sdao.getManScheduleTime(man_ix);
		
		for(int i=0;i<list.size();i++) {
			//근무자 근태 인덱스
			int emp_commute_ix=list.get(i).getEmp_commute_ix();
			//당일 스케줄 근무 날짜
			String s_workday = slist.get(i).getS_year()+"-"+slist.get(i).getS_month()+"-"+slist.get(i).getS_day();
			//근무 날짜
			String workday = list.get(i).getWorkday();
			//근무자 출근시간
			String worktime_s = list.get(i).getWorktime().replace(":","");
			int worktime = Integer.parseInt(worktime_s);
			//근무자 퇴근시간
			String leavetime_s = list.get(i).getLeavetime().replace(":","");
			if(leavetime_s.equals("-")) {
				leavetime_s="0";
			}
			int leavetime = Integer.parseInt(leavetime_s);
			//스케줄 출근시간
			String starttime_s = slist.get(i).getS_start_time().replace(":","");
			int starttime = Integer.parseInt(starttime_s);
			//스케줄 퇴근시간
			String endtime_s = slist.get(i).getS_end_time().replace(":","");
			int endtime = Integer.parseInt(endtime_s);
			
			Date today=new Date();
			SimpleDateFormat time=new SimpleDateFormat("kk:mm");
			String todaytime_s=time.format(today).replace(":","");
			int todaytime = Integer.parseInt(todaytime_s);
			
			if(worktime<=starttime) {
				if(endtime<=leavetime) {
					String temp="퇴근";
					dto.setState(temp);
					dto.setEmp_commute_ix(emp_commute_ix);
					mdao.setDayState(dto);
				}else {
					String temp="근무중";
					dto.setState(temp);
					dto.setEmp_commute_ix(emp_commute_ix);
					mdao.setDayState(dto);
				}
			}else {
				if(endtime<=leavetime) {
					String temp="퇴근";
					dto.setState(temp);
					dto.setEmp_commute_ix(emp_commute_ix);
					mdao.setDayState(dto);
				}else {
					String temp="근무중(지각)";
					dto.setState(temp);
					dto.setEmp_commute_ix(emp_commute_ix);
					mdao.setDayState(dto);
				}
			}
			
			if(s_workday!=null) {
				if(workday==null) {
					if(endtime<todaytime) {
						String temp="결근";
						dto.setState(temp);
						dto.setEmp_commute_ix(emp_commute_ix);
						mdao.setDayState(dto);
					}else {
						String temp="근무예정";
						dto.setState(temp);
						dto.setEmp_commute_ix(emp_commute_ix);
						mdao.setDayState(dto);
					}
				}
			}
		}
		
		String paging= com.ateam.checkMon.page.PageModule.getMakePage("dayCommuteList.do", totalcnt, listsize, pagesize, cp);
		
		mav.addObject("paging",paging);
		mav.addObject("list",list);
		mav.setViewName("man/commute/dayCommuteList");
		return mav;
	}
	
	//관리자 출퇴근기록 관리 페이지 이동
	@RequestMapping("/commuteAllListForm.do")
	public String commuteAllListForm() {
		return "man/commute/commuteAllList";
	}
	
	//관리자 출퇴근 기록 관리 정보
	@RequestMapping("/commuteAllList.do")
	public ModelAndView commuteAllList(HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		int man_ix=(Integer)session.getAttribute("man_ix");
		
		List<EmpCommuteAllDTO> list=mdao.getCommuteAllList(man_ix);
		
		mav.addObject("list",list);
		mav.setViewName("cmjson");
		return mav;
	}
	
	//관리자 출퇴근 기록 관리 출퇴근 정보 수정
	@RequestMapping(value="/modCommuteList.do",method=RequestMethod.POST)
	public ModelAndView modCommuteList(EmpCommuteDTO dto) {
		
		ModelAndView mav=new ModelAndView();
		int res=mdao.modCommuteList(dto);
		String msg=res>0?"출퇴근시간 정보 변경이 완료 되었습니다.":"출퇴근시간 정보 변경에 실패 하였습니다.";
		
		mav.addObject("msg",msg);
		mav.setViewName("cmjson");
		return mav;
	}
	
	//관리자가 근무자의 근태변경목록 보기
	@RequestMapping("/commuteApplyAllList.do")
	public ModelAndView commuteApplyAllList(@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		int man_ix=(Integer)session.getAttribute("man_ix");
		int totalcnt=mdao.CommuteApplyAllListSize(man_ix);
		int listsize = 5;
		int pagesize = 5;
		
		List<EmpCommuteAllDTO> list=mdao.getCommuteApplyAllList(listsize, cp, man_ix);
		String paging = com.ateam.checkMon.page.PageModule.getMakePage("commuteApplyAllList.do", totalcnt, listsize, pagesize, cp);
		
		mav.addObject("list",list);
		mav.addObject("paging",paging);
		mav.setViewName("man/commute/commuteApplyAllList");
		return mav;
	}
	
	//관리자 반려사유 작성
	@RequestMapping("/commuteApplyReturn.do")
	public ModelAndView commuteApplyReturn(EmpCommuteApplyDTO adto,
			@RequestParam(value="c_return",required=false)String c_return,
			EmpCommuteDTO cdto) {
		ModelAndView mav=new ModelAndView();
		if(c_return==null||c_return.equals("")) {
			String temp="승인";
			adto.setProgress(temp);
			mdao.addCommuteApplyProgress(adto);
			int res=mdao.setCommuteWorkTime(cdto);
			String msg = res>0?"승인 완료 및 근무시간이 변경 되었습니다.":"승인 실패 하였습니다.";
			mav.addObject("msg",msg);
			mav.setViewName("man/commute/commuteApplySucces");
		}else {
			int res=mdao.addCommuteApplyReturn(adto);
			String temp="반려";
			adto.setProgress(temp);
			mdao.addCommuteApplyProgress(adto);
			String msg = res>0?"반려 사유 전송 완료":"반려 사유 전송 실패";
			mav.addObject("msg",msg);
			mav.addObject("loc","commuteApplyAllList.do");
			mav.setViewName("cmjson");
		}
		
		return mav;
		
	}
	
	
}
