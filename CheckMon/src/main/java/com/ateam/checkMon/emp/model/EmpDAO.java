package com.ateam.checkMon.emp.model;

import java.util.*;

public interface EmpDAO {
	
	public int empAdd(EmpDTO dto);
	public int empDel(String name);
	public List<EmpDTO> empList();
	public List<EmpDTO> empSelect(String name);
	public EmpDTO empModifyForm(int idx);
	public int empModify(EmpDTO dto);
}
