package com.ateam.checkMon.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.ateam.checkMon.member.model.*;

@Controller
public class ProfileController {
	
	@Autowired
	private EmpDAO empdao;
	@Autowired
	private ManDAO mandao;
	
	//근무자 프로필 페이지 이동 선택시 DB값 뿌리기 
	@RequestMapping("/modEmpProfileForm.do")
	public ModelAndView modEmpProfileForm(
			@RequestParam(value="emp_ix",required=false,defaultValue="0")int emp_ix,
			HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		
		int e_ix=(Integer)session.getAttribute("emp_ix");
		EmpDTO list=empdao.modEmpProfileForm(e_ix);
		
		//근무자 생일 나누기
		String e_bir=list.getE_birthday();
		
		String year=e_bir.substring(0,4);
		String month=e_bir.substring(5,7);
		String day=e_bir.substring(8,10);
		
		//근무자 핸드폰 번호 나누기
		String e_tel=list.getE_tel();
		
		String e_tel1=e_tel.substring(4,8);
		String e_tel2=e_tel.substring(9,13);
		
		mav.addObject("year",year);
		mav.addObject("month",month);
		mav.addObject("day",day);
		mav.addObject("e_tel1",e_tel1);
		mav.addObject("e_tel2",e_tel2);
		mav.addObject("list",list);
		mav.setViewName("emp/profile/empProfile");
		
		return mav;
	}
	
	//근무자 프로필 수정 SQL Update
	@RequestMapping("/empProfile.do")
	public ModelAndView modEmpProfile(EmpDTO dto) {
		ModelAndView mav=new ModelAndView();

		int result=empdao.modEmpProfile(dto);
		String msg=result>0?"프로필 수정이 완료 되었습니다.":"프로필 수정에 실패 하였습니다.";
		mav.addObject("msg",msg);
		mav.setViewName("emp/profile/ProfileMsg");
		return mav;
	}
	
	
	//관리자 프로필 페이지 이동 선택시 DB값 뿌리기 
	@RequestMapping("/modManProfileForm.do")
	public ModelAndView modManProfileForm(
			@RequestParam(value="man_ix",required=false,defaultValue="0")int man_ix,
			HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		
		int m_ix=(Integer)session.getAttribute("man_ix");
		
		//관리자 DB 정보
		ManDTO m_list=mandao.modManProfileForm(m_ix);
		
		//관리자 핸드폰 나누기
		String m_tel=m_list.getM_tel();
		String m_tel1=m_tel.substring(4,8);
		String m_tel2=m_tel.substring(9,13);
		
		//관리자 매장 DB 정보
		StoreDTO s_list=mandao.modStoreProfileForm(m_ix);
		mav.addObject("m_tel1",m_tel1);
		mav.addObject("m_tel2",m_tel2);
		mav.addObject("m_list",m_list);
		mav.addObject("s_list",s_list);
		mav.setViewName("man/profile/manProfile");
		
		return mav;
	}
	
	@RequestMapping("/manProfile.do")
	public ModelAndView modManProfile(ManDTO dto) {
		
		ModelAndView mav=new ModelAndView();
		
		int result=mandao.modManProfile(dto);
		String msg=result>0?"프로필 수정이 완료 되었습니다.":"프로필 수정에 실패 하였습니다.";
		mav.addObject("msg",msg);
		mav.setViewName("emp/profile/ProfileMsg");
		return mav;
	}
	
	
	
}
