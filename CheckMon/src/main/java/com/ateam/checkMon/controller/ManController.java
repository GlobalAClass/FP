package com.ateam.checkMon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.ateam.checkMon.member.model.*;

@Controller
public class ManController {
	
	@Autowired
	private ManDAO mandao;
	
	//관리자 회원가입 페이지 이동
	@RequestMapping("/manHome.do")
	public String goManJoin() {
		return "member/join/manJoin";
	}
		
	//관리자 회원가입
	@RequestMapping(value="/manJoin.do")
	public ModelAndView addManJoin(ManDTO mdto,StoreDTO sdto) {
		int result=mandao.addManJoin(mdto,sdto);
		String msg=result>0?"회원가입이 완료 되었습니다.":"회원 가입 실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("member/join/memberJoinMsg");
		return mav;
	}
	
	//관리자 아이디 중복 확인
	@RequestMapping(value="/manIdCheck.do",method=RequestMethod.POST)
	public ModelAndView manIdCheck(
			@RequestParam(value="memail",required=false)String memail) {
		String res=mandao.manIdCheck(memail);
		ModelAndView mav=new ModelAndView();
		if(res==null) {
			mav.setViewName("member/join/idCheckSucces");
		}else {
			mav.setViewName("member/join/idCheckFail");
		}
		return mav;
	}
		
}
