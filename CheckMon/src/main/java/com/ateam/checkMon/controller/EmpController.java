package com.ateam.checkMon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.ateam.checkMon.member.model.*;

@Controller
public class EmpController {
	
	@Autowired
	private EmpDAO empdao;
	
	//근무자 홈페이지 이동
	@RequestMapping("/empHome.do")
	public String goManHome() {
		return "emp/home";
	}
	//
	@RequestMapping("/goEmpJoin.do")
	public String goManJoin() {
		return "member/join/manJoin";
	}
	
	//�ٹ��� ȸ������
	@RequestMapping("/empJoin.do")
	public ModelAndView addEmpJoin(EmpDTO dto) {
		int result=empdao.addEmpJoin(dto);
		String msg=result>0?"ȸ�������� �Ϸ� �Ǿ����ϴ�.":"ȸ�� ���� ����";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("member/join/memberJoinMsg");
		return mav;
	}
	
	//�ٹ��� ���̵� �ߺ� Ȯ��
	@RequestMapping(value="/empIdCheck.do",method=RequestMethod.POST)
	public ModelAndView empIdCheck(
			@RequestParam(value="eemail",required=false)String eemail) {
		String res=empdao.empIdCheck(eemail);
		ModelAndView mav=new ModelAndView();
		if(res==null) {
			mav.setViewName("member/join/idCheckSucces");
		}else {
			mav.setViewName("member/join/idCheckFail");
		}
		return mav;
	}
	
	
	
}
