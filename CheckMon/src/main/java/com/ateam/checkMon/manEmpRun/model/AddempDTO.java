package com.ateam.checkMon.manEmpRun.model;

public class AddempDTO {

	private int man_ix;
	private int emp_ix;
	private String e_group;
	private String e_position;
	private String autorization;
	
	public AddempDTO() {
		super();
	}
	public AddempDTO(int man_ix, int emp_ix, String e_group, String e_position, String autorization) {
		super();
		this.man_ix = man_ix;
		this.emp_ix = emp_ix;
		this.e_group = e_group;
		this.e_position = e_position;
		this.autorization = autorization;
	}
	public int getMan_ix() {
		return man_ix;
	}
	public void setMan_ix(int man_ix) {
		this.man_ix = man_ix;
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
	public String getAutorization() {
		return autorization;
	}
	public void setAutorization(String autorization) {
		this.autorization = autorization;
	}
	
	
}
