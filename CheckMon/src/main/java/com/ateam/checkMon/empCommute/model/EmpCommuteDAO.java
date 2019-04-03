package com.ateam.checkMon.empCommute.model;

import java.util.*;

public interface EmpCommuteDAO {

	public int commuteListSize();
	public List<EmpCommuteAllDTO> getCommuteAllList(int listsize, int cp,int emp_ix);
}
