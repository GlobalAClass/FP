package com.ateam.checkMon.schedule.model;

import java.util.HashMap;
import java.util.List;


public interface ScheduleDAO {
	
	public List<HashMap<String, Object>> getSchedule(String year,String month,int man_ix);
	public int modSchedule(int schedule_ix, String s_start_time, String s_end_time);
	public int delSchedule(int schedule_ix);
	public int addSchedule(ScheduleDTO dto);
	public List<ScheduleDTO> getScheduleEmp(int emp_ix,String year,String month,String date);
	public List<ScheduleDTO> getEmpScheduleTime(int emp_ix);
	public List<ScheduleDTO> getManScheduleTime(int man_ix);

}
