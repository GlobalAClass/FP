package com.ateam.checkMon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ateam.checkMon.manEmpRun.model.ManEmpRunDAO;

import java.util.*;

@Controller
public class ManPayRollController {
	
	@Autowired
	ManEmpRunDAO merdao;

	// 직원 급여 목록 페이지
	@RequestMapping("/manPayRollList.do")
	public String goManPayRollList() {
		return "man/payRoll/manPayRollList";
	}
	
	
	
}
