package com.ateam.checkMon.empCommute.model;

import java.util.*;

public interface EmpCommuteDAO {

	//근무자 페이지
	public int commuteListSize(int emp_ix);
	public List<EmpCommuteAllDTO> getCommuteAllList(int listsize, int cp,int emp_ix);
	
	
	//관리자 페이지
	public int getDayCommuteListSize();
	public List<EmpCommuteAllDTO> getDayCommuteList(int listsize,int cp,int man_ix);
	public int CommuteApplyAllListSize();
	public List<EmpCommuteAllDTO> getCommuteApplyAllList(int listsize,int cp,int man_ix);
	public int addCommuteApplyReturn(EmpCommuteApplyDTO dto);
	public int addCommuteApplyProgress(EmpCommuteApplyDTO dto);
}
