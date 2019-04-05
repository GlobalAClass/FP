package com.ateam.checkMon.controller;

import java.io.File;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.checkMon.member.model.EmpDAO;
import com.ateam.checkMon.member.model.ManDAO;

@Controller
public class IndexController {

	@Autowired
	private EmpDAO empdao;
	@Autowired
	private ManDAO mandao;
	@Autowired
	private ServletContext context;

	@RequestMapping("/index.do")
	public ModelAndView index(
			@CookieValue(value="e_rpwd",required=false)String e_rpwd,
			@CookieValue(value="m_rpwd",required=false)String m_rpwd,
			@CookieValue(value="l_email",required=false)String l_email,
			@CookieValue(value="member",required=false)String member){

		ModelAndView mav = new ModelAndView();
		
		//근무자인지 관리자 인지 확인
		if(member==null) {
			if(l_email==null||e_rpwd==null||m_rpwd==null) {
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
				//DB에 값을 넣어주기위해 String 형변환
				String temp=temp_s.toString();
				mav.addObject("temp",temp);
				mav.setViewName("index");
			}
		}else if(member.equals("emp")) {
			if(e_rpwd!=null||l_email!=null) {
				//근무자 DB비밀번호와 쿠키 비밀번호 비교
				String db_rpwd = empdao.empAutoLogin(l_email);
				if(db_rpwd.equals(e_rpwd)) {
					//자동로그인시 근무자 프로필 이미지 넣기
					int emp_ix=empdao.empIx(l_email);
					File employee = new File(context.getRealPath("\\")+"\\assets\\images\\emp\\profile\\"+emp_ix);
					File[] files=employee.listFiles();
					String imgpath;
					if(files==null||files.length==0) {
						imgpath="assets/images/emp/profile_default.jpg";
					}else {
						imgpath="assets/images/emp/profile/"+emp_ix+"/"+files[0].getName();
					}
					mav.addObject("imgpath",imgpath);
					mav.setViewName("emp/home");
				}
			}
		}else if(member.equals("man")) {
			if(m_rpwd!=null||l_email!=null) {
				//관리자 DB비밀번호와 쿠키 비밀번호 비교
				String db_rpwd = mandao.manAutoLogin(l_email);	
				if(db_rpwd.equals(m_rpwd)) {
					//자동로그인시 관리자 프로필 이미지 넣기
					int man_ix=mandao.manIx(l_email);
					File manager = new File(context.getRealPath("\\")+"\\assets\\images\\man\\profile\\"+man_ix);
					File[] files=manager.listFiles();
					String imgpath;
					if(files==null||files.length==0) {
						imgpath="assets/images/man/profile_default.jpg";
					}else {
						imgpath="assets/images/man/profile/"+man_ix+"/"+files[0].getName();
					}
					
					mav.addObject("imgpath",imgpath);
					mav.setViewName("man/home");
				}
				
			}
		}
		return mav;
	}
}
