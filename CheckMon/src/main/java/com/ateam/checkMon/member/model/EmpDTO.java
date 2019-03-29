package com.ateam.checkMon.member.model;

public class EmpDTO {
	
	//근무자 인덱스
	private int emp_Ix;
	
	//관리자 인덱스
	private int man_Ix;
	
	//근무자 아이디(이메일)
	private String e_email;
	
	//근무자 비밀번호
	private String e_pwd;
	
	//근무자 이름
	private String e_name;
	
	//근무자 핸드폰 번호
	private String e_tel;
	
	//근무자 생년월일
	private String e_birthDay;
	
	//근무자 직책
	private String e_position;
	
	//근무자 그룹
	private String e_group;
	
	//근무자 관리자 권한여부
	private String authorization;
	
	//근무자 랜덤 비밀번호
	private String e_rpwd;
	
	public EmpDTO() {
		super();
	}

	public EmpDTO(int emp_Ix, int man_Ix, String e_email, String e_pwd, String e_name, String e_tel, String e_birthDay,
			String e_position, String e_group, String authorization, String e_rpwd) {
		super();
		this.emp_Ix = emp_Ix;
		this.man_Ix = man_Ix;
		this.e_email = e_email;
		this.e_pwd = e_pwd;
		this.e_name = e_name;
		this.e_tel = e_tel;
		this.e_birthDay = e_birthDay;
		this.e_position = e_position;
		this.e_group = e_group;
		this.authorization = authorization;
		this.e_rpwd = e_rpwd;
	}

	public int getEmp_Ix() {
		return emp_Ix;
	}

	public void setEmp_Ix(int emp_Ix) {
		this.emp_Ix = emp_Ix;
	}

	public int getMan_Ix() {
		return man_Ix;
	}

	public void setMan_Ix(int man_Ix) {
		this.man_Ix = man_Ix;
	}

	public String getE_email() {
		return e_email;
	}

	public void setE_email(String e_email) {
		this.e_email = e_email;
	}

	public String getE_pwd() {
		return e_pwd;
	}

	public void setE_pwd(String e_pwd) {
		this.e_pwd = e_pwd;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	public String getE_tel() {
		return e_tel;
	}

	public void setE_tel(String e_tel) {
		this.e_tel = e_tel;
	}

	public String getE_birthDay() {
		return e_birthDay;
	}

	public void setE_birthDay(String e_birthDay) {
		this.e_birthDay = e_birthDay;
	}

	public String getE_position() {
		return e_position;
	}

	public void setE_position(String e_position) {
		this.e_position = e_position;
	}

	public String getE_group() {
		return e_group;
	}

	public void setE_group(String e_group) {
		this.e_group = e_group;
	}

	public String getAuthorization() {
		return authorization;
	}

	public void setAuthorization(String authorization) {
		this.authorization = authorization;
	}

	public String getE_rpwd() {
		return e_rpwd;
	}

	public void setE_rpwd(String e_rpwd) {
		this.e_rpwd = e_rpwd;
	}

	
	
	
}
