package com.ateam.checkMon.member.model;

import java.util.*;

public interface ManDAO {

	public int addManJoin(ManDTO mdto,StoreDTO sdto);
	public String manIdCheck(String memail);
	
}
