package com.ateam.checkMon.vacation.model;

import java.util.*;

import com.ateam.checkMon.manEmpRun.model.RunListDTO;
import com.ateam.checkMon.member.model.EmpDTO;

public interface VacationDAO {
	
	public HashMap<String, String> getVacationDate(int schedule_ix);
	public int applyVacation(int schedule_ix,int emp_ix,String v_reason_main,String v_reason_detail,String v_date,String v_time);
	public int vacationListEmpSize(int emp_ix);
	public List<HashMap<String,Object>> getVacationListEmp(int listsize,int cp,int emp_ix);
	public HashMap<String,String> getSubstituteEmp(int emp_ix);
	
	public int vacationListSize(int man_ix);
	public List<HashMap<String,Object>> getVacationList(int listsize, int cp, int man_ix);
	
	public List<EmpDTO> getRunList(int man_ix,String year,String month,String day);

	public int updateVacationProg(int vacation_ix);
	public int getNextSub();
	public int insertSub(int next_sub,int vacation_ix,String s_date,String s_time);
	public int insertSubReq(int next_sub,int emp_ix);
	
	
	public int denyVacation(int vacation_ix,String deny_reason);
}
