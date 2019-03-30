package com.ateam.checkMon.member.model;

import java.util.*;

public interface EmpDAO {

	public int addEmpJoin(EmpDTO dto);
	public String empIdCheck(String e_email);
	public List<EmpDTO> empLogin(Map<String,String> map);
	public String empName(String e_email);
	boolean checkQRAndStorIx(String e_email, String storeIx);
	public int addEmpPwd(EmpDTO dto);
	public String empAutoLogin(String e_email);
}
