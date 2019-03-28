package com.ateam.checkMon.member.model;

import java.util.*;

public interface EmpDAO {

	public int addEmpJoin(EmpDTO dto);
	public String empIdCheck(String eemail);
	
}
