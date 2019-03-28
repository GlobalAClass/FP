package com.ateam.checkMon.member.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ManDAOImple implements ManDAO {

	private SqlSessionTemplate sqlMap;

	public ManDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	//관리자 매장정보 인덱스
	public int getNextStoreIx() {
		int res=sqlMap.selectOne("getNextStoreIxSQL");
		return res;
	}
	
	//관리자 매장정보 등록
	public int addStoreManJoin(StoreDTO sdto) {
		int count = sqlMap.insert("addStoreManJoinSQL",sdto);
		return count;
	}
	
	//관리자 회원가입
	public int addManJoin(ManDTO mdto) {
		int count = sqlMap.insert("addManJoinSQL",mdto);
		return count;
	}
	
	//관리자 아이디 체크
	public String manIdCheck(String memail) {
		String res=sqlMap.selectOne("manIdCheckSQL",memail);
		return res;
	}
	
}
