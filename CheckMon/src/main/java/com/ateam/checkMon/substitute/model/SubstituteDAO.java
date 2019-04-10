package com.ateam.checkMon.substitute.model;

import java.util.*;

import com.ateam.checkMon.schedule.model.ScheduleDTO;

public interface SubstituteDAO {
	
	public List<HashMap<String,Object>> getSubstituteList(int emp_ix);
	public int updateSubReq(int substitute_req_ix);
	public int getManSubIX(int emp_ix);
	public int insertSubSchedule(ScheduleDTO dto);
	public int updateVacationInfo(int emp_ix,int substitute_req_ix);
	public int deleteSubEmps(int substitute_req_ix,int emp_ix);
	public int deleteEmpSchedule(int substitute_req_ix);

}
