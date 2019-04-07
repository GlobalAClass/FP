package com.ateam.checkMon.vacation.model;

import java.util.Date;

public class VacationDTO {
	
	// 휴가 정보 인덱스 
    private Integer vacation_ix;

    // 스케줄 인덱스
    private Integer schedule_ix;

    // 휴가 신청한 근무자 인덱스 
    private Integer v_apply_emp_ix;

    // 대리 근무자 인덱스 
    private Integer v_substitute_emp_ix;

    // 휴가 요청한 당시 날짜 
    private Date v_apply_date;

    // 휴가 신청 사유 
    private String v_reason_main;

    // 휴가 신청 사유 - 세부 
    private String v_reason_detail;

    // 휴가 처리 진행 상황 
    private String v_progress;

    // 반려 사유 
    private String v_deny_reason;
    

	public VacationDTO() {
		super();
	}



	public VacationDTO(Integer vacation_ix, Integer schedule_ix, Integer v_apply_emp_ix, Integer v_substitute_emp_ix,
			Date v_apply_date, String v_reason_main, String v_reason_detail, String v_progress, String v_deny_reason) {
		super();
		this.vacation_ix = vacation_ix;
		this.schedule_ix = schedule_ix;
		this.v_apply_emp_ix = v_apply_emp_ix;
		this.v_substitute_emp_ix = v_substitute_emp_ix;
		this.v_apply_date = v_apply_date;
		this.v_reason_main = v_reason_main;
		this.v_reason_detail = v_reason_detail;
		this.v_progress = v_progress;
		this.v_deny_reason = v_deny_reason;
	}



	public Integer getVacation_ix() {
		return vacation_ix;
	}



	public void setVacation_ix(Integer vacation_ix) {
		this.vacation_ix = vacation_ix;
	}



	public Integer getSchedule_ix() {
		return schedule_ix;
	}



	public void setSchedule_ix(Integer schedule_ix) {
		this.schedule_ix = schedule_ix;
	}



	public Integer getV_apply_emp_ix() {
		return v_apply_emp_ix;
	}



	public void setV_apply_emp_ix(Integer v_apply_emp_ix) {
		this.v_apply_emp_ix = v_apply_emp_ix;
	}



	public Integer getV_substitute_emp_ix() {
		return v_substitute_emp_ix;
	}



	public void setV_substitute_emp_ix(Integer v_substitute_emp_ix) {
		this.v_substitute_emp_ix = v_substitute_emp_ix;
	}



	public Date getV_apply_date() {
		return v_apply_date;
	}



	public void setV_apply_date(Date v_apply_date) {
		this.v_apply_date = v_apply_date;
	}



	public String getV_reason_main() {
		return v_reason_main;
	}



	public void setV_reason_main(String v_reason_main) {
		this.v_reason_main = v_reason_main;
	}



	public String getV_reason_detail() {
		return v_reason_detail;
	}



	public void setV_reason_detail(String v_reason_detail) {
		this.v_reason_detail = v_reason_detail;
	}



	public String getV_progress() {
		return v_progress;
	}



	public void setV_progress(String v_progress) {
		this.v_progress = v_progress;
	}



	public String getV_deny_reason() {
		return v_deny_reason;
	}



	public void setV_deny_reason(String v_deny_reason) {
		this.v_deny_reason = v_deny_reason;
	}
    
    


}
