package com.ateam.checkMon.manEmpRun.model;

public class AddempDTO {

	private int req_ix;
	private int emp_ix;
	private String e_group;
	private String e_position;
	private String authorization;
	
	public AddempDTO() {
		super();
	}
	public AddempDTO(int req_ix, int emp_ix, String e_group, String e_position, String authorization) {
		super();
		this.req_ix = req_ix;
		this.emp_ix = emp_ix;
		this.e_group = e_group;
		this.e_position = e_position;
		this.authorization = authorization;
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
	public String getE_group() {
		return e_group;
	}
	public void setE_group(String e_group) {
		this.e_group = e_group;
	}
	public String getE_position() {
		return e_position;
	}
	public void setE_position(String e_position) {
		this.e_position = e_position;
	}
	public String getAuthorization() {
		return authorization;
	}
	public void setAuthorization(String authorization) {
		this.authorization = authorization;
	}
	
	
}
