package com.ateam.checkMon.vacation.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.ateam.checkMon.manEmpRun.model.RunListDTO;
import com.ateam.checkMon.member.model.EmpDTO;

public class VacationDAOImple implements VacationDAO {

	private SqlSessionTemplate sqlMap;
	
	public VacationDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	//----------------근무자 사용 DAO-------------------//
	
	public HashMap<String, String> getVacationDate(int schedule_ix) {
		HashMap<String, String> map = sqlMap.selectOne("getVacationDateSQL",schedule_ix);
		return map;
	}
	
	public int applyVacation(int schedule_ix, int emp_ix, String v_reason_main, String v_reason_detail, String v_date, String v_time) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("schedule_ix", schedule_ix);
		map.put("emp_ix", emp_ix);
		map.put("v_reason_main", v_reason_main);
		map.put("v_reason_detail", v_reason_detail);
		map.put("v_progress","관리자 승인 대기중");
		map.put("v_date",v_date);
		map.put("v_time",v_time);
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
	
	public List<EmpDTO> getRunList(int man_ix, String year, String month, String day) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("man_ix", man_ix);
		map.put("year",year);
		map.put("month",month);
		map.put("day",day);
		List<EmpDTO> list = sqlMap.selectList("getSubstituteListSQL", map);
		return list;
	}
	
	public int updateVacationProg(int vacation_ix) {
		int res = sqlMap.update("updateVacationProgSQL",vacation_ix);
		return res;
	}
	
	public int getNextSub() {
		int res = sqlMap.selectOne("getNextSubSQL");
		return res;
	}
	
	public int insertSub(int next_sub,int vacation_ix, String s_date, String s_time) {
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("next_sub", next_sub);
		map.put("vacation_ix", vacation_ix);
		map.put("s_date",s_date);
		map.put("s_time",s_time);
		int res = sqlMap.insert("insertSubSQL",map);
		return res;
	}
	
	public int insertSubReq(int next_sub, int emp_ix) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("next_sub", next_sub);
		map.put("emp_ix",emp_ix);
		
		int res = sqlMap.insert("insertSubReqSQL",map);
		
		return res;
	}
	
	
	public int denyVacation(int vacation_ix, String deny_reason) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("vacation_ix", vacation_ix);
		map.put("deny_reason",deny_reason);
		
		int res = sqlMap.update("denyVacationSQL",map);
		return res;
	}

}
