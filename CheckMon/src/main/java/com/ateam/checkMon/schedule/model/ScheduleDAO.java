package com.ateam.checkMon.schedule.model;

import java.util.HashMap;
import java.util.List;

public interface ScheduleDAO {
	
	public List<HashMap<String, Object>> getSchedule(String year,String month);
	public int modSchedule(int schedule_ix, String s_start_time, String s_end_time);
	public int delSchedule(int schedule_ix);
	public int addSchedule(ScheduleDTO dto);
	
}
