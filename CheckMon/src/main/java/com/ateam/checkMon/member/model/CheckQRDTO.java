package com.ateam.checkMon.member.model;

public class CheckQRDTO {
	private int emp_ix;
	private int store_ix;
	
	
	public CheckQRDTO() {
		super();
	}


	public CheckQRDTO(int emp_ix, int store_ix) {
		super();
		this.emp_ix = emp_ix;
		this.store_ix = store_ix;
	}


	public int getEmp_ix() {
		return emp_ix;
	}


	public void setEmp_ix(int emp_ix) {
		this.emp_ix = emp_ix;
	}


	public int getStore_ix() {
		return store_ix;
	}


	public void setStore_ix(int store_ix) {
		this.store_ix = store_ix;
	}
	

}
