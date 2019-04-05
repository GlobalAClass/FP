package com.ateam.checkMon.empCommute.model;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;

public class EmpCommuteDAOImple implements EmpCommuteDAO {

	private SqlSessionTemplate sqlMap;

	public EmpCommuteDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	//근무자와 관리자 근태변경 목록 페이징 위한 개수 가져오기
	public int commuteListSize() {
		int temp=sqlMap.selectOne("commuteListSizeSQL");
		return temp;
	}
	
	//근무자 근태 변경 목록 확인하기
	public List<EmpCommuteAllDTO> getCommuteAllList(int listsize, int cp,int emp_ix) {
		HashMap<String,Integer> map=new HashMap<String, Integer>();
		map.put("listsize",listsize);
		map.put("cp",cp);
		map.put("emp_ix",emp_ix);
		
		List<EmpCommuteAllDTO> list=sqlMap.selectList("getCommuteAllListSQL",map);
		return list;
	}
	
	
	
	
	
	
	//근무자의 당일 근태 현황 페이징 위한 개수 확인하기
	public int getDayCommuteListSize() {
		int res=sqlMap.selectOne("getDayCommuteListSizeSQL");
		return res;
	}
	
	//관리자가 근무자의 당일 근태 현황 보기
	public List<EmpCommuteAllDTO> getDayCommuteList(int listsize, int cp, int man_ix) {
		HashMap<String,Integer> map=new HashMap<String, Integer>();
		map.put("listsize",listsize);
		map.put("cp",cp);
		map.put("man_ix",man_ix);
		
		List<EmpCommuteAllDTO> list=sqlMap.selectList("getDayCommuteListSQL",map);
		return list;
	}
	
	//모든 근무자의 근태 변경 목록 페에징 위한 개수 확인
	public int CommuteApplyAllListSize() {
		int res=sqlMap.selectOne("CommuteApplyAllListSizeSQL");
		return res;
	}
	//관리자 모든 근무자의 근태 변경 목록 확인하기
	public List<EmpCommuteAllDTO> getCommuteApplyAllList(int listsize, int cp,int man_ix) {
		HashMap<String,Integer> map=new HashMap<String, Integer>();
		map.put("listsize",listsize);
		map.put("cp",cp);
		map.put("man_ix",man_ix);
		
		List<EmpCommuteAllDTO> list=sqlMap.selectList("getCommuteApplyAllListSQL",map);
		return list;
	}
	
	//관리자 근무자에게 반려 사유 보내기
	public int addCommuteApplyReturn(EmpCommuteApplyDTO dto) {
		int res=sqlMap.update("addCommuteApplyReturnSQL",dto);
		return res;
	}
	
	//관리자 처리상태 승인 /반려 DB값 저장
	public int addCommuteApplyProgress(EmpCommuteApplyDTO dto) {
		int res=sqlMap.update("addCommuteApplyProgressSQL",dto);
		return res;
	}
	
}
