package com.ateam.checkMon.manEmpRun.model;

import java.util.*;

public interface ManEmpRunDAO {
	
	public int addManEmpRun(ManEmpRunDTO rdto);
	public List<ReqListDTO> getReqList(int man_ix);
	public List<RunListDTO> getRunList(int man_ix);
	int refuseEmp(int req_ix);
	List<GroupDTO> getGroupList(int man_ix);
	List<PositionDTO> getPositionList(int man_ix);
	int checkGroupName(int man_ix, String e_group);
	int addGroup(int man_ix, String e_group);
	int delGroup(int group_ix);
	int checkPositionName(int man_ix, String e_Position);
	int delPosition(int position_ix);
	int getMaxPri(int man_ix);
	int addPosition(int man_ix, String e_position, int priority);
	HashMap<String, String> getPGNameList(int man_ix);
}
