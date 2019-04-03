package com.ateam.checkMon.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.checkMon.member.model.EmpDAO;

@Controller
public class QRController {
	
	@Autowired EmpDAO dao;
	
	
	//GPS 인식 페이지 이동하기
	@RequestMapping("/loadingGPS.do")
	public String checkGPS() {
		return "emp/officeHours/loadingGPS";
	}
	
	//위도 경도를 이용하여 거리 계산하여 반환
	@RequestMapping(value="/distanceCal.do",method=RequestMethod.POST)
	public ModelAndView calDistance(
			@RequestParam(name="latitude")String latitude, @RequestParam(name="longitude")String longitude, HttpSession session
			) {
		int emp_ix=(Integer)session.getAttribute("emp_ix");
		
		System.out.println("@emp="+emp_ix);
		
		HashMap<String, String> map = dao.getStoreLocation(emp_ix);
		
		//DB에서 가져온 위도, 경도
		double m_latitude = Double.parseDouble(map.get("M_LATITUDE"));
		double m_longitude = Double.parseDouble(map.get("M_LONGITUDE"));
		
		//사용자 GPS에서 가져온 위도 ,경도
		double u_latitude = Double.parseDouble(latitude);
		double u_longitude = Double.parseDouble(longitude);
		
		//두 위도 경도를 이용한 거리 계산
		double theta = m_longitude - u_longitude;
		double dist = Math.sin(deg2rad(m_latitude)) * Math.sin(deg2rad(u_latitude)) + Math.cos(deg2rad(m_latitude)) * Math.cos(deg2rad(u_latitude)) * Math.cos(deg2rad(theta));
        
       dist = Math.acos(dist);
       dist = rad2deg(dist);
       dist = dist * 60 * 1.1515 * 1609.344; //계산 결과 미터값으로 출력
       
       	int distance = (int)dist;
       	
       	//오차범위 지정할 거리(m)
       	final int RANGE = 200;
       	
       	System.out.println("@dist:"+distance);
       	String msg = (distance<RANGE)?"":"매장 근처에서 재시도 해주세요.";
       	String loc = (distance<RANGE)?"checkQR.do":"empHome.do";
       	
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("loc",loc);
		mav.setViewName("cmjson");
		
		return mav;
		
	}
	
	 // This function converts decimal degrees to radians
    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
     
    // This function converts radians to decimal degrees
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }

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
