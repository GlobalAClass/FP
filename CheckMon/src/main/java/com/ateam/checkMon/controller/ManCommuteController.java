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

@Controller
public class ManCommuteController {

	@Autowired
	private EmpCommuteDAO mdao;
	
	//관리자가 근무자들의 오늘 근무상태 및 출퇴근 확인
	@RequestMapping("/dayCommuteList.do")
	public ModelAndView dayCommuteList(@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession session) {
		ModelAndView mav=new ModelAndView();
		
		int totalcnt=mdao.getDayCommuteListSize();
		int listsize=5;
		int pagesize=5;
		int man_ix=(Integer)session.getAttribute("man_ix");
		
		List<EmpCommuteAllDTO> list=mdao.getDayCommuteList(listsize, cp, man_ix);
		String paging= com.ateam.checkMon.page.PageModule.getMakePage("dayCommuteList.do", totalcnt, listsize, pagesize, cp);
		
		mav.addObject("paging",paging);
		mav.addObject("list",list);
		mav.setViewName("man/commute/dayCommuteList");
		return mav;
	}
	
	//관리자가 근무자의 근태변경목록 보기
	@RequestMapping("/commuteApplyAllList.do")
	public ModelAndView commuteApplyAllList(@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		
		int totalcnt=mdao.CommuteApplyAllListSize();
		int listsize = 5;
		int pagesize = 5;
		int man_ix=(Integer)session.getAttribute("man_ix");
		
		List<EmpCommuteAllDTO> list=mdao.getCommuteApplyAllList(listsize, cp, man_ix);
		String paging = com.ateam.checkMon.page.PageModule.getMakePage("commuteApplyAllList.do", totalcnt, listsize, pagesize, cp);
		
		mav.addObject("list",list);
		mav.addObject("paging",paging);
		mav.setViewName("man/commute/commuteApplyAllList");
		return mav;
	}
	
	//관리자 반려사유 작성
	@RequestMapping("/commuteApplyReturn.do")
	public ModelAndView commuteApplyReturn(EmpCommuteApplyDTO dto,
			@RequestParam(value="c_return",required=false)String c_return) {
		
		ModelAndView mav=new ModelAndView();
		if(c_return==null||c_return.equals("")) {
			String temp="승인";
			dto.setProgress(temp);
			int progress=mdao.addCommuteApplyProgress(dto);
			System.out.println(progress);
			System.out.println(progress);
			System.out.println(progress);
			mav.setViewName("man/commute/commuteApplySucces");
		}else {
			int res=mdao.addCommuteApplyReturn(dto);
			String temp="반려";
			dto.setProgress(temp);
			int progress=mdao.addCommuteApplyProgress(dto);
			System.out.println(progress);
			System.out.println(progress);
			System.out.println(progress);
			String msg = res>0?"":"반려 사유 전송 실패";
			mav.addObject("msg",msg);
			mav.addObject("loc","commuteApplyAllList.do");
			mav.setViewName("cmjson");
		}
		
		return mav;
		
	}
	
	
}
