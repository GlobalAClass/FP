package com.ateam.checkMon.controller;

import java.util.*;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.ateam.checkMon.empCommute.model.EmpCommuteAllDTO;
import com.ateam.checkMon.empCommute.model.EmpCommuteDAO;

@Controller
public class EmpCommuteController {
	
	@Autowired
	private EmpCommuteDAO cdao;
	
	//근무자 근태달력 확인
	@RequestMapping("/empCommute.do")
	public ModelAndView empCommute(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		int emp_ix=(Integer)session.getAttribute("emp_ix");

		mav.setViewName("emp/commute/commuteList");
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
		
		
		List<EmpCommuteAllDTO> list=cdao.getCommuteAllList(listsize, cp, emp_ix);
		String paging = com.ateam.checkMon.page.PageModule.getMakePage("empCommuteApplyList.do", totalcnt, listsize, pagesize, cp);
		
		mav.addObject("list",list);
		mav.addObject("paging",paging);
		mav.setViewName("emp/commute/commuteApplyList");
		return mav;
	}
	
}
