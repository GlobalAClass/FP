package com.ateam.checkMon.member.model;

import java.util.*;

public interface ManDAO {

	public int getNextManIx();
	public int addStoreManJoin(StoreDTO sdto);
	public int addManJoin(ManDTO mdto);
	public String manIdCheck(String m_email);
	public ManDTO manLogin(Map<String,String> map);
	public int manIx(String m_email);
	public String manName(String m_email);
	public int addManPwd(ManDTO dto);
	public String manAutoLogin(String m_email);
}
