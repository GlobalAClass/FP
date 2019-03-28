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
	
	//관리자 홈페이지 이동
	@RequestMapping("/manHome.do")
	public String goManHome() {
		return "man/home";
	}
	//관리자 회원가입 페이지 이동
	@RequestMapping("/goManJoin.do")
	public String goManJoin() {
		return "member/join/manJoin";
	}
		
	//관리자 회원가입 storeIx 받기
	@RequestMapping(value="/manJoin.do", method=RequestMethod.POST)
	public ModelAndView addManJoin(StoreDTO sdto, ManDTO mdto) {
		int s_ix = mandao.getNextStoreIx();
		sdto.setStoreIx(s_ix);
		int s_result=mandao.addStoreManJoin(sdto);
		mdto.setStoreIx(s_ix);
		int m_result=mandao.addManJoin(mdto);
		String msg=s_result >0 && m_result >0 ?"회원가입이 완료 되었습니다.":"회원가입에 실패 하였습니다.";
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg", msg);
		mav.setViewName("member/join/memberJoinMsg");
		
		return mav;
	}
	
	//관리자 아이디 중복체크
	@RequestMapping(value="/manIdCheck.do", method=RequestMethod.GET)
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
