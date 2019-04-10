package com.ateam.checkMon.PayRoll.model;

public class WorkTimeDTO {

	private int emp_ix;
	private String startday;
	private String endday;
	//근무자 근태정보 인덱스
	private int emp_commute_ix;
	
	//근무자 출근 시간
	private String worktime;
	
	//근무자 퇴근 시간
	private String leavetime;
	
	//근무자가 선택한 날짜
	private String workday;
	
	public WorkTimeDTO() {
		super();
	}
	public WorkTimeDTO(int emp_ix, String startday, String endday) {
		super();
		this.emp_ix = emp_ix;
		this.startday = startday;
		this.endday = endday;
	}
	
	public WorkTimeDTO(int emp_ix, String startday, String endday, int emp_commute_ix, String worktime,
			String leavetime, String workday) {
		super();
		this.emp_ix = emp_ix;
		this.startday = startday;
		this.endday = endday;
		this.emp_commute_ix = emp_commute_ix;
		this.worktime = worktime;
		this.leavetime = leavetime;
		this.workday = workday;
	}
	
	public int getEmp_ix() {
		return emp_ix;
	}
	public void setEmp_ix(int emp_ix) {
		this.emp_ix = emp_ix;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	public int getEmp_commute_ix() {
		return emp_commute_ix;
	}
	public void setEmp_commute_ix(int emp_commute_ix) {
		this.emp_commute_ix = emp_commute_ix;
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
	
	
}
