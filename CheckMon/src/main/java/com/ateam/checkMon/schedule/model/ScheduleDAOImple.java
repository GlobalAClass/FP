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

	public List<HashMap<String, Object>> getScheduleAll() {
		List<HashMap<String, Object>> list = sqlMap.selectList("getScheduleAllSQL");
		return list;
	}

}
