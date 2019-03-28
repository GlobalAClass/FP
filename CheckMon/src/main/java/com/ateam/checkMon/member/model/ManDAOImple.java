package com.ateam.checkMon.member.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ManDAOImple implements ManDAO {

	private SqlSessionTemplate sqlMap;

	public ManDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	//������ ȸ������ �޼ҵ�
	public int addManJoin(ManDTO mdto,StoreDTO sdto) {
		int count=sqlMap.insert("addStoreManJoinSQL",sdto);
		count = sqlMap.insert("addManJoinSQL",mdto);
		return count;
	}
	//������ ���̵� �ߺ�Ȯ�� �޼ҵ�
	public String manIdCheck(String memail) {
		String res=sqlMap.selectOne("manIdCheckSQL",memail);
		return res;
	}
	
}
