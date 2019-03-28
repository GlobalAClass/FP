package com.ateam.checkMon.member.model;

import org.mybatis.spring.SqlSessionTemplate;

public class EmpDAOImple implements EmpDAO {

	private SqlSessionTemplate sqlMap;

	public EmpDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	//근무자 회원가입
	public int addEmpJoin(EmpDTO dto) {
		int count = sqlMap.insert("addEmpJoinSQL", dto);
		return count;
	}
	//근무자 아이디 체크
	public String empIdCheck(String eemail) {
		String res=sqlMap.selectOne("empIdCheckSQL",eemail);
		return res;
	}
	
}
