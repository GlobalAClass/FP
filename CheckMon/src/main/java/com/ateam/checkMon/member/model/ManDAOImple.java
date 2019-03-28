package com.ateam.checkMon.member.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ManDAOImple implements ManDAO {

	private SqlSessionTemplate sqlMap;

	public ManDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	//���� �߰��� ��, ���� IX ��������
	public int getNextStoreIx() {
		int res=sqlMap.selectOne("getNextStoreIxSQL");
		return res;
	}
	
	//���� �߰� �޼ҵ�
	public int addStoreManJoin(StoreDTO sdto) {
		int count = sqlMap.insert("addStoreManJoinSQL",sdto);
		return count;
	}
	
	//������ ȸ������ �޼ҵ�
	public int addManJoin(ManDTO mdto) {
		int count = sqlMap.insert("addManJoinSQL",mdto);
		return count;
	}
	
	//������ ���̵� �ߺ�Ȯ�� �޼ҵ�
	public String manIdCheck(String memail) {
		String res=sqlMap.selectOne("manIdCheckSQL",memail);
		return res;
	}
	
}
