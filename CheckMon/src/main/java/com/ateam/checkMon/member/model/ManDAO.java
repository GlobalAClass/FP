package com.ateam.checkMon.member.model;

import java.util.*;

public interface ManDAO {

	public int getNextManIx();
	public int addStoreManJoin(StoreDTO sdto);
	public int addManJoin(ManDTO mdto);
	public String manIdCheck(String m_email);
	public List<ManDTO> manLogin(Map<String,String> map);
	public String manName(String m_email);
	
}
