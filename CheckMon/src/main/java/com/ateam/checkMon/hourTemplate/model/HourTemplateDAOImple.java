package com.ateam.checkMon.hourTemplate.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class HourTemplateDAOImple implements HourTemplateDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public HourTemplateDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int templateListSize() {
		int res = sqlMap.selectOne("templateListSizeSQL");
		return res;
	}
	
	public List<HourTemplateDTO> getTemplateList(int man_ix) {
		List<HourTemplateDTO> list = sqlMap.selectList("getTempListSQL",man_ix);
		return list;
	}

	public List<HourTemplateDTO> getTemplateList(int listsize, int cp, int  man_ix) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("listsize", listsize);
		map.put("cp",cp);
		map.put("man_ix",man_ix);
		
		List<HourTemplateDTO> list = sqlMap.selectList("getTemplateListSQL",map);
		return list;
	}

	public int addTemplate(HourTemplateDTO hdto) {
		int res = sqlMap.insert("addTemplateSQL",hdto);
		return res;
	}

	public int delTemplate(int hour_template_ix) {
		//System.out.println("ix="+hour_template_ix);
		int res = sqlMap.delete("delTemplateSQL",hour_template_ix);
		return res;
	}

}
