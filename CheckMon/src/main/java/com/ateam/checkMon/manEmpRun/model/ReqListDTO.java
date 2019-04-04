package com.ateam.checkMon.manEmpRun.model;

import java.util.Date;

public class ReqListDTO {

	// 직원 요청 인덱스 
    private int req_ix;

    // 근무자 인덱스 
    private int emp_ix;
    
    // 근무자 이름
    private String e_name;
    
    // 생년월일
    private String e_birthday;
    
    // 전화번호
    private String e_tel;
    
    // 이메일
    private String e_email;
    
    // 이미지 경로
    private String imgpath;

	public ReqListDTO() {
		super();
	}

	public ReqListDTO(int req_ix, int emp_ix, String e_name, String e_birthday, String e_tel, String e_email, String imgpath) {
		super();
		this.req_ix = req_ix;
		this.emp_ix = emp_ix;
		this.e_name = e_name;
		this.e_birthday = e_birthday;
		this.e_tel = e_tel;
		this.e_email = e_email;
		this.imgpath = imgpath;
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

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	public String getE_birthday() {
		return e_birthday;
	}

	public void setE_birthday(String e_birthday) {
		this.e_birthday = e_birthday;
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

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
    
    
}
