package com.ateam.checkMon.manEmpRun.model;

public class GroupDTO {
	private int group_ix;
	private String e_group;
	private int man_ix;
	
	public GroupDTO() {
		super();
	}
	public GroupDTO(int group_ix, String e_group, int man_ix) {
		super();
		this.group_ix = group_ix;
		this.e_group = e_group;
		this.man_ix = man_ix;
	}
	public int getGroup_ix() {
		return group_ix;
	}
	public void setGroup_ix(int group_ix) {
		this.group_ix = group_ix;
	}
	public String getE_group() {
		return e_group;
	}
	public void setE_group(String e_group) {
		this.e_group = e_group;
	}
	public int getMan_ix() {
		return man_ix;
	}
	public void setMan_ix(int man_ix) {
		this.man_ix = man_ix;
	}
	
	
}
