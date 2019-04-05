package com.ateam.checkMon.empCommute.model;

public class EmpCommuteAllDTO {

	//근무자 근태정보 인덱스
	private int emp_commute_ix;
		
	//근무자 인덱스
	private int emp_ix;
	
	//근태 변경 신청 인덱스
	private int emp_change_ix;
		
	//근무자 이름
	private String e_name;
	
	//근무자 직책
	private String e_position;
	
	//근무자 출근 시간
	private String worktime;
		
	//근무자 퇴근 시간
	private String leavetime;
		
	//근무자가 선택한 날짜
	private String workday;
		
	//근무자 근무시간
	private String daytime;
		
	//근무자 근태상태
	private String state;
	
	//변경 요청 출근시간
	private String c_worktime;
		
	//변경 요청 퇴근시간
	private String c_leavetime;
		
	//제목
	private String title;
		
	//사유
	private String reason;
		
	//처리상태
	private String progress;
		
	//반려사유
	private String c_return;

	public EmpCommuteAllDTO() {
		super();
	}

	public EmpCommuteAllDTO(int emp_commute_ix, int emp_ix, int emp_change_ix, String e_name, String e_position,
			String worktime, String leavetime, String workday, String daytime, String state, String c_worktime,
			String c_leavetime, String title, String reason, String progress, String c_return) {
		super();
		this.emp_commute_ix = emp_commute_ix;
		this.emp_ix = emp_ix;
		this.emp_change_ix = emp_change_ix;
		this.e_name = e_name;
		this.e_position = e_position;
		this.worktime = worktime;
		this.leavetime = leavetime;
		this.workday = workday;
		this.daytime = daytime;
		this.state = state;
		this.c_worktime = c_worktime;
		this.c_leavetime = c_leavetime;
		this.title = title;
		this.reason = reason;
		this.progress = progress;
		this.c_return = c_return;
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

	public int getEmp_change_ix() {
		return emp_change_ix;
	}

	public void setEmp_change_ix(int emp_change_ix) {
		this.emp_change_ix = emp_change_ix;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	public String getE_position() {
		return e_position;
	}

	public void setE_position(String e_position) {
		this.e_position = e_position;
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

	public String getDaytime() {
		return daytime;
	}

	public void setDaytime(String daytime) {
		this.daytime = daytime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getC_worktime() {
		return c_worktime;
	}

	public void setC_worktime(String c_worktime) {
		this.c_worktime = c_worktime;
	}

	public String getC_leavetime() {
		return c_leavetime;
	}

	public void setC_leavetime(String c_leavetime) {
		this.c_leavetime = c_leavetime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public String getC_return() {
		return c_return;
	}

	public void setC_return(String c_return) {
		this.c_return = c_return;
	}

}
