package com.ateam.checkMon.hourTemplate.model;

import java.util.List;

public interface HourTemplateDAO {
	
	public int templateListSize();
	public List<HourTemplateDTO> getTemplateList(int listsize, int cp);
	public int addTemplate(HourTemplateDTO hdto);
	public int delTemplate(int ix);

}
