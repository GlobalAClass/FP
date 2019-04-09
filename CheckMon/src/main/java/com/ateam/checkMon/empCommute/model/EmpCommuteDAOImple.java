package com.ateam.checkMon.empCommute.model;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;
import com.ateam.checkMon.schedule.model.ScheduleDTO;

public class EmpCommuteDAOImple implements EmpCommuteDAO {

	private SqlSessionTemplate sqlMap;

	public EmpCommuteDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	//근무자 달력 확인
	public List<EmpCommuteAllDTO> getCommuteList(int emp_ix) {
		List<EmpCommuteAllDTO> list=sqlMap.selectList("getCommuteListSQL",emp_ix);
		return list;
	}
	
	//근무자 근태 변경 신청
	public int addCommuteApply(EmpCommuteApplyDTO dto) {
		int res=sqlMap.insert("addCommuteApplySQL",dto);
		return res;
	}
	
	//근무자와 관리자 근태변경 목록 페이징 위한 개수 가져오기
	public int commuteListSize(int emp_ix) {
		int temp=sqlMap.selectOne("commuteListSizeSQL",emp_ix);
		return temp;
	}
	
	//근무자 근태 변경 목록 확인하기
	public List<EmpCommuteAllDTO> getCommuteApplyList(int listsize, int cp,int emp_ix) {
		HashMap<String,Integer> map=new HashMap<String, Integer>();
		map.put("listsize",listsize);
		map.put("cp",cp);
		map.put("emp_ix",emp_ix);
		
		List<EmpCommuteAllDTO> list=sqlMap.selectList("getCommuteApplyListSQL",map);
		return list;
	}
	
	
	
	
	//관리자 = 근무자의 당일 근태 현황 페이징 위한 개수 확인하기
	public int getDayCommuteListSize(int man_ix) {
		int res=sqlMap.selectOne("getDayCommuteListSizeSQL",man_ix);
		return res;
	}
	
	//관리자 = 근무자의 당일 근태 현황 보기
	public List<EmpCommuteAllDTO> getDayCommuteList(int listsize, int cp, int man_ix) {
		HashMap<String,Integer> map=new HashMap<String, Integer>();
		map.put("listsize",listsize);
		map.put("cp",cp);
		map.put("man_ix",man_ix);
		
		List<EmpCommuteAllDTO> list=sqlMap.selectList("getDayCommuteListSQL",map);
		return list;
	}
	
	//관리자 = 출퇴근 기록 관리 페이지
	public List<EmpCommuteAllDTO> getCommuteAllList(int man_ix) {
		List<EmpCommuteAllDTO> list=sqlMap.selectList("getCommuteAllListSQL",man_ix);
		return list;
	}
	
	//관리자 = 출퇴근 기록 관리 출퇴근 정보 수정
	public int modCommuteList(EmpCommuteDTO dto) {
		int res=sqlMap.update("modCommuteListSQL",dto);
		return res;
	}
	
	//관리자 = 모든 근무자의 근태 변경 목록 페에징 위한 개수 확인
	public int CommuteApplyAllListSize(int man_ix) {
		int res=sqlMap.selectOne("CommuteApplyAllListSizeSQL",man_ix);
		return res;
	}
	//관리자 =  모든 근무자의 근태 변경 목록 확인하기
	public List<EmpCommuteAllDTO> getCommuteApplyAllList(int listsize, int cp,int man_ix) {
		HashMap<String,Integer> map=new HashMap<String, Integer>();
		map.put("listsize",listsize);
		map.put("cp",cp);
		map.put("man_ix",man_ix);
		
		List<EmpCommuteAllDTO> list=sqlMap.selectList("getCommuteApplyAllListSQL",map);
		return list;
	}
	
	//관리자 = 근무자에게 반려 사유 보내기
	public int addCommuteApplyReturn(EmpCommuteApplyDTO dto) {
		int res=sqlMap.update("addCommuteApplyReturnSQL",dto);
		return res;
	}
	
	//관리자 = 처리상태 승인 /반려 DB값 저장
	public int addCommuteApplyProgress(EmpCommuteApplyDTO dto) {
		int res=sqlMap.update("addCommuteApplyProgressSQL",dto);
		return res;
	}
	
	//관리자 = 처리상태 승인시 시간 변경
	public int setCommuteWorkTime(EmpCommuteDTO dto) {
		int res=sqlMap.update("setCommuteWorkTimeSQL",dto);
		return res;
	}
	
}
