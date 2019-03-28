package com.ateam.checkMon.member.model;

import org.mybatis.spring.SqlSessionTemplate;

public class EmpDAOImple implements EmpDAO {

	private SqlSessionTemplate sqlMap;

	public EmpDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	//�ٹ��� ȸ������ �޼ҵ�
	public int addEmpJoin(EmpDTO dto) {
		int count = sqlMap.insert("addEmpJoinSQL", dto);
		return count;
	}
	//�ٹ��� ���̵� �ߺ�Ȯ�� �޼ҵ�
	public String empIdCheck(String eemail) {
		String res=sqlMap.selectOne("empIdCheckSQL",eemail);
		return res;
	}
	
}
