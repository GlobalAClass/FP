package com.ateam.checkMon.member.model;

public class EmpDTO {
	
	//�ٹ��� �ε���
	private int empIx;
	
	//������ �ε���
	private int manIx;
	
	//�ٹ��� �̸���
	private String eemail;
	
	//�ٹ��� ��й�ȣ
	private String epwd;
	
	//�ٹ��� �̸�
	private String ename;
	
	//�ٹ��� �ڵ�����ȣ
	private String etel;
	
	//�ٹ��� �������
	private String ebirthDay;
	
	//�ٹ��� ��å��
	private String eposition;
	
	//�ٹ��� �׷��
	private String egroup;
	
	//������ ���� ����
	private String authorization;
	
	public EmpDTO() {
		super();
	}

	public EmpDTO(int empIx, int manIx, String eemail, String epwd, String ename, String etel, String ebirthDay,
			String eposition, String egroup, String authorization) {
		super();
		this.empIx = empIx;
		this.manIx = manIx;
		this.eemail = eemail;
		this.epwd = epwd;
		this.ename = ename;
		this.etel = etel;
		this.ebirthDay = ebirthDay;
		this.eposition = eposition;
		this.egroup = egroup;
		this.authorization = authorization;
	}

	public int getEmpIx() {
		return empIx;
	}

	public void setEmpIx(int empIx) {
		this.empIx = empIx;
	}

	public int getManIx() {
		return manIx;
	}

	public void setManIx(int manIx) {
		this.manIx = manIx;
	}

	public String getEemail() {
		return eemail;
	}

	public void setEemail(String eemail) {
		this.eemail = eemail;
	}

	public String getEpwd() {
		return epwd;
	}

	public void setEpwd(String epwd) {
		this.epwd = epwd;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getEtel() {
		return etel;
	}

	public void setEtel(String etel) {
		this.etel = etel;
	}

	public String getEbirthDay() {
		return ebirthDay;
	}

	public void setEbirthDay(String ebirthDay) {
		this.ebirthDay = ebirthDay;
	}

	public String getEposition() {
		return eposition;
	}

	public void setEposition(String eposition) {
		this.eposition = eposition;
	}

	public String getEgroup() {
		return egroup;
	}

	public void setEgroup(String egroup) {
		this.egroup = egroup;
	}

	public String getAuthorization() {
		return authorization;
	}

	public void setAuthorization(String authorization) {
		this.authorization = authorization;
	}
	
	
	
}
