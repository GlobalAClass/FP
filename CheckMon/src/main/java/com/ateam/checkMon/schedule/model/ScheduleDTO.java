package com.ateam.checkMon.schedule.model;

public class ScheduleDTO {

    // 스케줄 인덱스 
    private Integer schedule_ix;

    // 근무자 인덱스 
    private Integer emp_ix;

    // 년도 
    private String s_year;

    // 월 
    private String s_month;

    // 일 
    private String s_day;

    // 근무 시작 시간 해당 스케줄 근무 시작 시간
    private String s_start_time;

    // 근무 마감 시간 해당 스케줄 근무 마감 시간
    private String s_end_time;

	public ScheduleDTO() {
		super();
	}

	public ScheduleDTO(Integer schedule_ix, Integer emp_ix, String s_year, String s_month, String s_day,
			String s_start_time, String s_end_time) {
		super();
		this.schedule_ix = schedule_ix;
		this.emp_ix = emp_ix;
		this.s_year = s_year;
		this.s_month = s_month;
		this.s_day = s_day;
		this.s_start_time = s_start_time;
		this.s_end_time = s_end_time;
	}
	
	public ScheduleDTO(Integer emp_ix, String s_year, String s_month, String s_day,
			String s_start_time, String s_end_time) {
		super();
		this.emp_ix = emp_ix;
		this.s_year = s_year;
		this.s_month = s_month;
		this.s_day = s_day;
		this.s_start_time = s_start_time;
		this.s_end_time = s_end_time;
	}

	public Integer getSchedule_ix() {
		return schedule_ix;
	}

	public void setSchedule_ix(Integer schedule_ix) {
		this.schedule_ix = schedule_ix;
	}

	public Integer getEmp_ix() {
		return emp_ix;
	}

	public void setEmp_ix(Integer emp_ix) {
		this.emp_ix = emp_ix;
	}

	public String getS_year() {
		return s_year;
	}

	public void setS_year(String s_year) {
		this.s_year = s_year;
	}

	public String getS_month() {
		return s_month;
	}

	public void setS_month(String s_month) {
		this.s_month = s_month;
	}

	public String getS_day() {
		return s_day;
	}

	public void setS_day(String s_day) {
		this.s_day = s_day;
	}

	public String getS_start_time() {
		return s_start_time;
	}

	public void setS_start_time(String s_start_time) {
		this.s_start_time = s_start_time;
	}

	public String getS_end_time() {
		return s_end_time;
	}

	public void setS_end_time(String s_end_time) {
		this.s_end_time = s_end_time;
	}

	
    


}
