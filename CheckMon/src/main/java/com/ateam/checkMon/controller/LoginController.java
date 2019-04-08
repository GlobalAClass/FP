package com.ateam.checkMon.controller;

import javax.servlet.ServletContext;
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
import java.io.*;

@Controller
public class LoginController {
	
	@Autowired
	private EmpDAO empdao;
	@Autowired
	private ManDAO mandao;
	@Autowired
	private ServletContext context;
	
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
			@RequestParam(value="m_rpwd",required=false)String m_rpwd,
			@RequestParam(value="m_email",required=false)String m_email) {

		ModelAndView mav=new ModelAndView();
		//근무자 로그인 선택
		if(member.equals("emp")) {
			
			//값 2개를 비교하기 위해 Map에 저장
			Map<String,String> e_map=new HashMap<String,String>();
			e_map.put("e_email",l_email);
			e_map.put("e_pwd",l_pwd);
			
			//근무자 DB값과 입력값 비교
			EmpDTO elist=empdao.empLogin(e_map);
			
			if(elist==null) {
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
					//근무자 랜덤비밀번호 저장
					empdao.addEmpPwd(edto);
					Cookie mem=new Cookie("member",member);
					mem.setMaxAge(60*60*24*7);
					resp.addCookie(mem);
					Cookie email=new Cookie("l_email",l_email);
					email.setMaxAge(60*60*24*7);
					resp.addCookie(email);
					Cookie ck_erpwd=new Cookie("e_rpwd",e_rpwd);
					ck_erpwd.setMaxAge(60*60*24*7);
					resp.addCookie(ck_erpwd);
				}
				
				//근무자 이름 및 인덱스 추출
				String empname=empdao.empName(l_email);
				int emp_ix=empdao.empIx(l_email);
				
				//근무자 프로필 이미지 가져오기
				File employee = new File(context.getRealPath("\\")+"\\assets\\images\\emp\\profile\\"+emp_ix);
				File[] files=employee.listFiles();
				String imgpath;
				if(files==null) {
					imgpath="assets/images/emp/profile_default.jpg";
				}else {
					imgpath="assets/images/emp/profile/"+emp_ix+"\\"+files[0].getName();
				}

				//근무자 이름 및 인덱스 세션에 저장
				HttpSession session=req.getSession();
				session.setAttribute("e_name",empname);
				session.setAttribute("emp_ix",emp_ix);
				session.setAttribute("imgpath",imgpath);
				
				//출근하기 <-> 퇴근하기 버튼에 사용하기 위해서 
				//근무자 출근 중인지 아닌지 여부 확인
				Integer commute_ix = empdao.checkWorking(emp_ix);
				
				boolean working;
				//출근하지 않은 상태
				if(commute_ix==null) {
					working = false;
				}else { //출근한 상태
					working = true;
				}
				mav.addObject("working", working);
				
				mav.setViewName("emp/home");
			}
		//관리자 로그인 선택	
		}else if(member.equals("man")){
			
			//값 2개를 비교하기 위해 Map에 저장
			Map<String,String> m_map=new HashMap<String,String>();
			m_map.put("m_email",l_email);
			m_map.put("m_pwd",l_pwd);	
			
			//관리자 DB값과 입력값 비교
			ManDTO mlist=mandao.manLogin(m_map);
			
			if(mlist==null) {
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
					//관리자 랜덤비밀번호 DB에 저장
					mandao.addManPwd(mdto);
					
					Cookie mem=new Cookie("member",member);
					mem.setMaxAge(60*60*24*7);
					resp.addCookie(mem);
					Cookie email=new Cookie("l_email",l_email);
					email.setMaxAge(60*60*24*7);
					resp.addCookie(email);
					Cookie ck_mrpwd=new Cookie("m_rpwd",m_rpwd);
					ck_mrpwd.setMaxAge(60*60*24*7);
					resp.addCookie(ck_mrpwd);
				}
				
				//관리자 이름 및 인덱스 추출
				String manname=mandao.manName(l_email);
				int man_ix=mandao.manIx(l_email);
				
				//관리자 프로필 이미지 가져오기
				File manager = new File(context.getRealPath("\\")+"\\assets\\images\\man\\profile\\"+man_ix);
				File[] files=manager.listFiles();
				String imgpath;
				if(files==null) {
					imgpath="assets/images/man/profile_default.jpg";
				}else {
					imgpath="assets/images/man/profile/"+man_ix+"\\"+files[0].getName();
				}
				
				//관리자 이름 및 인덱스 세션에 저장
				HttpSession session=req.getSession();
				session.setAttribute("m_name", manname);
				session.setAttribute("man_ix",man_ix);
				session.setAttribute("imgpath",imgpath);
				
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
		//저장 쿠키값 초기화 
		Cookie ck_erpwd=new Cookie("e_rpwd",e_rpwd);
		ck_erpwd.setMaxAge(0);
		resp.addCookie(ck_erpwd);
		Cookie ck_mrpwd=new Cookie("m_rpwd",m_rpwd);
		ck_mrpwd.setMaxAge(0);
		resp.addCookie(ck_mrpwd);
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
		mav.setViewName("member/join/logout");
		return mav;
	}
	
}
