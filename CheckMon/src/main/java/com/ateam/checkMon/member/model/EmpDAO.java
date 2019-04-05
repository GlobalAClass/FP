package com.ateam.checkMon.member.model;

import java.util.*;

public interface EmpDAO {

	public int getNextEmpIx();
	public int addEmpJoin(EmpDTO dto);
	public String empIdCheck(String e_email);
	public EmpDTO empLogin(Map<String,String> map);
	public String empName(String e_email);
	public int empIx(String e_email);
	public HashMap<String, String> getStoreLocation(int emp_ix);
	public int addEmpPwd(EmpDTO dto);
	public String empAutoLogin(String e_email);
	public List<StoreDTO> getStoreList(String searchStore);
	public EmpDTO modEmpProfileForm(int emp_ix);
	public int modEmpProfile(EmpDTO dto);
	boolean checkQRAndStorIx(CheckQRDTO temp);
}
