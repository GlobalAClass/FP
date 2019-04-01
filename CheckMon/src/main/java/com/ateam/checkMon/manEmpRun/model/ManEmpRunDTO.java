package com.ateam.checkMon.manEmpRun.model;

import java.util.Date;

public class ManEmpRunDTO {

	// 직원 요청 인덱스 
    private int req_ix;

    // 근무자 인덱스 
    private int emp_ix;

    // 요청한 매장 
    private int req_store;

    // 직원 승인 일 
    private Date regit_day;

    // 관리자 인덱스 
    private int man_ix;

	public ManEmpRunDTO() {
		super();
	}

	public ManEmpRunDTO(int req_ix, int emp_ix, int req_store, Date regit_day, int man_ix) {
		super();
		this.req_ix = req_ix;
		this.emp_ix = emp_ix;
		this.req_store = req_store;
		this.regit_day = regit_day;
		this.man_ix = man_ix;
	}

	public int getReq_ix() {
		return req_ix;
	}

	public void setReq_ix(int req_ix) {
		this.req_ix = req_ix;
	}

	public int getEmp_ix() {
		return emp_ix;
	}

	public void setEmp_ix(int emp_ix) {
		this.emp_ix = emp_ix;
	}

	public int getReq_store() {
		return req_store;
	}

	public void setReq_store(int req_store) {
		this.req_store = req_store;
	}

	public Date getRegit_day() {
		return regit_day;
	}

	public void setRegit_day(Date regit_day) {
		this.regit_day = regit_day;
	}

	public int getMan_ix() {
		return man_ix;
	}

	public void setMan_ix(int man_ix) {
		this.man_ix = man_ix;
	}
    
    
    
    
}
