package com.ateam.checkMon.member.model;

public class StoreDTO {
	
	//매장 인덱스
	private int storeIx;
	
	//관리자 인덱스
	private int manIx;
	
	//매장 이름
	private String storename;
	
	//매장 주소
	private String storeaddr;
	
	//매장 위도
	private String mlatitude;
	
	//매장 경도
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
