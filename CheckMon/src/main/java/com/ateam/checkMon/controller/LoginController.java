package com.ateam.checkMon.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
	@Autowired
	private ManDAO mandao;
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public ModelAndView login(
			HttpServletRequest req,
			HttpServletResponse resp,
			@RequestParam(value="login_email",required=false)String l_email,
			@RequestParam(value="login_password",required=false)String l_pwd,
			@RequestParam(value="remember",required=false)String remember,
			@RequestParam(value="member",required=false)String member) {
		
		ModelAndView mav=new ModelAndView();
		
		//랜덤 비밀번호 설정
		StringBuffer temp_s = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 15; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z
		        temp_s.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z
		        temp_s.append((char) ((int) (rnd.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9
		        temp_s.append((rnd.nextInt(10)));
		        break;
		    }
		}
		
		//Cookie에 값 넣어 주기위해 String 변환
		String temp=temp_s.toString();
		
		//근무자 로그인 선택
		if(member.equals("emp")) {
			Map<String,String> e_map=new HashMap<String,String>();
			e_map.put("e_email",l_email);
			e_map.put("e_pwd",l_pwd);
			
			List<EmpDTO> elist=empdao.empLogin(e_map);
			
			String empname=empdao.empName(l_email);
			
			HttpSession session=req.getSession();
			session.setAttribute("e_email",l_email);
			session.setAttribute("e_name",empname);
			
			/*if(remember==null||remember.equals("")) {
				Cookie ck_epwd=new Cookie("E_RPWD",temp);
				ck_epwd.setMaxAge(0);
				resp.addCookie(ck_epwd);
			}else {
				Cookie ck_epwd=new Cookie("E_RPWD",temp);
				ck_epwd.setMaxAge(60*60*24*7);
				resp.addCookie(ck_epwd);
			}*/
			
			mav.setViewName("emp/home");
			
		//관리자 로그인 선택	
		}else if(member.equals("man")){
			Map<String,String> m_map=new HashMap<String,String>();
			m_map.put("m_email",l_email);
			m_map.put("m_pwd",l_pwd);	
			
			List<ManDTO> mlist=mandao.manLogin(m_map);
			String manname=mandao.manName(l_email);
			
			HttpSession session=req.getSession();
			session.setAttribute("m_email",l_email);
			session.setAttribute("m_name", manname);
			
			/*if(remember==null||remember.equals("")) {
				Cookie ck_mpwd=new Cookie("M_RPWD",temp);
				ck_mpwd.setMaxAge(0);
				resp.addCookie(ck_mpwd);
			}else {
				Cookie ck_mpwd=new Cookie("M_RPWD",temp);
				ck_mpwd.setMaxAge(60*60*24*7);
				resp.addCookie(ck_mpwd);
			}*/
			
			mav.setViewName("man/home");
		}
		
		return mav;
	}
	
}
