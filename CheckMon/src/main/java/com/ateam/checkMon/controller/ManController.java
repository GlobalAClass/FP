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
	
	//������ ȸ������ ������ �̵�
	@RequestMapping("/manHome.do")
	public String goManJoin() {
		return "member/join/manJoin";
	}
		
	//������ ȸ������
	@RequestMapping(value="/manJoin.do")
	public ModelAndView addManJoin(ManDTO mdto,StoreDTO sdto) {
		int result=mandao.addManJoin(mdto,sdto);
		String msg=result>0?"ȸ�������� �Ϸ� �Ǿ����ϴ�.":"ȸ�� ���� ����";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("member/join/memberJoinMsg");
		return mav;
	}
	
	//������ ���̵� �ߺ� Ȯ��
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
