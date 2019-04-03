package com.ateam.checkMon.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.ateam.checkMon.member.model.*;

@Controller
public class ProfileController {
	
	@Autowired
	private EmpDAO empdao;
	@Autowired
	private ManDAO mandao;
	@Autowired
	private ServletContext context;
	
	//근무자 파일 복사하는 정보 메소드
	public void empCopyInto(int emp_ix,MultipartFile upload) {
		try {
			byte bytes[]=upload.getBytes();
			String path=context.getRealPath("\\")+"\\assets\\images\\emp\\profile\\"+emp_ix;
			
			//근무자 인덱스 번호 폴더 생성 
			File img=new File(path);
			img.mkdir();
			
			//기존 이미지 프로필 삭제
			File check=new File(path);
			File files[]=check.listFiles();
			for(int i=0;i<files.length;i++) {
				System.out.println(files[i].getName());
				System.out.println(files[i].getName());
				System.out.println(files[i].getName());
				System.out.println(upload.getOriginalFilename());
				System.out.println(upload.getOriginalFilename());
				System.out.println(upload.getOriginalFilename());
				if(!files[i].getName().equals(upload.getOriginalFilename())) {
					files[i].delete();
				}
			}
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
	
	//관리자 파일 복사하는 정보 메소드
	public void manCopyInto(int man_ix,MultipartFile upload) {
		try {
			byte bytes[]=upload.getBytes();
			String path=context.getRealPath("\\")+"\\assets\\images\\man\\profile\\"+man_ix;
			
			//관리자 인덱스 번호 폴더 생성 
			File img=new File(path);
			img.mkdir();
			
			//기존 이미지 프로필 삭제
			File check=new File(path);
			File files[]=check.listFiles();
			for(int i=0;i<files.length;i++) {
				System.out.println(files[i].getName());
				System.out.println(files[i].getName());
				System.out.println(files[i].getName());
				System.out.println(upload.getOriginalFilename());
				System.out.println(upload.getOriginalFilename());
				System.out.println(upload.getOriginalFilename());
				if(!files[i].getName().equals(upload.getOriginalFilename())) {
					files[i].delete();
				}
			}
			
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
	
	//근무자 프로필 페이지 이동 선택시 DB값 뿌리기 
	@RequestMapping("/modEmpProfileForm.do")
	public ModelAndView modEmpProfileForm(
			@RequestParam(value="emp_ix",required=false,defaultValue="0")int emp_ix,
			HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		
		int e_ix=(Integer)session.getAttribute("emp_ix");
		EmpDTO list=empdao.modEmpProfileForm(e_ix);
		
		//근무자 프로필 이미지 가져오기
		File emp_profile = new File(context.getRealPath("\\")+"\\assets\\images\\emp\\profile\\"+e_ix);
		File[] files=emp_profile.listFiles();
		String imgpath;
		if(files==null||files.length==0) {
			imgpath="assets/images/emp/profile_default.jpg";
		}else {
			imgpath="assets/images/emp/profile/"+e_ix+"\\"+files[0].getName();
		}
		
		//근무자 생일 나누기
		String e_bir=list.getE_birthday();
		String year=e_bir.substring(0,4);
		String month=e_bir.substring(5,7);
		String day=e_bir.substring(8,10);
		
		//근무자 핸드폰 번호 나누기
		String e_tel=list.getE_tel();
		String e_tel1=e_tel.substring(4,8);
		String e_tel2=e_tel.substring(9,13);
		
		mav.addObject("imgpath",imgpath);
		mav.addObject("year",year);
		mav.addObject("month",month);
		mav.addObject("day",day);
		mav.addObject("e_tel1",e_tel1);
		mav.addObject("e_tel2",e_tel2);
		mav.addObject("list",list);
		mav.setViewName("emp/profile/empProfile");
		
		return mav;
	}
	
	//근무자 프로필 수정 SQL Update
	@RequestMapping("/empProfile.do")
	public ModelAndView modEmpProfile(
			EmpDTO dto,
			@RequestParam(value="emp_ix",required=false,defaultValue="0")int emp_ix,
			@RequestParam(value="e_pwd",required=false)String e_pwd,
			MultipartHttpServletRequest multreq) {
		ModelAndView mav=new ModelAndView();
		
		MultipartFile upload=multreq.getFile("picture");
		empCopyInto(emp_ix, upload);
		
		//근무자 비밀번호 null값 처리
		if(e_pwd==null||e_pwd.equals("")) {
			dto=empdao.modEmpProfileForm(emp_ix);
		}
		
		int result=empdao.modEmpProfile(dto);
		String msg=result>0?"프로필 수정이 완료 되었습니다.":"프로필 수정에 실패 하였습니다.";
		mav.addObject("msg",msg);
		mav.setViewName("emp/profile/ProfileMsg");
		return mav;
	}
	
	
	//관리자 프로필 페이지 이동 선택시 DB값 뿌리기 
	@RequestMapping("/modManProfileForm.do")
	public ModelAndView modManProfileForm(
			@RequestParam(value="man_ix",required=false,defaultValue="0")int man_ix,
			HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		
		int m_ix=(Integer)session.getAttribute("man_ix");
		ManDTO m_list=mandao.modManProfileForm(m_ix);
		//관리자 핸드폰 나누기
		String m_tel=m_list.getM_tel();
		String m_tel1=m_tel.substring(4,8);
		String m_tel2=m_tel.substring(9,13);
		
		//관리자 프로필 이미지 가져오기
		File man_profile = new File(context.getRealPath("\\")+"\\assets\\images\\man\\profile\\"+m_ix);
		File[] files=man_profile.listFiles();
		String imgpath;
		if(files==null||files.length==0) {
			imgpath="assets/images/man/profile_default.jpg";
		}else {
			imgpath="assets/images/man/profile/"+m_ix+"\\"+files[0].getName();
		}
		
		//관리자 매장 DB 정보
		StoreDTO s_list=mandao.modStoreProfileForm(m_ix);
		
		mav.addObject("imgpath",imgpath);
		mav.addObject("m_tel1",m_tel1);
		mav.addObject("m_tel2",m_tel2);
		mav.addObject("m_list",m_list);
		mav.addObject("s_list",s_list);
		mav.setViewName("man/profile/manProfile");
		
		return mav;
	}
	
	@RequestMapping("/manProfile.do")
	public ModelAndView modManProfile(
			ManDTO dto,
			@RequestParam(value="man_ix",required=false,defaultValue="0")int man_ix,
			@RequestParam(value="m_pwd",required=false)String m_pwd,
			MultipartHttpServletRequest multreq) {
		
		ModelAndView mav=new ModelAndView();
			
		//관리자 프로필 수정
		MultipartFile upload=multreq.getFile("picture");
		manCopyInto(man_ix, upload);
		
		//근무자 비밀번호 null값 처리
		if(m_pwd==null||m_pwd.equals("")) {
			dto=mandao.modManProfileForm(man_ix);
		}
		
		int result=mandao.modManProfile(dto);
		String msg=result>0?"프로필 수정이 완료 되었습니다.":"프로필 수정에 실패 하였습니다.";
		mav.addObject("msg",msg);
		mav.setViewName("emp/profile/ProfileMsg");
		return mav;
	}
	
	
	
}
