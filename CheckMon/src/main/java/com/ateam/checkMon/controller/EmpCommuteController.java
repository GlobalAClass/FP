package com.ateam.checkMon.controller;

import java.util.*;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.ateam.checkMon.empCommute.model.EmpCommuteAllDTO;
import com.ateam.checkMon.empCommute.model.EmpCommuteApplyDTO;
import com.ateam.checkMon.empCommute.model.EmpCommuteDAO;
import com.ateam.checkMon.schedule.model.ScheduleDAO;
import com.ateam.checkMon.schedule.model.ScheduleDTO;

@Controller
public class EmpCommuteController {
	
	@Autowired
	private EmpCommuteDAO cdao;
	@Autowired
	private ScheduleDAO sdao;
	
	@RequestMapping("/empCommuteForm.do")
	public String empCommuteForm() {
		return "emp/commute/commuteList";
	}
	
	//근무자 근태달력 확인
	@RequestMapping("/empCommute.do")
	public ModelAndView empCommute(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		int emp_ix=(Integer)session.getAttribute("emp_ix");
		List<EmpCommuteAllDTO> list=cdao.getCommuteList(emp_ix);
		List<ScheduleDTO> slist=sdao.getEmpScheduleTime(emp_ix);
		mav.addObject("slist",slist);
		mav.addObject("list",list);
		mav.setViewName("cmjson");
		return mav;
	}
	
	//근무자 근태 정보 수정
	@RequestMapping(value="/addCommuteApply.do",method=RequestMethod.POST)
	public ModelAndView addCommuteApply(HttpSession session,
			EmpCommuteApplyDTO dto) {
		ModelAndView mav=new ModelAndView();
		int emp_ix=(Integer)session.getAttribute("emp_ix");
		dto.setEmp_ix(emp_ix);
		int res=cdao.addCommuteApply(dto);
		String msg=res>0?"근태 변경 신청 완료 하였습니다.":"근태 변경 신청에 실패 하였습니다.";
		
		mav.addObject("msg",msg);
		mav.setViewName("cmjson");
		return mav;
	}
	
	//근무자 근태변경목록 보기
	@RequestMapping("/empCommuteApplyList.do")
	public ModelAndView empCommuteApply(
			@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession session) {
		ModelAndView mav=new ModelAndView();
		int emp_ix=(Integer)session.getAttribute("emp_ix");
		int totalcnt=cdao.commuteListSize(emp_ix);
		int listsize = 5;
		int pagesize = 5;
		
		List<EmpCommuteAllDTO> list=cdao.getCommuteApplyList(listsize, cp, emp_ix);
		String paging = com.ateam.checkMon.page.PageModule.getMakePage("empCommuteApplyList.do", totalcnt, listsize, pagesize, cp);
		
		mav.addObject("list",list);
		mav.addObject("paging",paging);
		mav.setViewName("emp/commute/commuteApplyList");
		return mav;
	}
	
}
