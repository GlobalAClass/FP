package com.ateam.checkMon.vacation.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class VacationDAOImple implements VacationDAO {

	private SqlSessionTemplate sqlMap;
	
	public VacationDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	//----------------근무자 사용 DAO-------------------//
	
	public int applyVacation(int schedule_ix, int emp_ix, String v_reason_main, String v_reason_detail) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("schedule_ix", schedule_ix);
		map.put("emp_ix", emp_ix);
		map.put("v_reason_main", v_reason_main);
		map.put("v_reason_detail", v_reason_detail);
		map.put("v_progress","관리자 승인 대기중");
		
		int res = sqlMap.insert("applyVacationSQL",map);

		return res;
	}
	
	public int vacationListEmpSize(int emp_ix) {
		int res = sqlMap.selectOne("vacationListSizeEmpSQL",emp_ix);
		return res;
	}
	
	public List<HashMap<String, Object>> getVacationListEmp(int listsize, int cp, int emp_ix) {

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("listsize", listsize);
		map.put("cp", cp);
		map.put("emp_ix", emp_ix);
		
		System.out.println("ㅇㅇㅇ:"+map.size());
		
		List<HashMap<String, Object>> list = sqlMap.selectList("getVacationListEmpSQL",map);
		return list;
	}
	
	public HashMap<String, String> getSubstituteEmp(int emp_ix) {
		HashMap<String,String> map = sqlMap.selectOne("getSubstituteEmpSQL",emp_ix);
		return map;
	}
	
	//--------------------관리자 사용 DAO-------------------//
	
	public int vacationListSize(int man_ix) {
		int res = sqlMap.selectOne("vacationListSizeSQL",man_ix);
		return res;
	}
	
	public List<HashMap<String, Object>> getVacationList(int listsize, int cp, int man_ix) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("listsize", listsize);
		map.put("cp",cp);
		map.put("man_ix",man_ix);
		
		List<HashMap<String, Object>> list = sqlMap.selectList("getVacationListSQL",map);
		
		return list;
	}

}
