package com.ateam.checkMon.emp.model;

import org.mybatis.spring.SqlSessionTemplate;
import java.util.*;

public class EmpDAOImple implements EmpDAO {
	
	private SqlSessionTemplate sqlMap;
	
	

	public EmpDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int empAdd(EmpDTO dto) {
		int count = sqlMap.insert("empInsert", dto);
		return count;
	}
	
	public int empDel(String name) {
		int count = sqlMap.delete("empDelete", name);
		return count;
	}
	
	public List<EmpDTO> empList() {
		List<EmpDTO> list = sqlMap.selectList("empList");
		return list;
	}
	
	public List<EmpDTO> empSelect(String name) {
		List<EmpDTO> list = sqlMap.selectList("empSelect", name);
		return list;
	}
	
	public EmpDTO empModifyForm(int idx) {
		EmpDTO dto = sqlMap.selectOne("empModify_form", idx);
		return dto;
	}

	public int empModify(EmpDTO dto) {
		int res = sqlMap.update("empModify", dto);
		return res;
	}
}
