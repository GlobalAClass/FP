package com.ateam.checkMon.empCommute.model;

public class EmpCommuteDTO {

	//근무자 근태정보 인덱스
	private int emp_commute_ix;
	
	//근무자 인덱스
	private int emp_ix;
	
	//근무자 출근 시간
	private String worktime;
	
	//근무자 퇴근 시간
	private String leavetime;
	
	//근무자가 선택한 날짜
	private String workday;
	
	//근무자 근무시간
	private int daytime;
	
	//근무자 근태상태
	private String state;

	public EmpCommuteDTO() {
		super();
	}

	public EmpCommuteDTO(int emp_commute_ix, int emp_ix, String worktime, String leavetime, String workday, int daytime,
			String state) {
		super();
		this.emp_commute_ix = emp_commute_ix;
		this.emp_ix = emp_ix;
		this.worktime = worktime;
		this.leavetime = leavetime;
		this.workday = workday;
		this.daytime = daytime;
		this.state = state;
	}

	public int getEmp_commute_ix() {
		return emp_commute_ix;
	}

	public void setEmp_commute_ix(int emp_commute_ix) {
		this.emp_commute_ix = emp_commute_ix;
	}

	public int getEmp_ix() {
		return emp_ix;
	}

	public void setEmp_ix(int emp_ix) {
		this.emp_ix = emp_ix;
	}

	public String getWorktime() {
		return worktime;
	}

	public void setWorktime(String worktime) {
		this.worktime = worktime;
	}

	public String getLeavetime() {
		return leavetime;
	}

	public void setLeavetime(String leavetime) {
		this.leavetime = leavetime;
	}

	public String getWorkday() {
		return workday;
	}

	public void setWorkday(String workday) {
		this.workday = workday;
	}

	public int getDaytime() {
		return daytime;
	}

	public void setDaytime(int daytime) {
		this.daytime = daytime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
}
