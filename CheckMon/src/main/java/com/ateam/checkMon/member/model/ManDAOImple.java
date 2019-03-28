package com.ateam.checkMon.member.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ManDAOImple implements ManDAO {

	private SqlSessionTemplate sqlMap;

	public ManDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	//관리자 회원가입 메소드
	public int addManJoin(ManDTO mdto,StoreDTO sdto) {
		int count=sqlMap.insert("addStoreManJoinSQL",sdto);
		count = sqlMap.insert("addManJoinSQL",mdto);
		return count;
	}
	//관리자 아이디 중복확인 메소드
	public String manIdCheck(String memail) {
		String res=sqlMap.selectOne("manIdCheckSQL",memail);
		return res;
	}
	
}
