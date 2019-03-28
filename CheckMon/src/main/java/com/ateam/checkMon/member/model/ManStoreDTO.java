package com.ateam.checkMon.member.model;

public class ManStoreDTO {

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
	
	//���� �̸�
	private String storename;
	
	//���� �ּ�
	private String storeaddr;
	
	//���� ����
	private String mlatitude;
	
	//���� �浵
	private String mlongitude;

	public ManStoreDTO() {
		super();
	}

	public ManStoreDTO(int manIx, String memail, String mpwd, String mname, String mtel, String cornum, int storeIx,
			String storename, String storeaddr, String mlatitude, String mlongitude) {
		super();
		this.manIx = manIx;
		this.memail = memail;
		this.mpwd = mpwd;
		this.mname = mname;
		this.mtel = mtel;
		this.cornum = cornum;
		this.storeIx = storeIx;
		this.storename = storename;
		this.storeaddr = storeaddr;
		this.mlatitude = mlatitude;
		this.mlongitude = mlongitude;
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

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	public String getStoreaddr() {
		return storeaddr;
	}

	public void setStoreaddr(String storeaddr) {
		this.storeaddr = storeaddr;
	}

	public String getMlatitude() {
		return mlatitude;
	}

	public void setMlatitude(String mlatitude) {
		this.mlatitude = mlatitude;
	}

	public String getMlongitude() {
		return mlongitude;
	}

	public void setMlongitude(String mlongitude) {
		this.mlongitude = mlongitude;
	}
	
	
	
}
