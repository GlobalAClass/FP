package com.ateam.checkMon.member.model;

public class ManDTO {

	//관리자 인덱스
	private int man_ix;
	
	//관리자 아이디(이메일)
	private String m_email;
	
	//관리자 비밀번호
	private String m_pwd;
	
	//관리자 이름
	private String m_name;
	
	//관리자 핸드폰번호
	private String m_tel;
	
	//관리자 사업자등록번호
	private String corporate_number;
	
	//매장정보 인덱스
	private int store_ix;
	
	//관리자 랜덤 비밀번호
	private String m_rpwd;

	public ManDTO() {
		super();
	}

	public ManDTO(int man_ix, String m_email, String m_pwd, String m_name, String m_tel, String corporate_number, int store_ix, String m_rpwd) {
		super();
		this.man_ix = man_ix;
		this.m_email = m_email;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_tel = m_tel;
		this.corporate_number = corporate_number;
		this.store_ix = store_ix;
	}

	public int getMan_ix() {
		return man_ix;
	}

	public void setMan_ix(int man_ix) {
		this.man_ix = man_ix;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getCorporate_number() {
		return corporate_number;
	}

	public void setCorporate_number(String corporate_number) {
		this.corporate_number = corporate_number;
	}

	public int getStore_ix() {
		return store_ix;
	}

	public void setStore_ix(int store_ix) {
		this.store_ix = store_ix;
	}

	public String getM_rpwd() {
		return m_rpwd;
	}

	public void setM_rpwd(String m_rpwd) {
		this.m_rpwd = m_rpwd;
	}
	
	
}
