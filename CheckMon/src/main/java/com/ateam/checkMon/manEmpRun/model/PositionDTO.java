package com.ateam.checkMon.manEmpRun.model;

public class PositionDTO {
	private int position_ix;
	private String e_position;
	private int priority;
	private int man_ix;
	
	public PositionDTO() {
		super();
	}
	public PositionDTO(int position_ix, String e_position, int priority, int man_ix) {
		super();
		this.position_ix = position_ix;
		this.e_position = e_position;
		this.priority = priority;
		this.man_ix = man_ix;
	}
	public int getPosition_ix() {
		return position_ix;
	}
	public void setPosition_ix(int position_ix) {
		this.position_ix = position_ix;
	}
	public String getE_position() {
		return e_position;
	}
	public void setE_position(String e_position) {
		this.e_position = e_position;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public int getMan_ix() {
		return man_ix;
	}
	public void setMan_ix(int man_ix) {
		this.man_ix = man_ix;
	};
	
	

}
