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
import com.ateam.checkMon.empCommute.model.EmpCommuteDTO;

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
