package com.ateam.checkMon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.checkMon.emp.model.EmpDAO;
import com.ateam.checkMon.emp.model.EmpDAOImple;
import com.ateam.checkMon.emp.model.EmpDTO;

import java.util.*;

@Controller
public class EmpController {
	
	@Autowired
	private EmpDAO empDao;

	@RequestMapping("/emp.do")
	public String goEmp() {
		return "emp/emp";
	}
	
	@RequestMapping("/empAdd.do")
	public ModelAndView empAdd(EmpDTO dto) {
		int result = empDao.empAdd(dto);
		String msg=result>0?"사원등록 성공!":"사원등록 실패!";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("emp/empMsg");
		return mav;
	}
	
	@RequestMapping("/empDel.do")
	public ModelAndView empDel(@RequestParam("name")String name) {
		int result = empDao.empDel(name);
		String msg=result>0?"사원삭제 성공!":"사원삭제 실패!";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("emp/empMsg");
		return mav;
	}
	
	@RequestMapping("/empList.do")
	public ModelAndView empList() {
		List<EmpDTO> list = empDao.empList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("emp/empList");
		return mav;
	}
	
	@RequestMapping("/empSelect.do")
	public ModelAndView empSelect(@RequestParam("name")String name) {
		List<EmpDTO> list = empDao.empSelect(name);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("emp/empList");
		return mav;
	}
	
	
	@RequestMapping(value="/empModify.do", method=RequestMethod.GET)
	public ModelAndView empModifyForm(@RequestParam("idx")int idx) {
		EmpDTO dto = empDao.empModifyForm(idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("emp/empModify");
		return mav;
	}
	
	@RequestMapping(value="/empModify.do", method=RequestMethod.POST)
	public ModelAndView empModify(EmpDTO dto) {
		int res = empDao.empModify(dto);
		String msg = res>0?"사원 수정 성공!":"사원 수정 실패!";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("emp/empMsg");
		return mav;
	}
}
