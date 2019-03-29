package com.ateam.checkMon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.ateam.checkMon.member.model.*;
import java.util.*;

@Controller
public class LoginController {
	
	@Autowired
	private EmpDAO empdao;
	//private ManDAO mandao;
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public ModelAndView login(
			HttpServletRequest req,
			HttpServletResponse resp,
			@RequestParam(value="login_email",required=false)String l_email,
			@RequestParam(value="login_password",required=false)String l_pwd,
			@RequestParam(value="remember",required=false)String remember,
			@RequestParam(value="member",required=false)String member) {
		ModelAndView mav=new ModelAndView();
		if(member.equals("emp")) {
			Map<String,String> map=new HashMap<String,String>();
			map.put("l_email",l_email);
			map.put("l_pwd",l_pwd);
			System.out.println(map.get("l_email"));
			System.out.println(map.get("l_pwd"));
			List<EmpDTO> elist=empdao.empLogin(map);
			System.out.println(elist.size());
			//String empname=empdao.empName(l_email);
			//System.out.println(empname);
			mav.setViewName("emp/home");
		}
			/*
			Map<String,String> map=new HashMap<String,String>();
			map.put("l_email",l_email);
			map.put("l_pwd",l_pwd);
			List<ManDTO> mlist=mandao.manLogin(map);
			System.out.println(mlist);
			*/
		

		return mav;
	}
	
}
