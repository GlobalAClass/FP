package com.ateam.checkMon.substitute.model;

public class SubstituteDTO {
	
	// 대리 근무 인덱스 
    private Integer substitute_ix;

    // 휴가 정보 인덱스 
    private Integer vacation_ix;

    // 요청 받은 날짜 
    private String s_date;

    // 요청 받은 시간대 
    private String s_time;
    
    // 관계 테이블 인덱스
    private Integer substitute_request_ix;
    
    //관계 테이블 상태값
    private String s_progress;

	public SubstituteDTO() {
		super();
	}

	public SubstituteDTO(Integer substitute_ix, Integer vacation_ix, String s_date, String s_time) {
		super();
		this.substitute_ix = substitute_ix;
		this.vacation_ix = vacation_ix;
		this.s_date = s_date;
		this.s_time = s_time;
	}

	public Integer getSubstitute_ix() {
		return substitute_ix;
	}

	public void setSubstitute_ix(Integer substitute_ix) {
		this.substitute_ix = substitute_ix;
	}

	public Integer getVacation_ix() {
		return vacation_ix;
	}

	public void setVacation_ix(Integer vacation_ix) {
		this.vacation_ix = vacation_ix;
	}

	public String getS_date() {
		return s_date;
	}

	public void setS_date(String s_date) {
		this.s_date = s_date;
	}

	public String getS_time() {
		return s_time;
	}

	public void setS_time(String s_time) {
		this.s_time = s_time;
	}

	public Integer getSubstitute_request_ix() {
		return substitute_request_ix;
	}

	public void setSubstitute_request_ix(Integer substitute_request_ix) {
		this.substitute_request_ix = substitute_request_ix;
	}

	public String getS_progress() {
		return s_progress;
	}

	public void setS_progress(String s_progress) {
		this.s_progress = s_progress;
	}
    
    

}
