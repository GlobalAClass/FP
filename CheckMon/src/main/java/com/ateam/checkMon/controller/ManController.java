package com.ateam.checkMon.controller;

import java.io.*;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.ateam.checkMon.member.model.*;

@Controller
public class ManController {
	
	@Autowired
	private ManDAO mandao;
	@Autowired
	private ServletContext context;
	
	//관리자 홈페이지 이동
	@RequestMapping("/manHome.do")
	public String goManHome() {
		return "man/home";
	}
	
	//관리자 회원가입 시 개인정보방침 페이지 이동
	@RequestMapping("/goJoinAgreeMan.do")
	public String goJoinAgree() {
		return "member/join/joinAgreeMan";
	}
	
	//관리자 회원가입 페이지 이동
	@RequestMapping("/goManJoin.do")
	public String goManJoin() {
		return "member/join/manJoin";
	}
	
	//관리자 파일 복사하는 정보 메소드
	public void manCopyInto(int man_ix,MultipartFile upload) {
		try {
			byte bytes[]=upload.getBytes();
			String path=context.getRealPath("\\")+"\\assets\\images\\man\\profile\\"+man_ix;
				
			//관리자 인덱스 번호 폴더 생성 
			File img=new File(path);
			img.mkdir();
				
			//복사할곳 
			File outFile=new File(path+"\\"+upload.getOriginalFilename());
			FileOutputStream fos=new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
		
	//관리자 회원가입 storeIx 받기
	@RequestMapping(value="/manJoin.do", method=RequestMethod.POST)
	public ModelAndView addManJoin(
			StoreDTO sdto,
			ManDTO mdto,
			MultipartHttpServletRequest multreq) {
		int man_ix = mandao.getNextManIx();
		mdto.setMan_ix(man_ix);
		int m_result=mandao.addManJoin(mdto);
		sdto.setMan_ix(man_ix);
		int s_result=mandao.addStoreManJoin(sdto);
		
		//관리자 프로필 이미지 폴더 생성 및 저장
		MultipartFile upload=multreq.getFile("picture");
		manCopyInto(man_ix, upload);
		
		String msg=s_result >0 && m_result >0 ?"회원가입이 완료 되었습니다.":"회원가입에 실패 하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("member/join/memberJoinMsg");
		
		return mav;
	}
	
	//관리자 아이디 중복체크
	@RequestMapping(value="/manIdCheck.do", method=RequestMethod.GET)
	public ModelAndView manIdCheck(
			@RequestParam(value="m_email",required=false)String m_email) {
		String res=mandao.manIdCheck(m_email);
		ModelAndView mav=new ModelAndView();
		if(res==null) {
			mav.setViewName("member/join/idCheckSucces");
		}else {
			mav.setViewName("member/join/idCheckFail");
		}
		return mav;
	}
		
}
