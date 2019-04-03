package com.ateam.checkMon.empCommute.model;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;

public class EmpCommuteDAOImple implements EmpCommuteDAO {

	private SqlSessionTemplate sqlMap;

	public EmpCommuteDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int commuteListSize() {
		int temp=sqlMap.selectOne("commuteListSizeSQL");
		return temp;
	}
	
	public List<EmpCommuteAllDTO> getCommuteAllList(int listsize, int cp,int emp_ix) {
		HashMap<String,Integer> map=new HashMap<String, Integer>();
		map.put("listsize",listsize);
		map.put("cp",cp);
		map.put("emp_ix",emp_ix);
		
		List<EmpCommuteAllDTO> list=sqlMap.selectList("getCommuteAllListSQL",map);
		return list;
	}
	
}
