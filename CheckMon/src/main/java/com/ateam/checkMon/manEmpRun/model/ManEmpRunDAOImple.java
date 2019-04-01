package com.ateam.checkMon.manEmpRun.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ManEmpRunDAOImple implements ManEmpRunDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public ManEmpRunDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int addManEmpRun(ManEmpRunDTO rdto) {
		int res = sqlMap.insert("addManEmpRunSQL", rdto);
		return res;
	}

}
