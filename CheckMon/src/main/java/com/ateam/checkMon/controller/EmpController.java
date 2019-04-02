package com.ateam.checkMon.controller;

import java.io.*;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.ateam.checkMon.manEmpRun.model.ManEmpRunDAO;
import com.ateam.checkMon.manEmpRun.model.ManEmpRunDTO;
import com.ateam.checkMon.member.model.*;

@Controller
public class EmpController {
	
	@Autowired
	private EmpDAO empdao;
	@Autowired
	private ManEmpRunDAO manemprundao;
	@Autowired
	private ServletContext context;
	
	//근무자 홈페이지 이동
	@RequestMapping("/empHome.do")
	public String goEmpHome() {
		return "emp/home";
	}
	
	//근무자 회원가입 시 개인정보방침 페이지 이동
	@RequestMapping("/goJoinAgreeEmp.do")
	public String goJoinAgree() {
		return "member/join/joinAgreeEmp";
	}
	
	//근무자 회원가입 페이지 이동
	@RequestMapping("/goEmpJoin.do")
	public String goManJoin() {
		return "member/join/empJoin";
	}
	
	//근무자 파일 복사하는 정보 메소드
	public void empCopyInto(int emp_ix,MultipartFile upload) {
		try {
			byte bytes[]=upload.getBytes();
			String path=context.getRealPath("\\")+"\\assets\\images\\emp\\profile\\"+emp_ix;
			
			//근무자 인덱스 번호 폴더 생성 
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
	
	
	//근무자 회원 가입
	@RequestMapping(value="/empJoin.do",method=RequestMethod.POST)
	public ModelAndView addEmpJoin(
			EmpDTO edto,
			ManEmpRunDTO rdto,
			MultipartHttpServletRequest multreq) {
		int e_ix = empdao.getNextEmpIx();
		edto.setEmp_ix(e_ix);
		int e_result=empdao.addEmpJoin(edto);
		rdto.setEmp_ix(e_ix);
		int r_result=manemprundao.addManEmpRun(rdto);
		
		//근무자 프로필 이미지 폴더 생성 및 저장
		MultipartFile upload=multreq.getFile("picture");
		empCopyInto(e_ix, upload);
		
		String msg=e_result >0 && r_result >0?"회원가입이 완료 되었습니다.":"회원가입에 실패 하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("member/join/memberJoinMsg");
		return mav;
	}
	
	//근무자 아이디 중복 체크
	@RequestMapping(value="/empIdCheck.do",method=RequestMethod.GET)
	public ModelAndView empIdCheck(
			@RequestParam(value="e_email",required=false)String e_email) {
		String res=empdao.empIdCheck(e_email);
		ModelAndView mav=new ModelAndView();
		if(res==null){
			mav.setViewName("member/join/idCheckSucces");
		}else {
			mav.setViewName("member/join/idCheckFail");
		}
		return mav;
	}
	
	//근무자 근무지 선택 시 매장 정보 조회
	@RequestMapping(value="/getStoreName.do", method=RequestMethod.POST)
	public ModelAndView getStoreName(
			@RequestParam(value="searchStore")String searchStore) {
		List<StoreDTO> list = empdao.getStoreList(searchStore);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("cmjson");
		return mav;
	}
	
	
}
