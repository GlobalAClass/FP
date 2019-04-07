package com.ateam.checkMon.vacation.model;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

public class VacationDAOImple implements VacationDAO {

	private SqlSessionTemplate sqlMap;
	
	public VacationDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
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

}
