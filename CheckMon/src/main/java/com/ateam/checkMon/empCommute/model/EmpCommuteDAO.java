package com.ateam.checkMon.empCommute.model;

import java.util.*;
import com.ateam.checkMon.schedule.model.ScheduleDTO;

public interface EmpCommuteDAO {
	
	//근무자 달력확인
	public List<EmpCommuteAllDTO> getCommuteList(int emp_ix);
	//근무자 달력에서 근태변경신청
	public int addCommuteApply(EmpCommuteApplyDTO dto);
	//근무자 근태 변경 목록 페이지
	public int commuteListSize(int emp_ix);
	public List<EmpCommuteAllDTO> getCommuteApplyList(int listsize, int cp,int emp_ix);
	
	

	//관리자 = 당일 근무자 출퇴근 현황보기
	public int getDayCommuteListSize(int man_ix);
	public List<EmpCommuteAllDTO> getDayCommuteList(int listsize,int cp,int man_ix);
	public int setDayState(EmpCommuteDTO dto);
	//관리자 = 출퇴근기록관리 페이지 및 출퇴근 시간 정보 수정
	public List<EmpCommuteAllDTO> getCommuteAllList(int man_ix);
	public int modCommuteList(EmpCommuteDTO dto);
	//관리자  = 근무자 근태 변경 신청 목록 페이지
	public int CommuteApplyAllListSize(int man_ix);
	public List<EmpCommuteAllDTO> getCommuteApplyAllList(int listsize,int cp,int man_ix);
	//관리자 = 근무자 근태 변경 신청 반려사유 보내기
	public int addCommuteApplyReturn(EmpCommuteApplyDTO dto);
	public int addCommuteApplyProgress(EmpCommuteApplyDTO dto);
	//관리자 = 근무자 근태 변경 신청 승인시 시간 변경
	public int setCommuteWorkTime(EmpCommuteDTO dto);
	int insertWorkdayState(EmpCommuteDTO dto);
}
