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
			EmpDTO edto,
			ManDTO mdto,
			HttpServletRequest req,
			HttpServletResponse resp,
			@RequestParam(value="login_email",required=false)String l_email,
			@RequestParam(value="login_password",required=false)String l_pwd,
			@RequestParam(value="remember",required=false)String remember,
			@RequestParam(value="member",required=false)String member,
			@RequestParam(value="e_rpwd",required=false)String e_rpwd,
			@RequestParam(value="m_rpwd",required=false)String m_rpwd) {
		
		ModelAndView mav=new ModelAndView();
		//근무자 로그인 선택
		if(member.equals("emp")) {
			
			//값 2개를 비교하기 위해 Map에 저장
			Map<String,String> e_map=new HashMap<String,String>();
			e_map.put("e_email",l_email);
			e_map.put("e_pwd",l_pwd);
			
			//근무자 이름 추출
			String empname=empdao.empName(l_email);
			
			//근무자 아이디 및 이름 세션에 저장
			HttpSession session=req.getSession();
			session.setAttribute("e_name",empname);
			
			//근무자 DB값과 입력값 비교
			List<EmpDTO> elist=empdao.empLogin(e_map);
			if(elist.size()==0) {
				String msg="등록 되지 않은 ID 및 비밀번호 입니다.";		
				mav.addObject("msg",msg);
				mav.setViewName("member/join/loginFail");
			}else {
				//자동로그인 체크 여부에 따른 쿠키 값 저장
				if(remember==null||remember.equals("")) {
					Cookie ck_epwd=new Cookie("e_rpwd",e_rpwd);
					ck_epwd.setMaxAge(0);
					resp.addCookie(ck_epwd);
				}else {
					empdao.addEmpPwd(edto);
					Cookie mem=new Cookie("member",member);
					mem.setMaxAge(60*60*24*7);
					resp.addCookie(mem);
					Cookie email=new Cookie("l_email",l_email);
					email.setMaxAge(60*60*24*7);
					resp.addCookie(email);
					Cookie ck_epwd=new Cookie("e_rpwd",e_rpwd);
					ck_epwd.setMaxAge(60*60*24*7);
					resp.addCookie(ck_epwd);
				}
				mav.addObject("e_name",empname);
				mav.setViewName("emp/home");
			}
		//관리자 로그인 선택	
		}else if(member.equals("man")){
			
			//값 2개를 비교하기 위해 Map에 저장
			Map<String,String> m_map=new HashMap<String,String>();
			m_map.put("m_email",l_email);
			m_map.put("m_pwd",l_pwd);	
			
			//관리자 이름 추출
			String manname=mandao.manName(l_email);
			
			//관리자 아이디 및 이름 세션에 저장
			HttpSession session=req.getSession();
			session.setAttribute("m_name", manname);
			
			//관리자 DB값과 입력값 비교
			List<ManDTO> mlist=mandao.manLogin(m_map);
			if(mlist.size()==0) {
				String msg="등록 되지 않은 ID 및 비밀번호 입니다.";		
				mav.addObject("msg",msg);
				mav.setViewName("member/join/loginFail");
			}else {
				//자동로그인 체크 여부에 따른 쿠키 값 저장
				if(remember==null||remember.equals("")) {
					Cookie ck_mpwd=new Cookie("m_rpwd",m_rpwd);
					ck_mpwd.setMaxAge(0);
					resp.addCookie(ck_mpwd);
				}else {
					//근무자 랜덤비밀번호 DB에 저장
					mandao.addManPwd(mdto);
					Cookie mem=new Cookie("member",member);
					mem.setMaxAge(60*60*24*7);
					resp.addCookie(mem);
					Cookie email=new Cookie("l_email",l_email);
					email.setMaxAge(60*60*24*7);
					resp.addCookie(email);
					Cookie ck_mpwd=new Cookie("m_rpwd",m_rpwd);
					ck_mpwd.setMaxAge(60*60*24*7);
					resp.addCookie(ck_mpwd);
				}
				mav.addObject("m_name",manname);
				mav.setViewName("man/home");
			}
		}
		
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(
			HttpSession session,
			HttpServletResponse resp,
			@RequestParam(value="e_rpwd",required=false)String e_rpwd,
			@RequestParam(value="m_rpwd",required=false)String m_rpwd,
			@RequestParam(value="login_email",required=false)String l_email,
			@RequestParam(value="member",required=false)String member
			) {
		
		ModelAndView mav=new ModelAndView();
		
		Cookie ck_epwd=new Cookie("e_rpwd",e_rpwd);
		ck_epwd.setMaxAge(0);
		resp.addCookie(ck_epwd);
		Cookie ck_mpwd=new Cookie("m_rpwd",m_rpwd);
		ck_mpwd.setMaxAge(0);
		resp.addCookie(ck_mpwd);
		Cookie email=new Cookie("l_email",l_email);
		email.setMaxAge(0);
		resp.addCookie(email);
		Cookie mem=new Cookie("member",member);
		mem.setMaxAge(0);
		resp.addCookie(mem);
		
		session.invalidate();
		
		//로그아웃 시 랜덤 비밀번호가 삭제되어 다시 설정해준다.
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
		
		//DB에 값을 넣어주기위해 String 형변환
		String temp=temp_s.toString();
		mav.addObject("temp",temp);
		mav.setViewName("index");
		return mav;
	}
	
}
