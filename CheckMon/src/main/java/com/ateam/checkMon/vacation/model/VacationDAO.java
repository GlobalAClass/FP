package com.ateam.checkMon.vacation.model;

import java.util.*;

public interface VacationDAO {
	
	public int applyVacation(int schedule_ix,int emp_ix,String v_reason_main,String v_reason_detail);
	public int vacationListEmpSize(int emp_ix);
	public List<HashMap<String,Object>> getVacationListEmp(int listsize,int cp,int emp_ix);
	public HashMap<String,String> getSubstituteEmp(int emp_ix);
	
	public int vacationListSize(int man_ix);
	public List<HashMap<String,Object>> getVacationList(int listsize, int cp, int man_ix);
}
