package com.ateam.checkMon.controller;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.checkMon.empCommute.model.EmpCommuteDTO;
import com.ateam.checkMon.manEmpRun.model.ManEmpRunDAO;
import com.ateam.checkMon.manEmpRun.model.ManEmpRunDTO;
import com.ateam.checkMon.member.model.*;
import com.ateam.checkMon.vacation.model.VacationDAO;

@Controller
public class EmpController {
	
	@Autowired
	private EmpDAO empdao;
	@Autowired
	private ManEmpRunDAO manemprundao;
	@Autowired
	private ServletContext context;
	@Autowired
	private VacationDAO vdao;
	
	//근무자 홈페이지 이동
	@RequestMapping("/empHome.do")
	public ModelAndView goEmpHome(
			@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession s) {
		int emp_ix = (Integer)s.getAttribute("emp_ix");
		//출근하기 <-> 퇴근하기 버튼에 사용하기 위해서 
		//근무자 출근 중인지 아닌지 여부 확인
		EmpCommuteDTO commute = empdao.checkWorking(emp_ix);
		
		boolean working = false;
		//출근하지 않은 상태
		if(commute==null) {
			working = false;
		}else { //출근한 상태
			if(commute.getWorktime() != null) {
				working = true;	
			}
		}
		
		//메인에 띄울 휴가 상태
		int totalcnt = vdao.vacationListEmpSize(emp_ix);
		int listsize = 5;
		int pagesize = 5;
		
		List<HashMap<String,Object>> list = vdao.getVacationListEmp(listsize, cp, emp_ix);
		
		String paging = com.ateam.checkMon.page.PageModule.getMakePage("vacationListEmp.do", totalcnt, listsize, pagesize, cp);
		
		
		ModelAndView mav = new ModelAndView("emp/home");
		mav.addObject("working", working);
		mav.addObject("list",list);
		mav.addObject("paging",paging);
		return mav;
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
