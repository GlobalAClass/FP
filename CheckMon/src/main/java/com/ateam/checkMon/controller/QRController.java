package com.ateam.checkMon.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.checkMon.member.model.EmpDAO;

@Controller
public class QRController {
	
	@Autowired EmpDAO dao;

	//QR 인식페이지 이동하기.
	@RequestMapping("/checkQR.do")
	public String checkQR() {
		return "member/checkCom/checkQR";
	}
		
	//QR 인식 후 결과 처리.
	@RequestMapping("/checkQRInfo.do")
	public ModelAndView checkQRInfo(
			@RequestParam(name="storeIx")String store_ix
			//,HttpSession s
			) {
		
		//System.out.println(storeIx);
		//String uid = (String)s.getAttribute("uid");
		String uid = "1@naver.com";
		boolean QRcheck = dao.checkQRAndStorIx(uid, store_ix);
		
		
		ModelAndView mav = new ModelAndView("member/checkCom/msgCom");
		mav.addObject("QRcheck", QRcheck);
		
		return mav;
	}

	// QR생성 및 다운로드 페이지
	@RequestMapping("/generateQR.do")
	public String goQRGenerator() {
		return "member/checkCom/generateQR";
	}
}
