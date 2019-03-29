package com.ateam.checkMon.member.model;

import java.util.*;

public interface EmpDAO {

	public int addEmpJoin(EmpDTO dto);
	public String empIdCheck(String eemail);
	public List<EmpDTO> empLogin(Map<String,String> map);
	public String empName(String eeamil);
}
