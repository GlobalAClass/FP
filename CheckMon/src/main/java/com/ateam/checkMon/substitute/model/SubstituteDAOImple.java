package com.ateam.checkMon.substitute.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.ateam.checkMon.schedule.model.ScheduleDTO;

public class SubstituteDAOImple implements SubstituteDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public SubstituteDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<HashMap<String, Object>> getSubstituteList(int emp_ix) {
		List<HashMap<String, Object>> list = sqlMap.selectList("getSubstituteEmpListSQL",emp_ix);
		return list;
	}
	
	public int updateSubReq(int substitute_req_ix) {
		int res = sqlMap.update("updateSubReqSQL",substitute_req_ix);
		return res;
	}
	
	public int getManSubIX(int emp_ix) {
		int res = sqlMap.selectOne("getManSubIxSQL",emp_ix);
		return res;
	}
	
	public int insertSubSchedule(ScheduleDTO dto) {
		int res  = sqlMap.insert("insertSubScheduleSQL",dto);
		return res;
	}
	
	public int updateVacationInfo(int emp_ix, int substitute_req_ix) {
		HashMap<String , Integer> map = new HashMap<String, Integer>();
		map.put("emp_ix", emp_ix);
		map.put("substitute_req_ix", substitute_req_ix);
		int res = sqlMap.update("updateVacationInfoSQL",map);
		return res;
	}
	
	public int deleteSubEmps(int substitute_req_ix, int emp_ix) {
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("substitute_req_ix", substitute_req_ix);
		map.put("emp_ix",emp_ix);
		int res = sqlMap.delete("deleteSubEmpsSQL",map);
		return res;
	}
	
	public int deleteEmpSchedule(int substitute_req_ix) {
		int res = sqlMap.delete("deleteEmpScheduleSQL",substitute_req_ix);
		return res;
	}
}
