package com.ateam.checkMon.empCommute.model;

import java.util.*;

public interface EmpCommuteDAO {
	
	//근무자 달력확인
	public List<EmpCommuteAllDTO> getCommuteList(int emp_ix);
	//근무자 근태변경신청
	public int addCommuteApply(EmpCommuteApplyDTO dto);
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
