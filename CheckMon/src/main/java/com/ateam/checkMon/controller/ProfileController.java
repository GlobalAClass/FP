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
	public ModelAndView modEmpProfile(EmpDTO dto,
			@RequestParam(value="emp_ix",required=false)int emp_ix,
			@RequestParam(value="e_tel",required=false)String e_tel,
			@RequestParam(value="e_birthDay",required=false)String e_birthday,
			@RequestParam(value="e_pwd",required=false)String e_pwd) {
		ModelAndView mav=new ModelAndView();
		System.out.println(emp_ix);
		System.out.println(emp_ix);
		System.out.println(e_tel);
		System.out.println(e_tel);
		System.out.println(e_birthday);
		System.out.println(e_birthday);
		System.out.println(e_pwd);
		System.out.println(e_pwd);
		int result=empdao.modEmpProfile(dto);
		String msg=result>0?"프로필 수정이 완료 되었습니다.":"프로필 수정에 실패 하였습니다.";
		
		mav.addObject("msg",msg);
		mav.setViewName("emp/profile/empProfileMsg");
		return mav;
	}
	
	
	//관리자 프로필 페이지 이동 선택시 DB값 뿌리기 
	@RequestMapping("/goManProfile.do")
	public ModelAndView goManProfile(
			@RequestParam(value="man_ix",required=false,defaultValue="0")int man_ix) {
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("man/profile/manProfile");
		
		return mav;
	}
	
	
	
	
}
