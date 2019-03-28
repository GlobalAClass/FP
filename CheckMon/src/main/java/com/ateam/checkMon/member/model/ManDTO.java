package com.ateam.checkMon.member.model;

public class ManDTO {

	//������ �ε���
	private int manIx;
	
	//������ �̸���
	private String memail;
	
	//������ ��й�ȣ
	private String mpwd;
	
	//������ �̸�
	private String mname;
	
	//������ �ڵ�����ȣ
	private String mtel;
	
	//����� ��Ϲ�ȣ
	private String cornum;
	
	//���� �ε���
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
