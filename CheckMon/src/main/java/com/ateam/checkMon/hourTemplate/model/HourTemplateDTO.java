package com.ateam.checkMon.hourTemplate.model;

public class HourTemplateDTO {

	// 근무시간 템플릿 인덱스 기본키 사용
    private Integer hour_template_ix;
    
    // 근무 시간 템플릿 만든 관리자 인덱스
    private Integer man_ix;

    // 탬플릿명 근무시간 템플릿 명
    private String template_name;

    // 근무 시작 시간 근무가 시작되는 시간
    private String hour_start_time;

    // 근무 마감 시간 근무가 마감되는 시간
    private String hour_end_time;

    // 직책 해당 템플릿을 사용할 수 있는 직책
    private String template_position;

	public HourTemplateDTO() {
		super();
	}

	public HourTemplateDTO(Integer hour_template_ix, Integer man_ix, String template_name, String hour_start_time,
			String hour_end_time, String template_position) {
		super();
		this.hour_template_ix = hour_template_ix;
		this.man_ix = man_ix;
		this.template_name = template_name;
		this.hour_start_time = hour_start_time;
		this.hour_end_time = hour_end_time;
		this.template_position = template_position;
	}

	public Integer getHour_template_ix() {
		return hour_template_ix;
	}

	public void setHour_template_ix(Integer hour_template_ix) {
		this.hour_template_ix = hour_template_ix;
	}

	public Integer getMan_ix() {
		return man_ix;
	}

	public void setMan_ix(Integer man_ix) {
		this.man_ix = man_ix;
	}

	public String getTemplate_name() {
		return template_name;
	}

	public void setTemplate_name(String template_name) {
		this.template_name = template_name;
	}

	public String getHour_start_time() {
		return hour_start_time;
	}

	public void setHour_start_time(String hour_start_time) {
		this.hour_start_time = hour_start_time;
	}

	public String getHour_end_time() {
		return hour_end_time;
	}

	public void setHour_end_time(String hour_end_time) {
		this.hour_end_time = hour_end_time;
	}

	public String getTemplate_position() {
		return template_position;
	}

	public void setTemplate_position(String template_position) {
		this.template_position = template_position;
	}
	
	

	
    
}
