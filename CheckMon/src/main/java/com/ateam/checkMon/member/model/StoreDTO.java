package com.ateam.checkMon.member.model;

public class StoreDTO {
	
	//매장정보 인덱스
	private int store_ix;
	
	//매장이름
	private String store_name;
	
	//매장주소
	private String store_addr;
	
	//위도
	private String m_latitude;
	
	//경도
	private String m_longitude;
	
	//관리자 인덱스
	private int man_ix;
	
	public StoreDTO() {
		super();
	}

	public StoreDTO(int store_ix, String store_name, String store_addr, String m_latitude, String m_longitude, int man_ix) {
		super();
		this.store_ix = store_ix;
		this.store_name = store_name;
		this.store_addr = store_addr;
		this.m_latitude = m_latitude;
		this.m_longitude = m_longitude;
		this.man_ix = man_ix;
	}

	public int getStore_ix() {
		return store_ix;
	}

	public void setStore_ix(int store_ix) {
		this.store_ix = store_ix;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_addr() {
		return store_addr;
	}

	public void setStore_addr(String store_addr) {
		this.store_addr = store_addr;
	}

	public String getM_latitude() {
		return m_latitude;
	}

	public void setM_latitude(String m_latitude) {
		this.m_latitude = m_latitude;
	}

	public String getM_longitude() {
		return m_longitude;
	}

	public void setM_longitude(String m_longitude) {
		this.m_longitude = m_longitude;
	}

	public int getMan_ix() {
		return man_ix;
	}

	public void setMan_ix(int man_ix) {
		this.man_ix = man_ix;
	}
	
	
	
	
}
