package com.ateam.checkMon.controller;

import java.io.File;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.checkMon.manEmpRun.model.AddempDTO;
import com.ateam.checkMon.manEmpRun.model.GroupDTO;
import com.ateam.checkMon.manEmpRun.model.ManEmpRunDAO;
import com.ateam.checkMon.manEmpRun.model.PositionDTO;
import com.ateam.checkMon.manEmpRun.model.ReqListDTO;
import com.ateam.checkMon.manEmpRun.model.RunListDTO;

@Controller
public class ManEmpRunController {

	@Autowired
	ManEmpRunDAO merdao;

	// 직원 관리 페이지 - (직원승인, 직원목록, 직원검색)
	@RequestMapping("/empReqRunList.do")
	public String goEmpReqRunList() {
		return "man/empRun/empReqRunList";
	}
	
	// 직원 관리 페이지 - (직원승인, 직원목록, 직원검색)
	@RequestMapping("/goList.do")
	public String goList() {
		return "man/empRun/search";
	}

	// 직원 승인 요청 목록
	@RequestMapping("/getReqList.do")
	public ModelAndView getReqList(HttpSession s) {
		int man_ix = (Integer) s.getAttribute("man_ix");
		List<ReqListDTO> list = merdao.getReqList(man_ix);

		String rootpath = s.getServletContext().getRealPath("\\");
		int len = list.size();
		for (int i = 0; i < len; i++) {
			// 근무자 프로필 이미지 list에 set
			File employee = new File(rootpath + "\\assets\\images\\emp\\profile\\" + list.get(i).getEmp_ix());
			File[] files = employee.listFiles();
			String imgpath;
			if (files == null) {
				imgpath = "<img src=assets/images/emp/profile_default.jpg width=35px height=40px>";
			} else {
				imgpath = "<img src=assets/images/emp/profile/" + list.get(i).getEmp_ix() + "\\" + files[0].getName()
						+ " width=35px height=40px>";
			}
			list.get(i).setImgpath(imgpath);
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("data", list);
		mav.setViewName("cmjson");
		return mav;
	}

	// 직원 관리 목록
	@RequestMapping("/getRunList.do")
	public ModelAndView getRunList(HttpSession s) {
		int man_ix = (Integer) s.getAttribute("man_ix");
		List<RunListDTO> list = merdao.getRunList(man_ix);

		String rootpath = s.getServletContext().getRealPath("\\");
		int len = list.size();
		for (int i = 0; i < len; i++) {
			// 근무자 프로필 이미지 list에 set
			File employee = new File(rootpath + "\\assets\\images\\emp\\profile\\" + list.get(i).getEmp_ix());
			File[] files = employee.listFiles();
			String imgpath;
			if (files == null) {
				imgpath = "<img src=assets/images/emp/profile_default.jpg width=35px height=40px>";
			} else {
				imgpath = "<img src=assets/images/emp/profile/" + list.get(i).getEmp_ix() + "\\" + files[0].getName()
						+ " width=35px height=40px>";
			}
			list.get(i).setImgpath(imgpath);
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("data", list);
		mav.setViewName("cmjson");
		return mav;
	}

	// 직원 상세 정보 수정
	@RequestMapping("/modEmp.do")
	public String modEmp() {
		return "man/empRun/empReqRunList";
	}

	// 직원 승인
	@RequestMapping("/addEmp.do")
	public String addEmp() {
		return "man/empRun/empReqRunList";
	}

	// 직원 승인
	@RequestMapping(value = "refuseEmp.do", method = RequestMethod.POST)
	public ModelAndView refuseEmp(@RequestParam(name = "req_ix") int req_ix) {
		int res = merdao.refuseEmp(req_ix);
		String msg = res > 0 ? "승인 요청을 거절했습니다." : "오류로 인해 거절하지 못했습니다.";

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("cmjson");
		return mav;
	}

	// 직책 관리 페이지 - 직책 추가, 삭제
	@RequestMapping("/goPosition.do")
	public String goPosition() {
		return "man/empRun/position";
	}

	// 직책 목록
	@RequestMapping("/getPositionList.do")
	public ModelAndView getPositionList(HttpSession s) {
		int man_ix = (Integer) s.getAttribute("man_ix");
		List<PositionDTO> list = merdao.getPositionList(man_ix);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", list);
		mav.setViewName("cmjson");
		return mav;
	}

	// 직책 추가
	@RequestMapping(value = "addPosition.do", method = RequestMethod.POST)
	public ModelAndView addPosition(HttpSession s, @RequestParam(name = "e_position") String e_position) {
		int man_ix = (Integer) s.getAttribute("man_ix");

		int res_overlap = merdao.checkPositionName(man_ix, e_position);
		int priority = 1;
		int res_add = -1;
		if (res_overlap > 0) {
			priority = merdao.getMaxPri(man_ix);
			res_add = merdao.addPosition(man_ix, e_position, priority);
		}
		String msg;
		if (res_overlap > 0 && res_add > 0) {
			msg = "직책을 추가했습니다.";
		} else if (res_overlap < 0) {
			msg = "직책 이름이 중복됩니다.";
		} else {
			msg = "(오류)직책 추가 실패했습니다.";
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("cmjson");
		return mav;
	}

	// 직책 삭제
	@RequestMapping(value = "delPosition.do", method = RequestMethod.POST)
	public ModelAndView delPosition(@RequestParam(name = "str_position_ix") String str_position_ix) {
		String arr_ix[] = str_position_ix.split(",");

		int res = -1;
		String msg = "삭제했습니다.";
		for (int i = 0; i < arr_ix.length; i++) {
			res = merdao.delPosition(Integer.parseInt(arr_ix[i]));
			if (res < 0) {
				msg = i + "번째 행 삭제 오류입니다.";
				break;
			}
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("cmjson");
		return mav;
	}

	// 그룹 관리 페이지 - 그룹 추가, 삭제
	@RequestMapping("/goGroup.do")
	public String goGroup() {
		return "man/empRun/group";
	}

	// 그룹 목록
	@RequestMapping("/getGroupList.do")
	public ModelAndView getGroupList(HttpSession s) {
		int man_ix = (Integer) s.getAttribute("man_ix");
		List<GroupDTO> list = merdao.getGroupList(man_ix);

		ModelAndView mav = new ModelAndView();
		mav.addObject("data", list);
		mav.setViewName("cmjson");
		return mav;
	}

	// 그룹 추가
	@RequestMapping(value = "addGroup.do", method = RequestMethod.POST)
	public ModelAndView addGroup(HttpSession s, @RequestParam(name = "e_group") String e_group) {
		int man_ix = (Integer) s.getAttribute("man_ix");

		int res_overlap = merdao.checkGroupName(man_ix, e_group);
		int res_add = -1;
		if (res_overlap > 0) {
			res_add = merdao.addGroup(man_ix, e_group);
		}
		String msg;
		if (res_overlap > 0 && res_add > 0) {
			msg = "그룹을 추가했습니다.";
		} else if (res_overlap < 0) {
			msg = "그룹 이름이 중복됩니다.";
		} else {
			msg = "(오류)그룹 추가 실패했습니다.";
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("cmjson");
		return mav;
	}

	// 그룹 삭제
	@RequestMapping(value = "delGroup.do", method = RequestMethod.POST)
	public ModelAndView delGroup(@RequestParam(name = "str_group_ix") String str_group_ix) {
		String arr_ix[] = str_group_ix.split(",");

		int res = -1;
		String msg = "삭제했습니다.";
		for (int i = 0; i < arr_ix.length; i++) {
			res = merdao.delGroup(Integer.parseInt(arr_ix[i]));
			if (res < 0) {
				msg = i + "번째 행 삭제 오류입니다.";
				break;
			}
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("cmjson");
		return mav;
	}
	
	
	// 직책,그룹 이름 목록
	@RequestMapping("/getPGNameList.do")
	public ModelAndView getPGNameList(HttpSession s) {
		int man_ix = (Integer) s.getAttribute("man_ix");
		HashMap<String, String> map = merdao.getPGNameList(man_ix);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg_names", map);
		mav.setViewName("cmjson");
		return mav;
	}
}
