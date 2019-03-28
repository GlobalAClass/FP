package com.ateam.checkMon.member.model;

public class StoreDTO {
	
	//���� �ε���
	private int storeIx;
	
	//������ �ε���
	private int manIx;
	
	//���� �̸�
	private String storename;
	
	//���� �ּ�
	private String storeaddr;
	
	//���� ����
	private String mlatitude;
	
	//���� �浵
	private String mlongitude;

	public StoreDTO() {
		super();
	}

	public StoreDTO(int storeIx, int manIx, String storename, String storeaddr, String mlatitude, String mlongitude) {
		super();
		this.storeIx = storeIx;
		this.manIx = manIx;
		this.storename = storename;
		this.storeaddr = storeaddr;
		this.mlatitude = mlatitude;
		this.mlongitude = mlongitude;
	}

	public int getStoreIx() {
		return storeIx;
	}

	public void setStoreIx(int storeIx) {
		this.storeIx = storeIx;
	}

	public int getManIx() {
		return manIx;
	}

	public void setManIx(int manIx) {
		this.manIx = manIx;
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
