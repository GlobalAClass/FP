package com.ateam.checkMon.vacation.model;

public interface VacationDAO {
	
	public int applyVacation(int schedule_ix,int emp_ix,String v_reason_main,String v_reason_detail);

}
