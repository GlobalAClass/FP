package com.ateam.checkMon.member.model;

public class StoreDTO {
	
	//매장정보 인덱스
	private int storeIx;
	
	//매장이름
	private String storename;
	
	//매장주소
	private String storeaddr;
	
	//위도
	private String mlatitude;
	
	//경도
	private String mlongitude;

	public StoreDTO() {
		super();
	}

	public StoreDTO(int storeIx, String storename, String storeaddr, String mlatitude, String mlongitude) {
		super();
		this.storeIx = storeIx;
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
