package com.ateam.checkMon.manEmpRun.model;


public class RunListDTO {

	private String req_ix;
	private String e_group;
	private String imgpath;
	private String emp_ix;
	private String e_name;
	private String e_position;
	private String e_tel;
	private String e_email;
	private String authorization;
	private String e_birthday;
	private String regit_day;
	
	public RunListDTO() {
		super();
	}
	public RunListDTO(String req_ix, String e_group, String imgpath, String emp_ix, String e_name, String e_position, String e_tel,
			String e_email, String authorization, String e_birthday, String regit_day) {
		super();
		this.req_ix = req_ix;
		this.e_group = e_group;
		this.imgpath = imgpath;
		this.emp_ix = emp_ix;
		this.e_name = e_name;
		this.e_position = e_position;
		this.e_tel = e_tel;
		this.e_email = e_email;
		this.authorization = authorization;
		this.e_birthday = e_birthday;
		this.regit_day = regit_day;
	}
	
	
	public String getReq_ix() {
		return req_ix;
	}
	public void setReq_ix(String req_ix) {
		this.req_ix = req_ix;
	}
	public String getE_group() {
		return e_group;
	}
	public void setE_group(String e_group) {
		this.e_group = e_group;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getEmp_ix() {
		return emp_ix;
	}
	public void setEmp_ix(String emp_ix) {
		this.emp_ix = emp_ix;
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
	public String getE_tel() {
		return e_tel;
	}
	public void setE_tel(String e_tel) {
		this.e_tel = e_tel;
	}
	public String getE_email() {
		return e_email;
	}
	public void setE_email(String e_email) {
		this.e_email = e_email;
	}
	public String getAuthorization() {
		return authorization;
	}
	public void setAuthorization(String authorization) {
		this.authorization = authorization;
	}
	public String getE_birthday() {
		return e_birthday;
	}
	public void setE_birthday(String e_birthday) {
		this.e_birthday = e_birthday;
	}
	public String getRegit_day() {
		return regit_day;
	}
	public void setRegit_day(String regit_day) {
		this.regit_day = regit_day;
	}
	
	
	
	
}
