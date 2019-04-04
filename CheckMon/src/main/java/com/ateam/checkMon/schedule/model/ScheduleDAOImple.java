package com.ateam.checkMon.schedule.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ScheduleDAOImple implements ScheduleDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public ScheduleDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<HashMap<String, Object>> getSchedule(String year, String month) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("year", year);
		map.put("month", month);
		
		List<HashMap<String, Object>> list = sqlMap.selectList("getScheduleAllSQL",map);
		return list;
	}
	
	public int modSchedule(int schedule_ix, String s_start_time, String s_end_time) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("schedule_ix", schedule_ix);
		map.put("s_start_time", s_start_time);
		map.put("s_end_time", s_end_time);
		
		int res = sqlMap.update("modScheduleSQL",map);
		
		return res;
	}
	
	public int delSchedule(int schedule_ix) {
		int res = sqlMap.delete("delScheduleSQL",schedule_ix);
		return res;
	}

}
