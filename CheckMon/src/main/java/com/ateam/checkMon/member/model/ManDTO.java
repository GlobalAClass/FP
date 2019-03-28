package com.ateam.checkMon.member.model;

public class ManDTO {

	//관리자 인덱스
	private int manIx;
	
	//관리자 아이디(이메일)
	private String memail;
	
	//관리자 비밀번호
	private String mpwd;
	
	//관리자 이름
	private String mname;
	
	//관리자 핸드폰번호
	private String mtel;
	
	//관리자 사업자등록번호
	private String cornum;
	
	//매장정보 인덱스
	private int storeIx;

	public ManDTO() {
		super();
	}

	public ManDTO(int manIx, String memail, String mpwd, String mname, String mtel, String cornum, int storeIx) {
		super();
		this.manIx = manIx;
		this.memail = memail;
		this.mpwd = mpwd;
		this.mname = mname;
		this.mtel = mtel;
		this.cornum = cornum;
		this.storeIx = storeIx;
	}

	public int getManIx() {
		return manIx;
	}

	public void setManIx(int manIx) {
		this.manIx = manIx;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMpwd() {
		return mpwd;
	}

	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMtel() {
		return mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public String getCornum() {
		return cornum;
	}

	public void setCornum(String cornum) {
		this.cornum = cornum;
	}

	public int getStoreIx() {
		return storeIx;
	}

	public void setStoreIx(int storeIx) {
		this.storeIx = storeIx;
	}
	
	
}
