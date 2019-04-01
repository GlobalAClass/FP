package com.ateam.checkMon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.checkMon.manEmpRun.model.ManEmpRunDAO;
import com.ateam.checkMon.manEmpRun.model.ManEmpRunDTO;
import com.ateam.checkMon.member.model.*;

@Controller
public class EmpController {
	
	@Autowired
	private EmpDAO empdao;
	@Autowired
	private ManEmpRunDAO manemprundao;
	
	//근무자 홈페이지 이동
	@RequestMapping("/empHome.do")
	public String goEmpHome() {
		return "emp/home";
	}
	
	//근무자 회원가입 시 개인정보방침 페이지 이동
	@RequestMapping("/goJoinAgreeEmp.do")
	public String goJoinAgree() {
		return "member/join/joinAgreeEmp";
	}
	
	//근무자 회원가입 페이지 이동
	@RequestMapping("/goEmpJoin.do")
	public String goManJoin() {
		return "member/join/empJoin";
	}
	
	//근무자 회원 가입
	@RequestMapping(value="/empJoin.do",method=RequestMethod.POST)
	public ModelAndView addEmpJoin(EmpDTO edto, ManEmpRunDTO rdto) {
		int e_ix = empdao.getNextEmpIx();
		edto.setEmp_Ix(e_ix);
		int e_result=empdao.addEmpJoin(edto);
		rdto.setEmp_ix(e_ix);
		int r_result=manemprundao.addManEmpRun(rdto);
		String msg=e_result >0 && r_result >0?"회원가입이 완료 되었습니다.":"회원가입에 실패 하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("member/join/memberJoinMsg");
		return mav;
	}
	
	//근무자 아이디 중복 체크
	@RequestMapping(value="/empIdCheck.do",method=RequestMethod.GET)
	public ModelAndView empIdCheck(
			@RequestParam(value="e_email",required=false)String e_email) {
		String res=empdao.empIdCheck(e_email);
		ModelAndView mav=new ModelAndView();
		if(res==null){
			mav.setViewName("member/join/idCheckSucces");
		}else {
			mav.setViewName("member/join/idCheckFail");
		}
		return mav;
	}
	
	//근무자 근무지 선택 시 매장 정보 조회
	@RequestMapping(value="/getStoreName.do", method=RequestMethod.POST)
	public ModelAndView getStoreName(
			@RequestParam(value="searchStore")String searchStore) {
		List<StoreDTO> list = empdao.getStoreList(searchStore);
		System.out.println("controller : "+list.toString());
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("cmjson");
		return mav;
	}
	
	
}
